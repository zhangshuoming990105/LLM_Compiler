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
cached_pass_id: dict = {
    "gpt-4o": {
        "baseline": [0, 1, 2, 5, 9, 16, 20, 23, 30, 32, 33, 34, 38, 40, 42, 45, 51, 56, 59, 63, 70, 73, 76, 78, 81, 84, 87, 88, 95, 98],
        "pass@5": [1, 2, 5, 9, 20, 30, 32, 42, 59, 95, 98],
        "fix": [9, 30, 32, 42, 95],
        "annotation": [95],
        "LEGO": None,
    },
    "deepseek-coder": {
        "baseline": [7, 33, 42, 53, 59, 60, 73, 84, 86, 95, 98],
        "pass@5": [33, 42, 59, 60, 73, 86, 95, 98],
        "fix": None,
        "annotation": None,
        "LEGO": None,
    },
    "claude-3-5-sonnet-20240620": {
        "baseline": [4, 9, 30, 33, 42, 53, 55, 59, 73, 92, 95, 98],
        "pass@5": [9, 30, 42, 95],
        "fix": [],
        "annotation": [],
        "LEGO": [],
    },
    "gpt-4o-mini": {
        "baseline": [0, 1, 2, 4, 5, 7, 9, 15, 20, 30, 32, 33, 34, 39, 40, 51, 54, 56, 59, 60, 63, 71, 73, 74, 75, 76, 78, 80, 81, 84, 86, 87, 88, 89, 92, 93, 95, 98, 100, 103, 109, 113, 115, 124, 126, 127, 129, 137, 139, 140, 142, 148, 150, 151, 154, 159, 160, 161, 170, 174, 175, 180, 182, 183, 185, 187, 188, 194, 195, 198, 199, 202, 207, 209, 210, 212, 216, 217, 218, 219, 220, 222, 223, 224, 228, 230, 231, 232, 233, 234, 237, 238, 239, 240, 241, 246, 249, 252, 256, 258, 260, 261, 262, 263, 267, 270, 277, 278, 281, 284, 290, 291, 293, 296, 300, 301, 303, 311, 318, 320, 322, 323, 324, 329, 331, 333, 335, 336, 343, 344, 347, 348, 349, 352, 353, 354, 355, 356, 358, 359, 362, 363, 365, 366, 368, 373, 375, 380, 381, 382, 385, 386, 395, 397, 399, 404, 407, 409, 410, 416, 421, 422, 427, 428, 429, 430, 431, 433, 434, 441, 442, 444, 445, 447, 452, 454, 455, 456, 458, 459, 460, 461, 463, 464, 468, 470, 473, 474, 475, 478, 479, 480, 481, 483, 485, 486, 489, 490, 492, 493, 495, 496, 497, 498, 499],
        "pass@5": None,
        "fix": None,
        "annotation": None,
        "LEGO": None,
    },
    "claude-3-haiku-20240307": {
        "baseline": [4, 7, 9, 32, 33, 39, 40, 42, 53, 54, 59, 66, 73, 83, 84, 86, 87, 88, 89, 93, 95, 98, 100, 101, 107, 109, 113, 114, 119, 127, 136, 137, 139, 150, 159, 161, 170, 174, 180, 182, 187, 190, 191, 194, 202, 207, 208, 209, 212, 214, 216, 218, 219, 220, 222, 223, 224, 228, 231, 234, 239, 240, 241, 243, 245, 246, 252, 256, 258, 260, 261, 266, 270, 277, 284, 287, 288, 290, 293, 295, 298, 299, 300, 301, 304, 307, 311, 318, 324, 333, 347, 348, 349, 351, 353, 356, 358, 359, 362, 363, 364, 365, 367, 368, 373, 375, 380, 381, 382, 387, 391, 404, 407, 409, 410, 413, 417, 422, 427, 428, 429, 430, 431, 433, 441, 442, 445, 454, 455, 456, 458, 459, 460, 461, 462, 463, 464, 468, 470, 471, 473, 475, 480, 481, 482, 484, 491, 492, 493, 495, 496, 497, 498],
        "pass@5": [4, 7, 9, 32, 42, 54, 59, 73, 83, 86, 87, 88, 89, 93, 95, 98, 101, 107, 109, 113, 119, 136, 137, 150, 159, 161, 170, 180, 187, 191, 202, 207, 208, 216, 218, 219, 224, 228, 231, 234, 239, 240, 245, 246, 252, 256, 260, 261, 270, 277, 287, 288, 290, 295, 299, 300, 301, 311, 318, 324, 333, 347, 348, 349, 353, 356, 358, 359, 362, 363, 364, 365, 367, 368, 375, 380, 381, 382, 387, 404, 407, 409, 410, 413, 417, 422, 428, 431, 433, 441, 442, 455, 456, 458, 459, 461, 463, 464, 468, 471, 473, 475, 480, 484, 491, 492, 493, 495, 497, 498],
        "fix": [32, 73, 86, 87, 95, 98],
        "annotation": None,
        "LEGO": None,
    },
    "codestral:22b-v0.1-f16": {
        "baseline": [1, 5, 9, 16, 19, 20, 30, 33, 34, 39, 42, 45, 51, 53, 59, 60, 73, 74, 76, 84, 86, 87, 88, 93, 95, 98, 101, 109, 110, 113, 114, 121, 124, 126, 128, 133, 136, 148, 150, 159, 170, 183, 187, 188, 191, 194, 196, 198, 202, 207, 208, 209, 214, 216, 219, 220, 224, 226, 228, 240, 245, 256, 258, 260, 261, 266, 270, 274, 277, 278, 284, 285, 287, 293, 294, 297, 299, 300, 301, 311, 318, 320, 322, 323, 324, 329, 333, 344, 347, 349, 353, 356, 358, 359, 362, 363, 365, 367, 368, 373, 376, 379, 380, 381, 385, 395, 400, 404, 409, 410, 413, 416, 417, 420, 422, 425, 429, 430, 431, 434, 441, 442, 455, 456, 458, 459, 461, 465, 468, 473, 475, 480, 484, 486, 489, 490, 491, 493, 495, 497],
        "pass@5": None,
        "fix": None,
        "annotation": None,
        "LEGO": None,
    }
}


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
            # we don't need the driver code itself, because it is not the focus
            error_message = f"""input {j} in case {case_id} failed because of output mismatch.
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


def c_compiler_exebench(
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
    use_mask=False,
    mask_stage="baseline",
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
    ds = load_dataset("mistral0105/exebench_io_validated_full_cleaned")[
        "train"
    ]  # this ds is already shuffled, so use it directly
    # select validate example to a new dataset, by checking compile status and execution status
    passed_id = []
    failed_id = []
    failed_c = []
    failed_asm = []
    failed_asm_ref = []
    first_pass_id = []
    case_id = 0
    total_id = end_id - begin_id
    progress_bar = tqdm(
        total=total_id,
        initial=0,
        dynamic_ncols=True,
    )
    # ds = ds[begin_id:end_id]
    if use_mask:
        failed_ids = [i for i in range(begin_id, end_id)]
        if cached_pass_id[model][mask_stage] is not None:
            logging.info(f"Found previous cached results for {model}: {mask_stage}")
            failed_ids = cached_pass_id[model][mask_stage]      
        else:
            failed_ids = [i for i in range(begin_id, end_id)]
        mask_ids = [i for i in range(begin_id, end_id) if i not in failed_ids]
    else:
        mask_ids = []
    logging.info(f"Masked ids: {mask_ids}")
    for e in ds:
        # we want to use case_id-begin_id/total_id as the progress bar
        if case_id < begin_id:
            case_id += 1
            continue
        if case_id in mask_ids:
            progress_bar.update(1)
            logging.info(f"CASE {case_id} is masked, so it is correct")
            passed_id.append(case_id)
            first_pass_id.append(case_id)
            case_id += 1
            continue
        progress_bar.update(1)
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
                        helper_message = ""
                        if do_analyze:
                            # TODO: expand the analyzis to more types
                            logging.debug("do_analyze = True, start analyzing")
                            rsp = compiler.analyze(
                                code=c_code,
                                temperature=temperature,
                                error_message=error_message,
                            )
                            logging.debug("Analyze response: " + rsp)
                            key_list = rsp.split(",")

                            for item in key_list:
                                item = item.strip()
                                if item in fix_prompts.keys():
                                    helper_message += fix_prompts[item]
                            logging.debug(f"Helper message: {helper_message}")
                        else:
                            logging.debug("do_analyze = False, skip analyzing")
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


def clean_hyp_dir():
    if os.path.exists("hyp"):
        shutil.rmtree("hyp")
    os.mkdir("hyp")


def examine_coremark(try_i, file_name, function_name):
    # compile the other C code(exclude current file_name) with the assembly hypothesis to check the correctness
    # first, mov all c_src except the current one to a new directory(out)
    error_message = ""
    if not os.path.exists("out"):
        os.mkdir("out")
    for file in os.listdir("c_src"):
        if file != file_name:
            shutil.copy2(os.path.join("c_src", file), os.path.join("hyp", file))
    # then, compile the other C code with the assembly hypothesis
    src_list = []
    for file in os.listdir("hyp"):
        if file.endswith(".c"):
            src_list.append("hyp/" + file)
        if file.endswith(".s"):
            src_list.append("hyp/" + file)
    run_param = ["gcc"]
    run_param.extend(src_list)
    run_param.extend(["-o", f"out/{function_name}_llm.exe"])
    ret = subprocess.run(
        run_param,
        stderr=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    if ret.returncode != 0:
        logging.warning(
            f"{try_i}th try failed to compile the assembly hypothesis for {function_name}\nstdout: {ret.stdout.decode()}\nstderr: {ret.stderr.decode()}"
        )
        error_message = f"""Compilation error: Failed to assemble the assembly code to executable!
