import os
import shutil
import random
import json
import datetime
import logging
import subprocess
from datasets import load_dataset, Dataset
from utils import get_env
from models import Chat, Compiler, Decompiler, CodeTranslator
from logging_config import configure_logging


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


def c_compiler():
    compiler = Compiler()
    # ds = load_dataset("jordiae/exebench")["train_real_simple_io"]
    ds = load_dataset("mistral0105/exebench_io_validated_full")["train"]

    # select validate example to a new dataset, by checking compile status and execution status
    validate_ds = []
    i = 0
    for e in ds:
        c_deps: str = e["real_deps"]
        # rm the "# 1" in the end
        c_deps = c_deps[: c_deps.rfind("# 1")]
        c_code = c_deps
        c_code += e["func_def"]
        # filtering
        
        # 1. if c_code contains "asm volatile", skip this example
        if "asm volatile" in c_code:
            continue
        
        # 2. if c_code length > 4096, skip this example
        if len(c_code) > 4096:
            continue
        
        # 3. if c_code contains "goto", skip this example
        if "goto" in c_code:
            continue
        
        validate_ds.append(e)
        i += 1
        print(i)
        
        
    
    # for e in ds:
    #     try:
    #         id = 0
    #         x86_id = None
    #         arm_id = None
    #         for name in e["asm"]["target"]:
    #             if name == "real_gcc_x86_O0":
    #                 x86_id = id
    #             # elif name == "real_gcc_arm_O0":
    #             #     arm_id = id
    #             else:
    #                 id += 1
    #         if x86_id == None:
    #             continue
    #         x86_code = e["asm"]["code"][x86_id]
    #         # arm_code = e["asm"]["code"][arm_id]
    #         c_deps: str = e["real_deps"]
    #         # rm the "# 1" in the end
    #         c_deps = c_deps[: c_deps.rfind("# 1")]
    #         c_code = c_deps

    #         c_code += e["func_def"]

    #         # driver code
    #         c_exe = e["real_exe_wrapper"]
    #         if c_exe == None:
    #             continue
    #         c_exe_cleaned = c_exe
    #         start = c_exe.find("""extern "C" {""")
    #         end = c_exe.find("}", start + 1)
    #         func_decl = e["func_def"]
    #         end2 = func_decl.find("{")
    #         func_decl = func_decl[:end2]
    #         c_exe_cleaned = (
    #             c_exe[:start] + 'extern "C" {\n' + func_decl + ";\n}\n" + c_exe[end + 1 :]
    #         )
    #         # remove the following part from c_exe_cleaned(unknown/unused header)
    #         """#include <clib/synthesizer.h>"""
    #         start = c_exe_cleaned.find("#include <clib/synthesizer.h")
    #         end = c_exe_cleaned.find(">", start + 1)
    #         c_exe_cleaned2 = c_exe_cleaned[:start] + c_exe_cleaned[end + 1 :]
    #         final_c_exe = c_exe_cleaned2

    #         # IO pairs
    #         inputs = e["real_io_pairs"]["input"]
    #         outputs = e["real_io_pairs"]["output"]
    #         if len(inputs) == 0 and len(outputs) == 0:
    #             continue
    #         var_values_dict: dict = {}
    #         out_dict: dict = {}
    #         out_count = 0
    #         input_count = 0
    #         for pair in inputs:
    #             input_count += 1
    #             for i in range(len(pair["var"])):
    #                 var = pair["var"][i]
    #                 value = pair["value"][i]
    #                 if var not in var_values_dict:
    #                     var_values_dict[var] = []
    #                 cur_values = var_values_dict[var]
    #                 cur_values.append(value)
    #         for pair in outputs:
    #             out_count += 1
    #             for i in range(len(pair["var"])):
    #                 var = pair["var"][i]
    #                 value = pair["value"][i]
    #                 if var not in out_dict:
    #                     out_dict[var] = []
    #                 out_dict[var].append(value)

    #         if not os.path.exists("input"):
    #             os.mkdir("input")
    #         os.chdir("input")
    #         for i in range(input_count):
    #             data_file = open(f"in{i}.json", "w")
    #             data_file.write("{\n")
    #             for j, (k, v) in enumerate(var_values_dict.items()):
    #                 value = v[i]
    #                 data_file.write(f'    "{k}": {value}')
    #                 if j != len(var_values_dict) - 1:
    #                     data_file.write(",")
    #                 data_file.write("\n")
    #             data_file.write("}")
    #             data_file.close()
    #         os.chdir("..")

    #         if not os.path.exists("output"):
    #             os.mkdir("output")
    #         os.chdir("output")
    #         for i in range(out_count):
    #             data_file = open(f"out{i}.json", "w")
    #             data_file.write("{\n")

    #             for j, (k, v) in enumerate(out_dict.items()):
    #                 value = v[i]
    #                 data_file.write(f'    "{k}": {value}')
    #                 if j != len(out_dict) - 1:
    #                     data_file.write(",")
    #                 data_file.write("\n")
    #             data_file.write("}\n")
    #             data_file.close()
    #         os.chdir("..")
    #         with open("tmp.c", "w") as f:
    #             if c_code is not None:
    #                 f.write(c_code)
    #                 f.close()
    #         # logging.info("C code: \n" + c_code)
    #         with open("tmp.s", "w") as f:
    #             if x86_code is not None:
    #                 f.write(x86_code)
    #                 f.close()
    #         # logging.info("X86 code: \n" + x86_code)
    #         with open(f"tmp_driver.cpp", "w") as f:
    #             if c_exe_cleaned2 is not None:
    #                 f.write(c_exe_cleaned2)
    #                 f.close()
    #         # logging.info("Driver code: \n" + final_c_exe)

    #         # using g++ to compile each file
    #         ret = subprocess.run(
    #             ["g++-13", "-c", "tmp_driver.cpp", "-o", "tmp_driver.o"],
    #             stdout=subprocess.PIPE,
    #             stderr=subprocess.PIPE,
    #         )
    #         if ret.returncode != 0:
    #             # logging.warning("Failed to compile the driver code!")
    #             continue
    #         # c source code using gcc to compile, not g++
    #         ret = subprocess.run(
    #             ["gcc-13", "-c", "tmp.c", "-o", "tmp.o"],
    #             stdout=subprocess.PIPE,
    #             stderr=subprocess.PIPE,
    #         )
    #         if ret.returncode != 0:
    #             # logging.warning("Failed to compile the assembly code!")
    #             continue
    #         # assemble the object files
    #         ret = subprocess.run(
    #             ["g++-13", "tmp.o", "tmp_driver.o", "-o", "tmp"],
    #             stdout=subprocess.PIPE,
    #             stderr=subprocess.PIPE,
    #         )
    #         if ret.returncode != 0:
    #             # logging.warning("Failed to assemble the code!")
    #             continue
    #         # try to run the code, args are each input file
    #         local_err = 0
    #         local_succ = 0
    #         for i in range(input_count):
    #             ret = subprocess.run(
    #                 ["./tmp", f"input/in{i}.json", f"output/out{i}_real.json"],
    #                 stdout=subprocess.PIPE,
    #                 stderr=subprocess.PIPE,
    #                 timeout=30,
    #             )
    #             if ret.returncode != 0:
    #                 # logging.warning(f"WARNING: code failed to execute for input {i}")
    #                 local_err += 1
    #                 continue
    #             # compare the output with the expected output
    #             with open(f"output/out{i}_real.json", "r") as f:
    #                 real_output = f.read()
    #             with open(f"output/out{i}.json", "r") as f:
    #                 expected_output = f.read()
    #             try:
    #                 json_my = json.loads(real_output)
    #                 json_ref = json.loads(expected_output)
    #             except json.JSONDecodeError:
    #                 # logging.warning(f"SKIP: json decode failed for input {i}")
    #                 local_err += 1
    #                 break
    #             if json_my == json_ref:
    #                 local_succ += 1
    #             else:
    #                 local_err += 1
    #         # logging.info(f"Local error rate: {local_err*100 / input_count}%")
    #         if local_err == 0:
    #             # logging.info("All tests passed for this example!")
    #             validate_ds.append(e)
    #         print(len(validate_ds))
    #         # if len(validate_ds) == 1000:
    #         #     break
    #     except Exception as e:
    #         logging.error(f"Error: {e}")
    #         continue
    # save the validate dataset as a dataset
    validate_ds = Dataset.from_list(validate_ds)
    validate_ds.push_to_hub("mistral0105/exebench_io_validated_full_cleaned")


