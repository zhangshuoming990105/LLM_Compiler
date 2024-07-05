import os
import logging
import datetime
import random
import sys
import argparse
import subprocess
from pipe_prompt import pipeline_prompts
from openai import OpenAI

from utils import get_env
from logging_config import configure_logging

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))


def pipeline_llm_compiler(src):
    """Input: src (str or Path), source code file to be compiled
    Output: None
    File Generation: test_llm.s in the same directory as src
    """
    # call the pipeline llm as compiler to obtain test_llm.s

    # Retrieval 1: call LLM with prompt 0 and src code

    # if src is path, read the content
    if os.path.isfile(src):
        src = open(src).read()

    query_0_prompt = pipeline_prompts[0] + "```c\n" + src + "```"

    completion = client.chat.completions.create(
        model="gpt-3.5-turbo", messages=[{"role": "user", "content": query_0_prompt}]
    )
    rsp_0 = completion.choices[0].message.content
    # grab the generated code between ```c and ``` in rsp_0
    generated_code = rsp_0.split("```c")[1].split("```")[0].strip()
    # write the generated code to test_driver.c
    with open("test_driver.c", "w") as f:
        f.write(generated_code)
    
    # pass


def cleanup():
    os.remove("ref")
    os.remove("ref.log")
    os.remove("hyp")
    os.remove("hyp.log")


def run_one_file(src):
    try:
        # call the pipeline llm as compiler to obtain test_llm.s
        pipeline_llm_compiler(src)
        
        return
        # gcc test_driver.c test.c -o ref
        ret = subprocess.run(["gcc", "test_driver.c", "test.c", "-o", "ref"])
        if ret.returncode != 0:
            raise Exception("Failed to compile reference code")
        # ./ref > ref.log
        ret = subprocess.run(["./ref"], stdout=open("ref.log", "w"))
        if ret.returncode != 0:
            raise Exception("Failed to run reference code")        
        # gcc test_driver.c test_llm.s -o hyp
        ret = subprocess.run(["gcc", "test_driver.c", "test_llm.s", "-o", "hyp"])
        if ret.returncode != 0:
            raise Exception("Failed to compile hyp code")
        # ./hyp > hyp.log
        ret = subprocess.run(["./hyp"], stdout=open("hyp.log", "w"))
        if ret.returncode != 0:
            raise Exception("Failed to run hyp code")
        # diff ref.log hyp.log
        ret = subprocess.run(["diff", "ref.log", "hyp.log"])
        if ret.returncode != 0:
            raise Exception("Output mismatch")
        print("Output match")

        cleanup()
    except Exception as e:
        print(e)


def main(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument("-synth", action="store_true", help="Run synthesis")
    parser.add_argument("-S", action="store_true", help="Generate assembly code")
    parser.add_argument("-o", metavar="OUTPUT_FILE", type=str, help="output file")
    parser.add_argument("-temp", metavar="OUTPUT_FILE", type=str, help="temp directory")
    parser.add_argument("input_files", nargs="*")
    args = parser.parse_args(argv)
    output_file = ""
    if args.o:
        output_file = args.o
    root_dir = get_env()
    if root_dir is None:
        print("Failed to locate the working directory!")
        exit(1)
    
    sandbox_dir = os.path.join(root_dir, "sandbox/temp")
    log_dir = os.path.join(root_dir, "logs")
    if args.temp:
        temp_dir = args.temp
        os.chdir(temp_dir)
        log_file = os.path.join(log_dir, f"setted_temp_{random.randint(0, 1000000)}.log")
    else:
        temp_name = f"temp_{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}_{random.randint(0, 1000000)}"
        temp_dir = os.path.join(sandbox_dir, temp_name)
        if not os.path.exists(temp_dir):
            os.makedirs(temp_dir, exist_ok=True)
            os.chdir(temp_dir)
        log_file = os.path.join(log_dir, f"{temp_name}.log")
    
    configure_logging(log_file)
    logging.info("Start time: " + str(datetime.datetime.now()))
    input_files = []
    for f in args.input_files:
        if f.endswith(".c"):
            input_files.append(f)
    print(input_files)
    for c_src_file in input_files:
        c_src = open(c_src_file, "r").read()
        run_one_file(c_src)
    logging.info("End time: " + str(datetime.datetime.now()))

if __name__ == "__main__":
    args = [
        "/home/mistral/workspace/LLM_Compiler/sandbox/example/example001/test.c",
        # "-temp",
        # "/home/mistral/workspace/LLM_Compiler/sandbox/temp/temp0",
        "-synth",
    ]
    main(args)
    # main(sys.argv[1:])