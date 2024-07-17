import os
import logging
import datetime
import random
import shutil
import sys
import argparse
import subprocess
from pipe_prompt import pipeline_prompts, direct_prompts
from openai import OpenAI

from utils import get_env

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))


def pipeline_synthesis(src, verbose=False, model="gpt-3.5-turbo"):
    """Input:
    * src (str or Path), source code file to be compiled
    * verbose (bool), whether to log the generated code
    File Generation: test_driver.c in the same directory as src
    """
    # if src is path, read the content
    if os.path.isfile(src):
        src = open(src).read()

    query_0_prompt = pipeline_prompts[0] + "```c\n" + src + "```"

    completion = client.chat.completions.create(
        model=model, messages=[{"role": "user", "content": query_0_prompt}]
    )
    rsp_0 = completion.choices[0].message.content
    # grab the generated code between ```c and ``` in rsp_0
    generated_code = rsp_0.split("```c")[1].split("```")[0].strip()
    # write the generated code to test_driver.c
    with open("test_driver.c", "w") as f:
        f.write(generated_code)
        if verbose:
            logging.info(f"test_driver.c: \n{generated_code}")


def pipeline_compile(
    src, verbose=False, compile_strategy="straight", compiler_model="gpt-3.5-turbo"
):
    """Input:
    * src (str or Path), source code file to be compiled
    * verbose (bool), whether to log the generated code
    * compile_strategy (str), the strategy to compile the code
        * straight: compile the code directly with minimal prompt
        * rewrite: rewrite the code before compiling
        * CoT: compile the code with CoT
        * RAG: compile the code with RAG
    * compiler_model (str), the model to use for compilation
    Output: None
    File Generation: test_llm.s in the same directory as src
    """
    if os.path.isfile(src):
        src = open(src).read()

    if compile_strategy == "straight":
        query_prompt = direct_prompts[0] + "```c\n" + src + "```"
        completion = client.chat.completions.create(
            model=compiler_model, messages=[{"role": "user", "content": query_prompt}]
        )
        rsp = completion.choices[0].message.content
        # grab the generated code between ```x86 and ``` in rsp
        asm_code = rsp.split("```x86")[1].split("```")[0].strip()
        # write the generated code to test_llm.s
        with open("test_llm.s", "w") as f:
            f.write(asm_code)
            if verbose:
                logging.info(f"test_llm.s: \n{asm_code}")
    elif compile_strategy == "rewrite":
        # rewrite 1
        query_1_prompt = pipeline_prompts[1] + "```c\n" + src + "```"
        completion = client.chat.completions.create(
            model=compiler_model, messages=[{"role": "user", "content": query_1_prompt}]
        )
        rsp_1 = completion.choices[0].message.content
        # grab the generated code between ```c and ``` in rsp_1
        rewrite1 = rsp_1.split("```c")[1].split("```")[0].strip()
        # write the generated code to test_driver.c
        with open("rewrite1.c", "w") as f:
            f.write(rewrite1)
            if verbose:
                logging.info(f"rewrite1.c: \n{rewrite1}")

        # rewrite 2
        query_2_prompt = pipeline_prompts[2] + "```c\n" + src + "```"
        completion = client.chat.completions.create(
            model=compiler_model, messages=[{"role": "user", "content": query_2_prompt}]
        )
        rsp_2 = completion.choices[0].message.content
        # grab the generated code between ```c and ``` in rsp_2
        rewrite2 = rsp_2.split("```c")[1].split("```")[0].strip()
        # write the generated code to test_driver.c
        with open("rewrite2.c", "w") as f:
            f.write(rewrite2)
            if verbose:
                logging.info(f"rewrite2.c: \n{rewrite2}")

        # compile
        query_3_prompt = pipeline_prompts[3] + "```c\n" + src + "```"
        completion = client.chat.completions.create(
            model=compiler_model, messages=[{"role": "user", "content": query_3_prompt}]
        )
        rsp_3 = completion.choices[0].message.content
        # grab the generated code between ```x86 and ``` in rsp_3
        asm_code = rsp_3.split("```x86")[1].split("```")[0].strip()
        # write the generated code to test_llm.s
        with open("test_llm.s", "w") as f:
            f.write(asm_code)
            if verbose:
                logging.info(f"test_llm.s: \n{asm_code}")
    else:
        raise NotImplementedError(f"Compile strategy {compile_strategy} not implemented")


def run_cleanup(sandbox_dir, log_dir):
    # rm all the temp files in the sandbox
    for dir in os.listdir(sandbox_dir):
        if dir.startswith("temp_"):
            shutil.rmtree(os.path.join(sandbox_dir, dir))

    for file in os.listdir(log_dir):
        if file.startswith("temp_"):
            os.remove(os.path.join(log_dir, file))


