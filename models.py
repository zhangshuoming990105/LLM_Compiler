import datetime
from openai import OpenAI
import os
import logging
import subprocess
from prompts import compiler_prompts, decompiler_prompts, code_translator_prompts
from config import AVAILABLE_MODELS, YOUR_API_KEY


class Chat:
    def __init__(self, model="mixtral-8x7b-instruct"):
        if model not in AVAILABLE_MODELS:
            logging.error(f"Model {model} is not available!")
            exit(1)
        self.model = model
        self.client = OpenAI(api_key=YOUR_API_KEY, base_url="https://api.perplexity.ai")
        self.system_prompt = compiler_prompts["general"]
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

    def paraphrase(self, text):
        task_description = "paraphrase the following text, make sure it is well written and syntax correct."
        prompt = f"{task_description}\n{text}"
        self.chat(user_input=prompt)
        paraphrased_text = self.messages[-1]["content"]
        logging.info(f"Paraphrased text: \n{paraphrased_text}")
        return paraphrased_text


class Compiler(Chat):
    def __init__(self, model="mixtral-8x7b-instruct"):
        super().__init__(model)
        self.system_prompt = (
            compiler_prompts["general"]
            + compiler_prompts["mission"]
            + compiler_prompts["step1"]
            + compiler_prompts["step1_example"]
            + compiler_prompts["step2"]
            + compiler_prompts["step2_example"]
            + compiler_prompts["step3"]
            + compiler_prompts["step3_example"]
            + compiler_prompts["recap"]
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


class Decompiler(Chat):
    def __init__(self, model="mixtral-8x7b-instruct", arch="x86"):
        super().__init__(model)
        self.system_prompt = (
            decompiler_prompts["general"]
            + decompiler_prompts["mission"]
            + decompiler_prompts["task_format"]
            + decompiler_prompts["task_example"]
        )
        initial_messages = [
            {
                "role": "system",
                "content": (self.system_prompt),
            },
        ]
        self.messages = initial_messages
        self.arch = arch

    def decompile(self, code=None):
        if os.path.exists(code):
            # copy to the current directory
            os.system(f"cp {code} .")
            # get the file name
            code = code.split("/")[-1]
            if code is not None:
                with open(code, "r") as f:
                    code = f.read()
        # set the source and target language
        description = f"decompile the following {self.arch} code into C code."
        prompt = f"[INST]#Description:\n{description}\n#Input:\n```{self.arch}\n{code}```[/INST]\n"
        self.chat(user_input=prompt)
        decompiler_rsp = self.messages[-1]["content"]
        if f"```c" in decompiler_rsp:
            c_code = decompiler_rsp.split("```c")[1].split("```")
            if len(c_code) > 0:
                c_code = c_code[0]
            logging.info(f"C code: \n{c_code}")
            with open("disassembled.c", "w") as f:
                f.write(c_code)


class CodeTranslator(Chat):
    def __init__(self, model="mixtral-8x7b-instruct"):
        super().__init__(model)
        self.system_prompt = (
            code_translator_prompts["general"]
            + code_translator_prompts["mission"]
            + code_translator_prompts["task_format"]
            + code_translator_prompts["task_example"]
        )
        initial_messages = [
            {
                "role": "system",
                "content": (self.system_prompt),
            },
        ]
        self.messages = initial_messages

    def translate(self, code=None, source="python", target="c"):
        if os.path.exists(code):
            # copy to the current directory
            os.system(f"cp {code} .")
            # get the file name
            code = code.split("/")[-1]
            if code is not None:
                with open(code, "r") as f:
                    code = f.read()
        # set the source and target language
        description = f"translate the following {source} code into {target} code."
        # we could call a paraphraser to get the task description
        description = self.paraphrase(description)
        prompt = f"[INST]#Description:\n{description}\n#Input:\n```{source}\n{code}```[/INST]\n"

        self.chat(user_input=prompt)
        compiler_rsp = self.messages[-1]["content"]
        logging.info(f"Translated code: \n{compiler_rsp}")
        # grep the translated code
        if f"```{target}" in compiler_rsp:
            target_code = compiler_rsp.split(f"```{target}")[1].split("```")
            if len(target_code) > 0:
                target_code = target_code[0]
            logging.info(f"target {target} code: \n{target_code}")
            with open(f"output.{target}", "w") as f:
                f.write(target_code)
