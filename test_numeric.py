"""
generate exe, input, output for each function
"""
import torch
import os
import time
import sys
import json
import subprocess
import logging
import struct
import re
from datasets import load_dataset, load_from_disk, concatenate_datasets
from transformers import AutoTokenizer, AutoModelForCausalLM, LlamaForCausalLM
from bleu import list_bleu


# def fill_template(c_src):
#     # possible prompt for numeric model
#     """### Helper:
# float number-->:
#     .align 4
# label:
#     .long    float_to_int(number)    
# double number-->:
#     .align 8
# label:
#     .quad    double_to_quad(number)"""

def numeric_handler(asm: str):
    int_to_float = lambda n: struct.unpack('@f', struct.pack('@I', n))[0]
    float_to_int = lambda f: struct.unpack('@I', struct.pack('@f', f))[0]
    int_to_double = lambda n: struct.unpack('@d', struct.pack('@Q', n))[0]
    double_to_int = lambda f: struct.unpack('@Q', struct.pack('@d', f))[0]
    # find all float_to_int(float_value.f) pattern
    matches = re.findall(r"float_to_int\((\d+\.\d+)\)", asm)
    for match in matches:
        value: int = float_to_int(float(match))
        asm = asm.replace("float_to_int("+match+")", str(value))
    
    matches = re.findall(r"double_to_quad\((\d+\.\d+)\)", asm)
    for match in matches:
        value: int = double_to_int(float(match))
        asm = asm.replace("double_to_quad("+match+")", str(value))
    return asm

def grab_assembly(raw_output: str, special_token="```asm"):
    # grab the ```asm{code}``` from raw_output
    start = raw_output.find(special_token)
    end = raw_output.find("```", start + 1)
    asm = raw_output[start + len(special_token) : end]
    return asm


def run_inference(
    model: LlamaForCausalLM,
    tokenizer: AutoTokenizer,
    eval_script: str,
    in_len: list = None,
    out_len: list = None,
):
    model_input = tokenizer(eval_script, return_tensors="pt").to("cuda")
    in_len.append(model_input.input_ids.shape[1])
    model.eval()
    with torch.no_grad():
        generated = model.generate(**model_input, max_new_tokens=2048)[0]
        out_len.append(generated.shape[0])
        output = tokenizer.decode(generated)

        return output


def cleanup():
    # rm file in input/output/my_output
    for f in os.listdir("input"):
        os.remove(os.path.join("input", f))
    for f in os.listdir("output"):
        os.remove(os.path.join("output", f))
    for f in os.listdir("my_output"):
        os.remove(os.path.join("my_output", f))
    # rm tmp.s, tmp.o, libtmp.a, tmp_driver.cpp, tmp.exe
    if os.path.exists("tmp.s"):
        os.remove("tmp.s")
    if os.path.exists("tmp.o"):
        os.remove("tmp.o")
    if os.path.exists("libtmp.a"):
        os.remove("libtmp.a")
    if os.path.exists("tmp_driver.cpp"):
        os.remove("tmp_driver.cpp")
    if os.path.exists("tmp.exe"):
        os.remove("tmp.exe")


