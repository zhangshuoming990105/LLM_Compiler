import os
import shutil
import random
import json
import datetime
import logging
import subprocess
from datasets import load_dataset, Dataset
from utils import get_env, workspace_clear
from models import Chat, Compiler, Decompiler, CodeTranslator


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


def c_compiler(model="gpt-4o", begin_id=0, end_id=100, use_short_prompt=False, use_emnlp_prompt=False):
    compiler = Compiler(model, use_short_prompt=use_short_prompt,use_emnlp_prompt=use_emnlp_prompt)
    # ds = load_dataset("jordiae/exebench")["train_real_simple_io"]
    ds = load_dataset("mistral0105/exebench_io_validated_full_cleaned")["train"]
    # select validate example to a new dataset, by checking compile status and execution status
    passed_id = []
    failed_id = []
    failed_c = []
    failed_asm = []
    failed_asm_ref = []
    case_id = 0
    for e in ds:
        if case_id < begin_id:
            case_id += 1
            continue
        if case_id >= end_id:
                break
        try:
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
            # c source code using gcc to compile, not g++
            # to test llm_compiler, use aicc instead of gcc
            compiler.compile("tmp.c")
            x86_llm_code = open("tmp.s", "r").read()
            # assemble the object files
            ret = subprocess.run(
                ["g++", "tmp.s", "tmp_driver.s", "-o", "tmp"],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
            )
            if ret.returncode != 0:
                logging.warning(
                    f"CASE {case_id} failed to assemble the code to executable!"
                )
                logging.warning(f"ret.stderr: {ret.stderr.decode()}")
                logging.warning(f"ret.stdout: {ret.stdout.decode()}")
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
                continue
            # try to run the code, args are each input file
            local_err = 0
            local_succ = 0
            for j in range(input_count):
                try:
                    ret = subprocess.run(
                        ["./tmp", f"input/in{j}.json", f"output/out{j}_real.json"],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        timeout=10,
                    )
                except subprocess.TimeoutExpired:
                    logging.warning(
                        f"WARNING: code execute timeout for input {j} in case {case_id}"
                    )
                    local_err += 1
                    continue
                if ret.returncode != 0:
                    logging.warning(
                        f"WARNING: code failed to execute for input {j} in case {case_id}"
                    )
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
            logging.info(f"Local error rate: {local_err*100 / input_count}%")
            if local_err == 0:
                logging.info(f"CASE {case_id} succeeded")
                passed_id.append(case_id)
            else:
                logging.info(f"CASE {case_id} failed")
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
                break
        except Exception as e:
            logging.error(f"Unexpected Error: {e}")
            case_id += 1
            continue
    logging.info("Done")
    logging.info(f"Passed cases: {passed_id}")
    logging.info(f"Failed cases: {failed_id}")
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


def python_compiler(model="gpt-4o",begin_id=0, end_id=1, use_short_prompt=False):
    code_translator = CodeTranslator(model, source="python", target="c")
    gpt4_compiler = Compiler(model, use_short_prompt=use_short_prompt)
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
            desc_post="[INST]Only provide me with the #Output part. Check carefully with the escape characters, to make sure the Output code is correct.[\INST]",
            reset_messages=False,
        )
        code_translator.translate(
            human_eval_driver_code,
            specify_out_file="humaneval_driver.c",
            desc_pre='[INST]Continue to translate the driver function from Python to C.\nFor the Python function with its body pass, like "def foo()->int:\npass" we generate a function declaration in C, like "int foo();".[\INST]',
            desc_post="[INST]Only provide me with the #Output part.[\INST]",
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


def python_c_translator(model="gpt-4o"):
    translator = CodeTranslator(model=model, source="python", target="c")
    translator.translate(
        "/Users/zhangshuoming/workspace/LLM_CoT_compilation/LLM_Compiler/sandbox/humaneval_example/example.py"
    )


def arm_decompiler():
    pass


def x86_decompiler():
    # decompiler = Decompiler()
    # decompiler.decompile("/Users/zhangshuoming/workspace/LLM_CoT_compilation/LLM_Compiler/sandbox/example/hello_world.s")
    pass


def ir_optimizer():
    pass


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
    need_log = True
    if need_log:
        logging.basicConfig(filename=log_file, level=logging.INFO)
    else:
        logging.basicConfig(level=logging.INFO)
    logging.info("log file created!")
    logging.info("Start time: " + str(datetime.datetime.now()))
    # EMNLP additional experiments
    # GPT-4o
    # Claude-3.5-sonnet-20240620
    c_compiler(model="gpt-4o",begin_id=0, end_id=100, use_emnlp_prompt=True)
    # c_compiler(model="deepseek-coder", begin_id=0, end_id=100, use_emnlp_prompt=True)
    
    
    # c_compiler(model="claude-3-haiku-20240307",begin_id=0, end_id=1, use_short_prompt=True)
    # python_c_translator(model="claude-3-haiku-20240307")

    # python_compiler("claude-3-5-sonnet-20240620")
    logging.info("End time: " + str(datetime.datetime.now()))
    # workspace_clear(sandbox_dir, log_dir)