def python_compiler():
    pass


def arm_decompiler():
    pass


def x86_decompiler():
    # decompiler = Decompiler()
    # decompiler.decompile("/Users/zhangshuoming/workspace/LLM_CoT_compilation/LLM_Compiler/sandbox/example/hello_world.s")
    pass


def ir_optimizer():
    pass

def workspace_clear(sandbox_dir, log_dir):
    # rm all the temp files in the sandbox
    for dir in os.listdir(sandbox_dir):
        if dir.startswith("temp_"):
            shutil.rmtree(os.path.join(sandbox_dir, dir))
    
    for file in os.listdir(log_dir):
        if file.startswith("temp_"):
            os.remove(os.path.join(log_dir, file))
        
        

if __name__ == "__main__":
    root_dir = get_env()
    if root_dir is None:
        print("Failed to locate the working directory!")
        exit(1)
    python_dir = os.path.join(root_dir, "python")
    sandbox_dir = os.path.join(root_dir, "sandbox/temp")
    log_dir = os.path.join(root_dir, "logs")
    temp_name = f"temp_{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}_{random.randint(0, 1000000)}"
    temp_dir = os.path.join(sandbox_dir, temp_name)
    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir, exist_ok=True)
        os.chdir(temp_dir)
    log_file = os.path.join(log_dir, f"{temp_name}.log")

    configure_logging(log_file)
    logging.info("Start time: " + str(datetime.datetime.now()))

    c_compiler()
    logging.info("End time: " + str(datetime.datetime.now()))
    # workspace_clear(sandbox_dir, log_dir)
