import datetime
from openai import OpenAI
import os
import logging
import subprocess
from prompts import prompts
from config import AVAILABLE_MODELS, YOUR_API_KEY

class Chat():
    def __init__(self, model):
        if model not in AVAILABLE_MODELS:
            logging.error(f"Model {model} is not available!")
            exit(1)
        self.model = model
        self.client = OpenAI(api_key=YOUR_API_KEY, base_url="https://api.perplexity.ai")
        self.system_prompt = prompts["general"]
        initial_messages = [
            {
                "role": "system",
                "content": (self.system_prompt),
            },
        ]
        self.messages = initial_messages

    def chat(self, temperature=0.01, user_input=None):
        if user_input is None:
            user_input = input("User: \n")
            logging.info(f"stdin user input: \n{user_input}")
        self.messages.append(
            {
                "role": "user",
                "content": user_input,
            }
        )
        response = self.client.chat.completions.create(
            model=self.model,
            temperature=temperature,
            messages=self.messages,
        )
        rsp_content = response.choices[0].message.content
        logging.info(f"Assistant response: \n{rsp_content}")
        self.messages.append(
            {
                "role": "assistant",
                "content": rsp_content,
            }
        )

class Compiler(Chat):
    def __init__(self, model="mixtral-8x7b-instruct"):
        super().__init__(model)
        self.system_prompt = (
            prompts["general"]
            + prompts["mission"]
            + prompts["step1"]
            + prompts["step1_example"]
            + prompts["step2"]
            + prompts["step2_example"]
            + prompts["step3"]
            + prompts["step3_example"]
            + prompts["recap"]
        )
        initial_messages = [
            {
                "role": "system",
                "content": (self.system_prompt),
            },
        ]
        self.messages = initial_messages
        
    def compile(self, code=None):
        if os.path.exists(code):
            # copy to the current directory
            os.system(f"cp {code} .")
            # get the file name
            code = code.split("/")[-1]
            if code is not None:
                with open(code, "r") as f:
                    code = f.read()
        self.chat(user_input=code)
        compiler_rsp = self.messages[-1]["content"]
        self.assemble(compiler_rsp)
    
    def assemble(self, compiler_rsp):
        if "```x86" in compiler_rsp:
            x86_code = compiler_rsp.split("```x86")[1].split("```")
            if len(x86_code) > 0:
                x86_code = x86_code[0]
            logging.info(f"x86 code: \n{x86_code}")
            with open("output.s", "w") as f:
                f.write(x86_code)
            ret = subprocess.run(["clang", "-arch", "x86_64", "output.s", "-c"])
            if ret.returncode != 0:
                error_output = ret.stderr
                normal_output = ret.stdout
                logging.warning("Failed to compile the x86 code!")
                logging.info(error_output)
                logging.info(normal_output)
            else:
                logging.info("Succeed to compile the x86 code!")
        else:
            logging.warning("Failed to find the x86 code!")