import os
import shutil
import random
import json
import datetime
import logging
import subprocess
import argparse
from tqdm import tqdm
from datasets import load_dataset, Dataset
from utils import get_env, workspace_clear
from models import Chat, Compiler, Decompiler, CodeTranslator
from config import (
    ANTHROPIC_AVAILABLE_MODELS,
    GPT_AVAILABLE_MODELS,
    OLLAMA_AVAILABLE_MODELS,
    PPLX_AVAILABLE_MODELS,
    DEEPSEEK_AVAILABLE_MODELS,
)
from prompts import *


def log_failed(
    failed_id,
    failed_c,
    failed_asm,
    failed_asm_ref,
    case_id,
    c_code,
    x86_llm_code,
    x86_code,
):
    failed_id.append(case_id)
    failed_c.append(c_code)
    failed_asm.append(x86_llm_code)
    failed_asm_ref.append(x86_code)


def human_eval():
    humaneval_chatter = Chat()
    dataset = load_dataset("openai/openai_humaneval")
    i = 0
    for e in dataset["test"]:
        humaneval_goal = """You are going to fill the missing code in the following Python code snippet.\n
        Be sure to return the filled code wrapped inside ```python\n and ```"""
        humaneval_goal += e["prompt"]
        humaneval_chatter.chat(user_input=humaneval_goal)
        rsp_raw = humaneval_chatter.messages[-1]["content"]
        # print(rsp_raw)
        # grep the code block, which begin with ```python and end with ```
        code = rsp_raw.split("```python")[1].split("```")[0]
        # execute the code with the unittest
        unittest = e["test"]
        ret = subprocess.run(["python", "-c", code + unittest])
        if ret.returncode == 0:
            print("Pass")
            logging.info(
                f"HumanEval {i} passed. with the following code:\n{code} and unittest:\n{unittest}"
            )
        else:
            print("Fail")
            logging.info(
                f"HumanEval {i} failed. with the following code:\n{code} and unittest:\n{unittest}"
            )
        i += 1