if __name__ == "__main__":
    # 1. load eval dataset
    log_dir = "/home/zhangshuoming/project/CompilerEval/logs"
    time_str = time.strftime("%Y:%m:%d:%H:%M:%S")
    time_str = time_str.replace(":", "_")
    log_file = os.path.join(log_dir, f"numeric_numeric_run_{time_str}.log")
    logging.basicConfig(filename=log_file, level=logging.INFO)

    # dataset_double = load_dataset("zhangshuoming/math_23k_double_value_init")["train"]
    # dataset_float = load_dataset("zhangshuoming/math_23k_value_init")["train"]
    # dataset = concatenate_datasets([dataset_double, dataset_float])
    # small_dataset = dataset.train_test_split(None, 1000, True)["train"]
    # tiny_dataset = dataset.train_test_split(None, 100, True)["train"]
    # baby_dataset = dataset.train_test_split(None, 10, True)["train"]
    # # save these subset
    # small_dataset.save_to_disk("/home/zhangshuoming/project/CompilerEval/NumericBench/eval/small")
    # tiny_dataset.save_to_disk("/home/zhangshuoming/project/CompilerEval/NumericBench/eval/tiny")
    # baby_dataset.save_to_disk("/home/zhangshuoming/project/CompilerEval/NumericBench/eval/baby")
    
    small_dataset = load_from_disk("/home/zhangshuoming/project/CompilerEval/NumericBench/eval/small")
    cur_dataset = small_dataset
    

    resume = 0
    workspace_dir = "/home/zhangshuoming/project/CompilerEval"
    temp_dir = "/home/zhangshuoming/project/CompilerEval/temp"
    index = resume
    non_compilable_asm = []
    # compilable_non_executable_skip_asm = (
    #     []
    # )  # lacking some header/library, very few has internal error
    executable_io_correct_asm = []
    executable_io_error_asm = []
    long_input_skip_asm = []

    
    base_model = "/home/zhangshuoming/project/CompilerEval/models/merged_numeric_model"
    model = AutoModelForCausalLM.from_pretrained(
        base_model, torch_dtype=torch.float16, device_map="auto"
    )
    tokenizer = AutoTokenizer.from_pretrained(base_model)
    os.chdir(temp_dir)

    in_c_len = []
    out_asm_len = []
    csv_name = f"/home/zhangshuoming/project/CompilerEval/collected_datas/numeric_bleu.csv"
    bleu_map = {}

    start_time = time.time()
    for func in cur_dataset:
        func = func["text"]
        succ = True
        ### 1. compile to generate assmebly
        c_src = func["c"]
        asm_ref = func["asm"]
        driver_src = func["driver"]
        prompt = fill_template(c_src)
        if len(prompt) > 2048:
            logging.info(f"SKIP very long input: {index}")
            long_input_skip_asm.append(index)
            cleanup()
            index += 1
            continue
        output = run_inference(model, tokenizer, prompt, in_c_len, out_asm_len)
        asm = grab_assembly(output)
        # if not baseline:
        #     asm = numeric_handler(asm)
        
        
        
        if os.path.exists("tmp.s"):
            os.remove("tmp.s")
        asm_file = open(f"tmp.s", "w")
        asm_file.write(asm)
        asm_file.close()
        if os.path.exists("tmp_ref.s"):
            os.remove("tmp_ref.s")
        asm_ref_file = open(f"tmp_ref.s", "w")
        if asm_ref == None:
            asm_ref = ""
            logging.warning(f"asm_ref not found in {index}, skip bleu test")
        asm_ref_file.write(asm_ref)
        asm_ref_file.close()

        # try:
        #     ret = subprocess.run(
        #         ["gcc", "-S", f"tmp.c", "-o", f"tmp_ref.s"], check=True, timeout=20
        #     )
        # except Exception:
        #     logging.warning(f"{index} ref compile error, which has:\n{c_src}")
        # if tmp.s and tmp_ref.s exists, compute bleu
        ### 2. assemble into static library
        try:
            ret = subprocess.run(
                ["gcc", "-c", f"tmp.s", "-o", f"tmp.o"], check=True, timeout=20
            )
            ret = subprocess.run(["ar", "rcs", f"libtmp.a", f"tmp.o"], check=True)
        except Exception:
            logging.warning(f"non_compilable: {index}, which has asm\n{asm}")
            non_compilable_asm.append(index)
            cleanup()
            index += 1
            continue
        ### 2. generate driver function from bench
        # write to file
        c_exe_file = open(f"tmp_driver.c", "w")
        c_exe_file.write(driver_src)
        c_exe_file.close()
        try:
            ret = subprocess.run(
                ["gcc", f"tmp_driver.c", "-L.", f"-ltmp", "-o", f"tmp.exe"],
                check=True,
                timeout=20,
            )
        except Exception:
            logging.warning(f"Error cannot compile driver with the asm: {index}")
            executable_io_error_asm.append(index)
            cleanup()
            index += 1
            continue
        ### 3. run the exe, if return 0, then success
        time_out_limit = 20.0
        exe_path = os.path.join(temp_dir, "tmp.exe")
        # catch timeout exception
        try:
            ret = subprocess.run(
                [exe_path], timeout=time_out_limit, check=True
            )
        except subprocess.TimeoutExpired:
            logging.warning(
                f"executable_io_error: timeout exceed {time_out_limit}s in {index}"
            )
            executable_io_error_asm.append(index)
            cleanup()
            index += 1
            continue
        except subprocess.CalledProcessError:
            logging.warning(f"executable_io_error: wrong output in {index}")
            executable_io_error_asm.append(index)
            logging.warning(f"executable_io_error: {index}")
            cleanup()
            index += 1
            continue
        executable_io_correct_asm.append(index)
        logging.info(f"executable_io_correct: {index}")
        index += 1
        cleanup()
    end_time = time.time()
    # result
    compile_failed = len(non_compilable_asm)
    skip0 = len(long_input_skip_asm)
    io_correct = len(executable_io_correct_asm)
    io_error = len(executable_io_error_asm)
    total = skip0 + compile_failed + io_correct + io_error
    non_skip = total - skip0
    compilable = io_correct + io_error
    executable = io_correct + io_error
    logging.info("result:\n-----------------------------------------------")
    logging.info(
        f"""
            {compile_failed}(FAIL COMPILE)
            {io_correct}(SUCCESS)
            {io_error}(FAIL EXECUTION)
            {skip0}(SKIP)
            {total}(TOTAL)
    """
    )
    logging.info(
        f"non_compilable_asm: total {compile_failed}, include <{non_compilable_asm}>"
    )
    logging.info(
        f"executable_io_correct_asm: total {io_correct}, include <{executable_io_correct_asm}>"
    )
    logging.info(
        f"executable_io_error_asm: total {io_error}, include <{executable_io_error_asm}>"
    )
    logging.info(f"long_input_skip_asm: total {skip0}, include <{long_input_skip_asm}>")
    logging.info("rate:\n-----------------------------------------------")
    logging.info(f"compilable rate: {compilable*100/non_skip}%")
    logging.info(f"executable rate: {executable*100/(compilable)}%")
    logging.info(f"io correct rate: {io_correct*100/(executable)}%")

    # extra datas
    logging.info("extra datas:\n-----------------------------------------------")
    logging.info(f"average input length: {sum(in_c_len)/len(in_c_len)}")
    logging.info(f"average output length: {sum(out_asm_len)/len(out_asm_len)}")
    logging.info(f"input length: {in_c_len}")
    logging.info(f"output length: {out_asm_len}")
    logging.info(f"bleu map: {bleu_map}")
    logging.info(
        f"avg bleu score on {len(bleu_map)} pairs: {sum(bleu_map.values())/len(bleu_map)}"
    )

    # write to csv
    csv_file = open(csv_name, "w")
    csv_file.write("index,bleu\n")
    for k, v in bleu_map.items():
        csv_file.write(f"{k},       {v}\n")
    csv_file.write(f"total,         {len(bleu_map)}\n")
    csv_file.write(f"average,       {sum(bleu_map.values())/len(bleu_map)}\n")
    csv_file.close()

    # log execution time in %H:%M:%S
    logging.info(
        "execution statistics:\n-----------------------------------------------"
    )
    logging.info(
        f"total time: {time.strftime('%H:%M:%S', time.gmtime(end_time - start_time))}"
    )
    logging.info(
        f"average time per function: {time.strftime('%H:%M:%S', time.gmtime((end_time - start_time)/index))}"
    )
    logging.info(
        f"final IO Accuracy: {io_correct*100/(io_correct+io_error+compile_failed)}%"
    )