where compilation error is:
stdout:
{ret.stdout.decode()}
stderr:
{ret.stderr.decode()}
"""
        logging.debug(f"###error message: {error_message}")
        clean_hyp_dir()
        return (False, error_message)
    # execute the exe file to check the correctness, timeout=60
    try:
        ret = subprocess.run(
            [f"./out/{function_name}_llm.exe"],
            stderr=subprocess.PIPE,
            stdout=subprocess.PIPE,
            timeout=60,
        )
        if ret.returncode != 0:
            error_message = f"""Runtime error: Failed to execute the assembly hypothesis for {function_name}!
where runtime error is:
stdout:
{ret.stdout.decode()}
stderr:
{ret.stderr.decode()}
"""
            logging.debug(f"###error message: {error_message}")
            logging.warning(
                f"{try_i}th try failed to execute the assembly hypothesis for {function_name}"
            )
            clean_hyp_dir()
            return (False, error_message)
        else:
            # log stdout and stderr
            logging.info(f"stdout: {ret.stdout.decode()}")
            logging.info(f"stderr: {ret.stderr.decode()}")
            # assume it is correct, since it can be executed successfully
            logging.info(f"{try_i}th try passed for {function_name}")
            clean_hyp_dir()
            return (True, error_message)
    except subprocess.TimeoutExpired:
        error_message = f"""Runtime error: Timeout for executing the assembly hypothesis for {function_name}!"""
        logging.warning(f"{try_i}th try timeout for {function_name}")
        clean_hyp_dir()
        return (False, error_message)


def c_compiler_coremark(
    model="gpt-4o",
    use_local=False,
    temperature=0.3,
    peft_model="",
    pass_k=1,
    self_correct=False,  # whether to use self-correcting mechanism
    self_correct_round=3,  # the number of self-correcting rounds
    do_analyze=False,
    use_one_shot_prompt=True,
    use_zero_shot_prompt=False,
    use_mask=False,
    mask_stage="baseline",
):
    ds = load_dataset("mistral0105/CoreMark_FunctionLevel")
    compiler = Compiler(
        model=model,
        use_local=use_local,
        temperature=temperature,
        peft_model=peft_model,
        use_one_shot_prompt=use_one_shot_prompt,
        use_zero_shot_prompt=use_zero_shot_prompt,
    )
    failed = []
    failed_c = []
    failed_asm = []
    passed = []
    try_round = pass_k
    for e in tqdm(ds["train"]):
        file_name = e["name"]
        function_name = e["function_name"]
        c_code = e["c_src"]
        logging.info(f"Start to compile {function_name}\nC code:\n{c_code}")
        # below is one try to neural compile on the current C code
        success = False
        for i in range(try_round):
            compiler.compile(c_code, out=f"hyp/{function_name}.s")
            try:
                x86_llm_code = open(f"hyp/{function_name}.s", "r").read()
            except FileNotFoundError:
                logging.warning("Failed to find the assembly hypothesis file!")
                continue
            success, error_message = examine_coremark(i, file_name, function_name)
            if success:
                logging.info(f"{i}th try passed at the first round")
                break
            else:
                logging.info(f"{i}th try failed at the first round")
            if self_correct:
                logging.info(f"Self-correcting mechanism is enabled")
                for j in range(self_correct_round):
                    compiler.compile_with_error_message(
                        c_code,
                        out=f"hyp/{function_name}.s",
                        error_asm=x86_llm_code,
                        error_message=error_message,
                        prompt_postfix="",
                    )
                    try:
                        x86_llm_code = open(f"hyp/{function_name}.s", "r").read()
                    except FileNotFoundError:
                        logging.warning(
                            "Failed to find the assembly hypothesis file during fixing!"
                        )
                        logging.info(f"Self-correcting round {j} failed in {i}th try")
                        continue
                    correct_success, error_message = examine_coremark(
                        i, file_name, function_name
                    )
                    if correct_success:
                        success = True
                        logging.info(f"Self-correcting round {j} passed in {i}th try")
                        break
                    else:
                        logging.info(f"Self-correcting round {j} failed in {i}th try")

        if success:
            passed.append(function_name)
            logging.info(f"{function_name} PASS")
        else:
            failed.append(function_name)
            failed_c.append(c_code)
            failed_asm.append(x86_llm_code)
            logging.info(f"{function_name} FAIL")

    # print all
    logging.info(f"Failed cases: {failed}")
    logging.info(f"Passed cases: {passed}")
    logging.info(
        f"Pass rate: {len(passed)}/{len(passed)+len(failed)}={len(passed)*100 / (len(passed)+len(failed))}%"
    )
    # save failed cases to a new directory named failed under current
    if not os.path.exists("failed"):
        os.mkdir("failed")
    os.chdir("failed")
    for i in range(len(failed)):
        function_name = failed[i]
        with open(f"{function_name}.c", "w") as f:
            f.write(failed_c[i])
            f.close()
        with open(f"{function_name}_llm.s", "w") as f:
            f.write(failed_asm[i])
            f.close()
    os.chdir("..")


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
    coremark_dir = os.path.join(root_dir, "sandbox/coremark_workspace")
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
    parser.add_argument("--model", type=str, default="deepseek-coder")
    parser.add_argument("--begin_id", type=int, default=0)
    parser.add_argument("--end_id", type=int, default=100)
    parser.add_argument("--prompt_style", type=str, default="one")
    parser.add_argument("--use_local", type=bool, default=False)
    parser.add_argument("--need_log", type=bool, default=True)
    parser.add_argument("--temperature", type=float, default=0.5)
    parser.add_argument("--peft_model", type=str, default="")
    parser.add_argument("--pass_k", type=int, default=1)
    parser.add_argument("--self_correct", type=bool, default=False)
    parser.add_argument("--correct_round", type=int, default=3)
    parser.add_argument("--logging_level", type=str, default="INFO")
    parser.add_argument("--do_analyze", type=bool, default=False)
    parser.add_argument("--do_simulate", type=bool, default=False)
    parser.add_argument("--eval_coremark", type=bool, default=False)
    parser.add_argument("--clear_workspace", type=bool, default=False)
    parser.add_argument("--use_mask", type=bool, default=False)
    parser.add_argument("--mask_stage", type=str, default="baseline")
    S = parser.parse_args()
    candidate_model: str = S.model
    begin_id: int = S.begin_id
    end_id: int = S.end_id
    prompt_style: str = S.prompt_style
    use_local: bool = S.use_local
    need_log: bool = S.need_log
    temperature: float = S.temperature
    peft_model: str = S.peft_model
    pass_k: int = S.pass_k
    self_correct: bool = S.self_correct
    correct_round: int = S.correct_round
    logging_level: str = S.logging_level
    do_analyze: bool = S.do_analyze
    do_simulate: bool = S.do_simulate
    eval_coremark: bool = S.eval_coremark
    clear_workspace: bool = S.clear_workspace
    use_mask: bool = S.use_mask
    mask_stage: str = S.mask_stage
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

    if do_simulate:
        temp_name = f"temp_simulate_{candidate_model}_{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}_{random.randint(0, 1000000)}"
    elif eval_coremark:
        temp_name = f"temp_coremark_{candidate_model}_{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}_{random.randint(0, 1000000)}"
    else:
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

    if need_log and not clear_workspace:
        logging.basicConfig(filename=log_file, level=level)
    else:
        logging.basicConfig(level=level)
    logging.info("log file created!")
    logging.info("Start time: " + str(datetime.datetime.now()))
    logging.info("Current run:" + temp_name)
    # print all config
    logging.info(f"Model: {candidate_model}")
    logging.info(f"Temperature: {temperature}")
    logging.info(f"Pass_k: {pass_k}")
    logging.info(f"Self-correct: {self_correct}")
    logging.info(f"Correct round: {correct_round}")
    logging.info(f"Do analyze: {do_analyze}")
    logging.info(f"Do simulate: {do_simulate}")
    logging.info(f"Eval coremark: {eval_coremark}")
    logging.info(f"Eval exebench: {not eval_coremark}")
    logging.info(f"Use Mask: {use_mask}")
    logging.info(f"Mask stage: {mask_stage}")

    if do_simulate:
        x86_simulate(
            model=candidate_model,
            temperature=temperature,
            x86_src=open("/root/workspace/LLM_Compiler/temp/431_f94/llm.s", "r").read(),
            c_src=open("/root/workspace/LLM_Compiler/temp/431_f94/func.c", "r").read(),
            init_value="x=15, y=16",
        )
    elif eval_coremark:
        os.chdir(coremark_dir)
        c_compiler_coremark(
            model=candidate_model,
            use_local=use_local,
            temperature=temperature,
            peft_model=peft_model,
            pass_k=pass_k,
            self_correct=self_correct,
            self_correct_round=correct_round,
            do_analyze=do_analyze,
            use_one_shot_prompt=use_one_shot_prompt,
            use_zero_shot_prompt=use_zero_shot_prompt,
            use_mask=use_mask,
            mask_stage=mask_stage,
        )
    elif clear_workspace:
        workspace_clear(sandbox_dir, log_dir)
    else:
        c_compiler_exebench(
            model=candidate_model,
            begin_id=begin_id,
            end_id=end_id,
            use_one_shot_prompt=use_one_shot_prompt,
            use_zero_shot_prompt=use_zero_shot_prompt,
            use_local=use_local,
            temperature=temperature,
            peft_model=peft_model,
            pass_k=pass_k,
            self_correct=self_correct,
            self_correct_round=correct_round,
            do_analyze=do_analyze,
            use_mask=use_mask,
            mask_stage=mask_stage,
        )

    logging.info("End time: " + str(datetime.datetime.now()))
