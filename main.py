import os
import random
import datetime
import logging
import subprocess
from datasets import load_dataset
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
        #execute the code with the unittest
        unittest = e["test"]
        ret = subprocess.run(["python", "-c", code+unittest])
        if ret.returncode == 0:
            print("Pass")
            logging.info(f"HumanEval {i} passed. with the following code:\n{code} and unittest:\n{unittest}")
        else:
            print("Fail")
            logging.info(f"HumanEval {i} failed. with the following code:\n{code} and unittest:\n{unittest}")
        i += 1

def c_compiler():
    pass
    
def python_compiler():
    pass

def arm_decompiler():
    pass

def x86_decompiler():
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

    configure_logging(log_file)
    logging.info("Start time: " + str(datetime.datetime.now()))

    # do specific task here
    decompiler = Decompiler()
    decompiler.decompile("/Users/zhangshuoming/workspace/LLM_CoT_compilation/LLM_Compiler/sandbox/example/hello_world.s")
    
    
    logging.info("End time: " + str(datetime.datetime.now()))
