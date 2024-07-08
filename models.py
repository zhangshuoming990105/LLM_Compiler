import datetime
import tiktoken
from openai import OpenAI
import os
import logging
import subprocess
from prompts import (
    compiler_prompts,
    compiler_short_prompts,
    decompiler_prompts,
    code_translator_prompts,
)
from config import AVAILABLE_MODELS, YOUR_API_KEY, GPT_AVAILABLE_MODELS


def num_token_from_string(
    string: str, encoding_name: str = "gpt-3.5-turbo-0613"
) -> int:
    encoding = tiktoken.encoding_for_model(encoding_name)
    num_tokens = len(encoding.encode(string))
    return num_tokens


def num_tokens_from_messages(messages, model="gpt-3.5-turbo-0613"):
    """Return the number of tokens used by a list of messages."""
    try:
        encoding = tiktoken.encoding_for_model(model)
    except KeyError:
        print("Warning: model not found. Using cl100k_base encoding.")
        encoding = tiktoken.get_encoding("cl100k_base")
    if model in {
        "gpt-3.5-turbo-0613",
        "gpt-3.5-turbo-16k-0613",
        "gpt-4-0314",
        "gpt-4-32k-0314",
        "gpt-4-0613",
        "gpt-4-32k-0613",
    }:
        tokens_per_message = 3
        tokens_per_name = 1
    elif model == "gpt-3.5-turbo-0301":
        tokens_per_message = (
            4  # every message follows <|start|>{role/name}\n{content}<|end|>\n
        )
        tokens_per_name = -1  # if there's a name, the role is omitted
    elif "gpt-3.5-turbo" in model:
        print(
            "Warning: gpt-3.5-turbo may update over time. Returning num tokens assuming gpt-3.5-turbo-0613."
        )
        return num_tokens_from_messages(messages, model="gpt-3.5-turbo-0613")
    elif "gpt-4" in model:
        print(
            "Warning: gpt-4 may update over time. Returning num tokens assuming gpt-4-0613."
        )
        return num_tokens_from_messages(messages, model="gpt-4-0613")
    else:
        raise NotImplementedError(
            f"""num_tokens_from_messages() is not implemented for model {model}. See https://github.com/openai/openai-python/blob/main/chatml.md for information on how messages are converted to tokens."""
        )
    num_tokens = 0
    for message in messages:
        num_tokens += tokens_per_message
        for key, value in message.items():
            num_tokens += len(encoding.encode(value))
            if key == "name":
                num_tokens += tokens_per_name
    num_tokens += 3  # every reply is primed with <|start|>assistant<|message|>
    return num_tokens


class Chat:
    def __init__(self, model="mixtral-8x7b-instruct"):
        if model not in AVAILABLE_MODELS and model not in GPT_AVAILABLE_MODELS:
            logging.error(f"Model {model} is not available!")
            exit(1)
        self.model = model
        self.gpt_client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.pplx_client = OpenAI(
            api_key=YOUR_API_KEY, base_url="https://api.perplexity.ai"
        )
        if self.model in GPT_AVAILABLE_MODELS:
            self.client = self.gpt_client
        else:
            self.client = self.pplx_client
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
        query_size = num_tokens_from_messages(self.messages)
        logging.info(f"current LLM prompt size: {query_size}")
        if query_size >= 8192:
            logging.warning(
                "LLM prompt size exceeds the limit 8192, will truncate the prompt."
            )
        response = self.client.chat.completions.create(
            model=self.model,
            temperature=temperature,
            messages=self.messages,
        )
        rsp_content = response.choices[0].message.content
        # logging.info(f"LLM response: \n{rsp_content}")
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
    def __init__(self, model="mixtral-8x7b-instruct", use_short_prompt=False):
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
        self.simplified_prompt = (
            compiler_short_prompts["general"]
            + compiler_short_prompts["mission"]
            + compiler_short_prompts["code_format"]
            + compiler_short_prompts["code_example"]
        )
        if use_short_prompt:
            self.use_short_prompt = True
            simplified_query_size = num_token_from_string(self.simplified_prompt)
            logging.info(f"LLM simplified prompt size: {simplified_query_size}")
            initial_messages = [
                {
                    "role": "system",
                    "content": (self.simplified_prompt),
                },
            ]
            self.messages = initial_messages
        else:
            self.use_short_prompt = False
            query_size = num_token_from_string(self.system_prompt)
            logging.info(f"LLM default prompt size: {query_size}")
            initial_messages = [
                {
                    "role": "system",
                    "content": (self.system_prompt),
                },
            ]
            self.messages = initial_messages

    # will only chat once
    def compile(self, code=None, out="tmp.s"):
        if os.path.exists(code):
            code_file_name = code.split("/")[-1]
            if code_file_name != "tmp.c":
                # copy to the current directory
                os.system(f"cp {code} .")
            # get the file name
            code_file_name = code.split("/")[-1]
            if code_file_name is not None:
                with open(code_file_name, "r") as f:
                    code = f.read()
        self.chat(user_input=code)
        compiler_rsp = self.messages[-1]["content"]
        self.assemble(compiler_rsp, out=out)
        # reset the messages
        if self.use_short_prompt:
            initial_messages = [
                {
                    "role": "system",
                    "content": (self.simplified_prompt),
                },
            ]
        else:
            initial_messages = [
                {
                    "role": "system",
                    "content": (self.system_prompt),
                },
            ]
        self.messages = initial_messages

    def assemble(self, compiler_rsp, out="output.s", generate_binary=False):
        if "```x86" in compiler_rsp:
            x86_code = compiler_rsp.split("```x86")[1].split("```")
            if len(x86_code) > 0:
                x86_code = x86_code[0]
            logging.info(f"x86 code: \n{x86_code}")
            with open(out, "w") as f:
                f.write(x86_code)
            if generate_binary:
                ret = subprocess.run(["gcc", out, "-c"])
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
