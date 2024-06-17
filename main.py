import os
import random
import datetime
import logging
from utils import get_env
from models import Compiler, CodeTranslator
from logging_config import configure_logging

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

    # compiler = Compiler()
    # file_code = "/Users/zhangshuoming/workspace/LLM_CoT_compilation/LLM_Compiler/sandbox/example/example.c"
    # compiler.compile(file_code)
    code_translator = CodeTranslator()
    file_code = "/Users/zhangshuoming/workspace/LLM_CoT_compilation/LLM_Compiler/sandbox/example/example.py"
    code_translator.translate(file_code)
    logging.info("End time: " + str(datetime.datetime.now()))