def run_one_file(
    src,
    verbose=False,
    step=5,
    compile_strategy="straight",
    compiler_model="gpt-3.5-turbo",
):
    AVAILABLE_STRATEGIES = ["straight", "rewrite", "CoT", "RAG"]
    if compile_strategy not in AVAILABLE_STRATEGIES:
        logging.error(f"Invalid compile strategy: {compile_strategy}")
        return
    try:
        if step >= 1:
            # synth driver code
            pipeline_synthesis(src, verbose, model=compiler_model)
        if step >= 2:
            # llm compile code to assembly
            pipeline_compile(src, verbose, compile_strategy=compile_strategy, compiler_model=compiler_model)
        if step >= 3:
            # compile code+driver-> ref, assembly+driver-> hyp
            # gcc test_driver.c test.c -o ref
            ret = subprocess.run(["gcc", "test_driver.c", "test.c", "-o", "ref"])
            if ret.returncode != 0:
                raise Exception("Failed to compile reference code")
            # gcc test_driver.c test_llm.s -o hyp
            ret = subprocess.run(["gcc", "test_driver.c", "test_llm.s", "-o", "hyp"])
            if ret.returncode != 0:
                raise Exception("Failed to compile hyp code")
        if step >= 4:
            # run ref and hyp
            # ./ref > ref.log
            ret = subprocess.run(["./ref"], stdout=open("ref.log", "w"))
            if ret.returncode != 0:
                raise Exception("Failed to run reference code")
            # ./hyp > hyp.log
            ret = subprocess.run(["./hyp"], stdout=open("hyp.log", "w"))
            if ret.returncode != 0:
                raise Exception("Failed to run hyp code")
            if verbose:
                logging.info("Reference output:")
                logging.info(open("ref.log").read())
                logging.info("Hypothesis output:")
                logging.info(open("hyp.log").read())
        if step >= 5:
            # diff ref.log hyp.log
            ret = subprocess.run(["diff", "ref.log", "hyp.log"])
            if ret.returncode != 0:
                raise Exception("Output mismatch")
            logging.info("Output match")
    except Exception as e:
        logging.error(e)


def main(argv):
    root_dir = get_env()
    if root_dir is None:
        print("Failed to locate the working directory!")
        exit(1)
    parser = argparse.ArgumentParser()
    # steps: 1. synth 2. compile 3. assemble 4. run 5. compare
    step = 5
    parser.add_argument("-dry", action="store_true", help="Dry run")
    parser.add_argument("-synth", action="store_true", help="Run synthesis only")
    parser.add_argument("-S", action="store_true", help="Generate assembly code only")
    parser.add_argument("-c", action="store_true", help="Compile only")
    parser.add_argument("-r", action="store_true", help="Run only")
    parser.add_argument("-full", action="store_true", help="Run full pipeline")
    parser.add_argument("-clean", action="store_true", help="Clean up")
    parser.add_argument("-temp", metavar="OUTPUT_FILE", type=str, help="temp directory")
    parser.add_argument("input_files", nargs="*")
    args = parser.parse_args(argv)

    if args.dry:
        step = 0
    elif args.synth:
        step = 1
    elif args.S:
        step = 2
    elif args.c:
        step = 3
    elif args.r:
        step = 4
    elif args.full:
        step = 5

    cleanup = False
    if args.clean:
        cleanup = True

    sandbox_dir = os.path.join(root_dir, "sandbox/temp")
    log_dir = os.path.join(root_dir, "logs")
    if args.temp:
        temp_dir = args.temp
        os.chdir(temp_dir)
        log_file = os.path.join(
            log_dir, f"setted_temp_{random.randint(0, 1000000)}.log"
        )
    else:
        temp_name = f"temp_{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}_{random.randint(0, 1000000)}"
        temp_dir = os.path.join(sandbox_dir, temp_name)
        if not os.path.exists(temp_dir):
            os.makedirs(temp_dir, exist_ok=True)
            os.chdir(temp_dir)
        log_file = os.path.join(log_dir, f"{temp_name}.log")

    logging.basicConfig(filename=log_file, level=logging.INFO)
    logging.info("Start time: " + str(datetime.datetime.now()))
    input_files = []
    for f in args.input_files:
        if f.endswith(".c"):
            input_files.append(f)
    logging.info(input_files)
    for c_src_file in input_files:
        c_src = open(c_src_file, "r").read()
        # copy the file to workspace
        c_src_file_name = os.path.basename(c_src_file)
        shutil.copy(c_src_file, c_src_file_name)
        run_one_file(c_src, verbose=True, step=step, compiler_model="gpt-4o")
    if cleanup:
        run_cleanup(sandbox_dir, log_dir)
    logging.info("End time: " + str(datetime.datetime.now()))


if __name__ == "__main__":
    # args = [
    #     # "/data/zhangshuoming/data_workspace/LLM_Compiler/sandbox/example/example001/test.c",
    #     # "-full",
    #     # "-clean",
    # ]
    # main(args)
    main(sys.argv[1:])