def python_compiler(model="gpt-4o", begin_id=0, end_id=1, use_one_shot_prompt=False):
    code_translator = CodeTranslator(model, source="python", target="c")
    gpt4_compiler = Compiler(model, use_one_shot_prompt=use_one_shot_prompt)
    compiler = gpt4_compiler
    dataset = load_dataset("openai/openai_humaneval")
    case_id = 0
    for e in dataset["test"]:
        if case_id < begin_id:
            case_id += 1
            continue
        human_eval_py_code = ""
        human_eval_py_code += e["prompt"]
        human_eval_py_code += e["canonical_solution"]

        human_eval_driver_code = ""
        human_eval_driver_code += e["test"]
        human_eval_driver_code += """check_candidate()"""

        code_translator.translate(
            human_eval_py_code,
            specify_out_file="humaneval.c",
            desc_post=r"[INST]Only provide me with the #Output part. Check carefully with the escape characters, to make sure the Output code is correct.[\INST]",
            reset_messages=False,
        )
        code_translator.translate(
            human_eval_driver_code,
            specify_out_file="humaneval_driver.c",
            desc_pre=r'[INST]Continue to translate the driver function from Python to C.\nFor the Python function with its body pass, like "def foo()->int:\npass" we generate a function declaration in C, like "int foo();".[\INST]',
            desc_post=r"[INST]Only provide me with the #Output part.[\INST]",
        )
        # llm compilation
        compiler.compile("humaneval.c", out="humaneval_llm.s")

        # gcc compile ref
        ret = subprocess.run(
            ["gcc", "-S", "humaneval_driver.c", "humaneval.c", "-o", "ref"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        if ret.returncode != 0:
            logging.warning(f"Failed to compile the driver code!")
            logging.info(
                f"stdout: \n{ret.stdout.decode()}\nstderr: \n{ret.stderr.decode()}"
            )
            break
        # gcc compile hyp
        ret = subprocess.run(
            ["gcc", "humaneval_driver.c", "humaneval_llm.s", "-o", "hyp"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        if ret.returncode != 0:
            logging.warning(f"Failed to compile the driver code!")
            logging.info(
                f"stdout: \n{ret.stdout.decode()}\nstderr: \n{ret.stderr.decode()}"
            )
        case_id += 1
        if case_id >= end_id:
            break


def examine_exebench(input_count, case_id, try_k, round=0):
    error_message = ""
    ret = subprocess.run(
        ["g++", "tmp.s", "tmp_driver.s", "-o", "tmp"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    if ret.returncode != 0:
        logging.warning(
            f"{try_k}th try {round} round in {case_id} failed to assemble the code to executable!"
        )
        # not compilable, so all failed
        error_message = f"""Compilation error: Failed to assemble the assembly code to executable!
where compilation error is:
stdout:
{ret.stdout.decode()}
stderr:
{ret.stderr.decode()}
"""
        logging.debug(f"###error message: {error_message}")
        return (
            False,
            error_message,
        )
    local_err = 0
    local_succ = 0
    for j in range(input_count):
        try:
            ret = subprocess.run(
                [
                    "./tmp",
                    f"input/in{j}.json",
                    f"output/out{j}_real.json",
                ],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                timeout=10,
            )
        except subprocess.TimeoutExpired:
            logging.warning(
                f"WARNING: code execute timeout for input {j} in case {case_id}"
            )
            # organize the error message
            # for context length limit, we only report the last error
            error_message = f"""Runtime error: input {j} in case {case_id} failed because of timeout.
Inputs are: 
{open(f"input/in{j}.json", "r").read()}
Expected outputs are:
{open(f"output/out{j}.json", "r").read()}
The real output is: None, because of timeout.
----------
"""

            local_err += 1
            continue
        if ret.returncode != 0:
            logging.warning(
                f"WARNING: code failed to execute for input {j} in case {case_id}"
            )
            # for context length limit, we only report the last error
            error_message = f"""input {j} in case {case_id} failed because of runtime error.
Inputs are: 
{open(f"input/in{j}.json", "r").read()}
Expected outputs are:
{open(f"output/out{j}.json", "r").read()}
Run stdout:
{ret.stdout.decode()}
Run stderr:
{ret.stderr.decode()}
----------
"""
            local_err += 1
            continue
        # compare the output with the expected output
        with open(f"output/out{j}_real.json", "r") as f:
            real_output = f.read()
        with open(f"output/out{j}.json", "r") as f:
            expected_output = f.read()
        try:
            json_my = json.loads(real_output)
            json_ref = json.loads(expected_output)
        except json.JSONDecodeError:
            logging.error(f"SKIP: json decode failed for input {j}")
            local_err += 1
            break
        if json_my == json_ref:
            local_succ += 1
        else:
            local_err += 1
            # for context length limit, we only report the last error
            error_message += f"""input {j} in case {case_id} failed because of output mismatch.
Driver Code is:
{open("tmp_driver.cpp", "r").read()}
Inputs are: 
{open(f"input/in{j}.json", "r").read()}
Expected outputs are:
{open(f"output/out{j}.json", "r").read()}
Actual outputs are:
{open(f"output/out{j}_real.json", "r").read()}
----------
"""
    logging.info(f"Local error rate: {local_err*100 / input_count}%")
    if local_err == 0:
        logging.info(f"{try_k}th try {round} round in {case_id} succeeded")
        return True, error_message
    else:
        logging.info(f"{try_k}th try {round} round in {case_id} failed")
        logging.info(f"error message: {error_message}")
        return False, error_message


def c_compiler(
    model="gpt-4o",
    begin_id=0,
    end_id=100,
    use_one_shot_prompt=False,
    use_zero_shot_prompt=False,
    use_local=False,
    temperature=0.3,
    peft_model="",
    pass_k=1,
    self_correct=False,  # whether to use self-correcting mechanism
    self_correct_round=3,  # the number of self-correcting rounds
    do_analyze=False,
):
    """
    Compile the C code of ExeBench to assembly code and then to executable code.
    Return Pass@k accuracy.
    Supported Models: see config.py, and local model through huggingface checkpoint
    """
    compiler = Compiler(
        model,
        use_one_shot_prompt=use_one_shot_prompt,
        use_zero_shot_prompt=use_zero_shot_prompt,
        use_local=use_local,
        temperature=temperature,
        peft_model=peft_model,
    )
    # ds = load_dataset("jordiae/exebench")["train_real_simple_io"]
    ds = load_dataset("mistral0105/exebench_io_validated_full_cleaned")["train"]
    # select validate example to a new dataset, by checking compile status and execution status
    passed_id = []
    failed_id = []
    failed_c = []
    failed_asm = []
    failed_asm_ref = []
    first_pass_id = []
    case_id = 0
    total_id = end_id - begin_id

    # ds = ds[begin_id:end_id]
    for e in ds:
        # we want to use case_id-begin_id/total_id as the progress bar
        progress_bar = tqdm(
            total=total_id,
            initial=case_id - begin_id,
            dynamic_ncols=True,
        )
        progress_bar.update(1)
        if case_id < begin_id:
            case_id += 1
            continue
        if case_id >= end_id:
            break
        try:
            # if True:
            id = 0
            x86_id = None
            for name in e["asm"]["target"]:
                if name == "real_gcc_x86_O0":
                    x86_id = id
                # elif name == "real_gcc_arm_O0":
                #     arm_id = id
                else:
                    id += 1
            if x86_id == None:
                case_id += 1
                continue
            x86_code = e["asm"]["code"][x86_id]
            # arm_code = e["asm"]["code"][arm_id]
            c_deps: str = e["real_deps"]
            # rm the "# 1" in the end
            c_deps = c_deps[: c_deps.rfind("# 1")]
            c_code = c_deps
            c_code += e["func_def"]
            # driver code
            c_exe = e["real_exe_wrapper"]
            if c_exe == None:
                case_id += 1
                continue
            c_exe_cleaned = c_exe
            start = c_exe.find("""extern "C" {""")
            end = c_exe.find("}", start + 1)
            func_decl = e["func_def"]
            end2 = func_decl.find("{")
            func_decl = func_decl[:end2]
            c_exe_cleaned = (
                c_exe[:start]
                + 'extern "C" {\n'
                + func_decl
                + ";\n}\n"
                + c_exe[end + 1 :]
            )
            # remove the following part from c_exe_cleaned(unknown/unused header)
            """#include <clib/synthesizer.h>"""
            start = c_exe_cleaned.find("#include <clib/synthesizer.h")
            end = c_exe_cleaned.find(">", start + 1)
            c_exe_cleaned2 = c_exe_cleaned[:start] + c_exe_cleaned[end + 1 :]
            final_c_exe = c_exe_cleaned2

            # IO pairs
            inputs = e["real_io_pairs"]["input"]
            outputs = e["real_io_pairs"]["output"]
            if len(inputs) == 0 and len(outputs) == 0:
                case_id += 1
                continue
            var_values_dict: dict = {}
            out_dict: dict = {}
            out_count = 0
            input_count = 0
            for pair in inputs:
                input_count += 1
                for i in range(len(pair["var"])):
                    var = pair["var"][i]
                    value = pair["value"][i]
                    if var not in var_values_dict:
                        var_values_dict[var] = []
                    cur_values = var_values_dict[var]
                    cur_values.append(value)
            for pair in outputs:
                out_count += 1
                for i in range(len(pair["var"])):
                    var = pair["var"][i]
                    value = pair["value"][i]
                    if var not in out_dict:
                        out_dict[var] = []
                    out_dict[var].append(value)

            if not os.path.exists("input"):
                os.mkdir("input")
            os.chdir("input")
            for i in range(input_count):
                data_file = open(f"in{i}.json", "w")
                data_file.write("{\n")
                for j, (k, v) in enumerate(var_values_dict.items()):
                    value = v[i]
                    data_file.write(f'    "{k}": {value}')
                    if j != len(var_values_dict) - 1:
                        data_file.write(",")
                    data_file.write("\n")
                data_file.write("}")
                data_file.close()
            os.chdir("..")

            if not os.path.exists("output"):
                os.mkdir("output")
            os.chdir("output")
            for i in range(out_count):
                data_file = open(f"out{i}.json", "w")
                data_file.write("{\n")

                for j, (k, v) in enumerate(out_dict.items()):
                    value = v[i]
                    data_file.write(f'    "{k}": {value}')
                    if j != len(out_dict) - 1:
                        data_file.write(",")
                    data_file.write("\n")
                data_file.write("}\n")
                data_file.close()
            os.chdir("..")

            with open("tmp.c", "w") as f:
                if c_code is not None:
                    f.write(c_code)
                    f.close()
            logging.info(f"C code :\n{c_code}")

            with open("tmp_ref.s", "w") as f:
                if x86_code is not None:
                    f.write(x86_code)
                    f.close()
            with open(f"tmp_driver.cpp", "w") as f:
                if final_c_exe is not None:
                    f.write(final_c_exe)
                    f.close()

            # using g++ to compile each file
            ret = subprocess.run(
                ["g++", "-S", "tmp_driver.cpp", "-o", "tmp_driver.s"],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
            )
            if ret.returncode != 0:
                logging.warning(f"CASE {case_id} Failed to compile the driver code!")
                case_id += 1
                continue

            any_pass = False
            first_pass = False
            for try_k in range(pass_k):
                compiler.compile("tmp.c")
                success, error_message = examine_exebench(input_count, case_id, try_k)
                x86_llm_code = open("tmp.s", "r").read()
                if success:
                    any_pass = True
                    if try_k == 0:
                        first_pass = True
                    break
                else:
                    if self_correct:
                        numerical = False
                        hex_octal = False
                        functioncall = False
                        recursive = False
                        if do_analyze:
                            # TODO: expand the analyzis to more types
                            rsp = compiler.analyze(
                                code=c_code,
                                temperature=temperature,
                                error_message=error_message,
                            )
                            logging.debug("Analyze response: " + rsp)
                            helper_message = ""
                            key_list = rsp.split(",")

                            for item in key_list:
                                item = item.strip()
                                if item in fix_prompts.keys():
                                    helper_message += fix_prompts[item]
                            logging.debug(f"Helper message: {helper_message}")

                        for round in range(self_correct_round):
                            compiler.compile_with_error_message(
                                "tmp.c",
                                error_asm=x86_llm_code,
                                error_message=error_message,
                                prompt_postfix=helper_message,
                            )
                            correct_success, error_message = examine_exebench(
                                input_count, case_id, try_k, round + 1
                            )
                            x86_llm_code = open("tmp.s", "r").read()
                            if correct_success:
                                any_pass = True
                                break
                        if any_pass:
                            break
            if any_pass:
                logging.info(f"CASE {case_id} success")
                passed_id.append(case_id)
                if first_pass:
                    first_pass_id.append(case_id)
            else:
                logging.info(f"CASE {case_id} fail")
                # for simplicity, pass_k only record the last try
                log_failed(
                    failed_id,
                    failed_c,
                    failed_asm,
                    failed_asm_ref,
                    case_id,
                    c_code,
                    x86_llm_code,
                    x86_code,
                )
            case_id += 1
            if case_id >= end_id:
                progress_bar.close()
                break
        except Exception as e:
            logging.error(f"Unexpected Error: {e}")
            case_id += 1
            continue

    logging.info("Done")
    logging.info(f"Passed cases: {passed_id}")
    logging.info(f"First pass cases: {first_pass_id}")
    logging.info(f"Failed cases: {failed_id}")
    logging.info(f"First pass rate: {len(first_pass_id)*100 / (end_id-begin_id)}%")
    logging.info(f"Pass rate: {len(passed_id)*100 / (end_id-begin_id)}%")
    # save failed cases to a new directory named failed under current
    if not os.path.exists("failed"):
        os.mkdir("failed")
    os.chdir("failed")
    for i in range(len(failed_id)):
        case_id = failed_id[i]
        with open(f"case_{case_id}.c", "w") as f:
            f.write(failed_c[i])
            f.close()
        with open(f"case_{case_id}_llm.s", "w") as f:
            f.write(failed_asm[i])
            f.close()
        with open(f"case_{case_id}_ref.s", "w") as f:
            f.write(failed_asm_ref[i])
            f.close()


def x86_simulate(model="gpt-4o", temperature=0.3, x86_src="", c_src="", init_value=""):
    compiler = Compiler(
        model,
        temperature=temperature,
        use_one_shot_prompt=True,
    )
    compiler.simulate(x86_src, c_src=c_src, init_value=init_value)
    # ask it to fix the assembly code, make it equivalent to the C code
    fix_prompts = """there are semantic difference between the C code and x86 code, 
now try to simulate the C code to find out the expected output in the x86 code(don't trust the x86 code yet),
then based on the expected output, fix the x86 code to make it semantically equal to the C code.
think carefully on the C code execution to fix your x86 code output.
After your fix, you can re-simulate the x86 code to check if it is correct.
"""
    compiler.chat(user_input=fix_prompts, temperature=compiler.temperature)
    rsp = compiler.messages[-1]["content"]
    logging.info(f"Fix response: {rsp}")
    compiler.message_reset()
    

    
    


if __name__ == "__main__":
    # 1. environment setup
    root_dir = get_env()
    if root_dir is None:
        print("Failed to locate the working directory!")
        exit(1)
    python_dir = os.path.join(root_dir, "python")
    sandbox_dir = os.path.join(root_dir, "sandbox/temp")
    log_dir = os.path.join(root_dir, "logs")

    # 2. configure experiment parameters
    # default parameters
    candidate_model = "codestral:22b-v0.1-f16"
    need_log = True
    use_local = False
    begin_id = 0
    end_id = 100
    prompt_style = "one"

    # 3. parse command line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--model", type=str, default="gpt-4o")
    parser.add_argument("--begin_id", type=int, default=84)
    parser.add_argument("--end_id", type=int, default=85)
    parser.add_argument("--prompt_style", type=str, default="one")
    parser.add_argument("--use_local", type=bool, default=False)
    parser.add_argument("--need_log", type=bool, default=True)
    parser.add_argument("--temperature", type=float, default=0.8)
    parser.add_argument("--peft_model", type=str, default="")
    parser.add_argument("--pass_k", type=int, default=1)
    parser.add_argument("--self_correct", type=bool, default=True)
    parser.add_argument("--correct_round", type=int, default=3)
    parser.add_argument("--logging_level", type=str, default="INFO")
    parser.add_argument("--do_analyze", type=bool, default=True)
    S = parser.parse_args()
    candidate_model = S.model
    begin_id = S.begin_id
    end_id = S.end_id
    prompt_style = S.prompt_style
    use_local = S.use_local
    need_log = S.need_log
    temperature = S.temperature
    peft_model = S.peft_model
    pass_k = S.pass_k
    self_correct = S.self_correct
    correct_round = S.correct_round
    logging_level = S.logging_level
    do_analyze = S.do_analyze
    if prompt_style == "one":
        use_one_shot_prompt = True
        use_zero_shot_prompt = False
    elif prompt_style == "zero":
        use_one_shot_prompt = False
        use_zero_shot_prompt = True
    elif prompt_style == "cot":
        use_one_shot_prompt = False
        use_zero_shot_prompt = False
    else:
        use_one_shot_prompt = False
        use_zero_shot_prompt = False

    # check if the model is available
    ALL_MODELS = (
        ANTHROPIC_AVAILABLE_MODELS
        + GPT_AVAILABLE_MODELS
        + OLLAMA_AVAILABLE_MODELS
        + PPLX_AVAILABLE_MODELS
        + DEEPSEEK_AVAILABLE_MODELS
    )
    if candidate_model not in ALL_MODELS and not use_local:
        print(f"Model {candidate_model} is not available!")
        exit(1)

    temp_name = f"temp_{candidate_model}_{begin_id}_{end_id}_{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}_{random.randint(0, 1000000)}"
    temp_dir = os.path.join(sandbox_dir, temp_name)
    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir, exist_ok=True)
        os.chdir(temp_dir)
    log_file = os.path.join(log_dir, f"{temp_name}.log")

    if logging_level == "DEBUG":
        level = logging.DEBUG
    elif logging_level == "INFO":
        level = logging.INFO
    elif logging_level == "WARNING":
        level = logging.WARNING
    elif logging_level == "ERROR":
        level = logging.ERROR

    if need_log:
        logging.basicConfig(filename=log_file, level=level)
    else:
        logging.basicConfig(level=level)
    logging.info("log file created!")
    logging.info("Start time: " + str(datetime.datetime.now()))
    logging.info("Current run:" + temp_name)

    # c_compiler(
    #     model=candidate_model,
    #     begin_id=begin_id,
    #     end_id=end_id,
    #     use_one_shot_prompt=use_one_shot_prompt,
    #     use_zero_shot_prompt=use_zero_shot_prompt,
    #     use_local=use_local,
    #     temperature=temperature,
    #     peft_model=peft_model,
    #     pass_k=pass_k,
    #     self_correct=self_correct,
    #     self_correct_round=correct_round,
    #     do_analyze=do_analyze,
    # )
    x86_simulate(
        model=candidate_model,
        temperature=temperature,
        x86_src=open(
            "/root/workspace/LLM_Compiler/temp/431_f94/llm.s", "r"
        ).read(),
        c_src=open(
            "/root/workspace/LLM_Compiler/temp/431_f94/func.c", "r"
        ).read(),
        init_value="x=15, y=16",
    )

    logging.info("End time: " + str(datetime.datetime.now()))
