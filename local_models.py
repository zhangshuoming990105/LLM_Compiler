import datetime
import tiktoken
from openai import OpenAI
import anthropic
import os
import logging
import subprocess
from prompts import (
    compiler_prompts,
    compiler_short_prompts,
    decompiler_prompts,
    code_translator_prompts,
    emnlp_baseline_prompts,
)
from config import (
    AVAILABLE_MODELS,
    YOUR_API_KEY,
    GPT_AVAILABLE_MODELS,
    ANTHROPIC_AVAILABLE_MODELS,
)
from transformers import AutoModelForCausalLM


class Chat:
    def __init__(self, model="mixtral-8x7b-instruct"):
        if (
            model not in AVAILABLE_MODELS
            and model not in GPT_AVAILABLE_MODELS
            and model not in ANTHROPIC_AVAILABLE_MODELS
        ):
            logging.error(f"Model {model} is not available!")
            exit(1)
        self.model = model
        self.gpt_client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.pplx_client = OpenAI(
            api_key=YOUR_API_KEY, base_url="https://api.perplexity.ai"
        )
        self.claude_client = anthropic.Anthropic(api_key=os.getenv("ANTHROPIC_API_KEY"))
        if self.model in GPT_AVAILABLE_MODELS:
            self.client = self.gpt_client
        elif self.model in ANTHROPIC_AVAILABLE_MODELS:
            self.client = self.claude_client
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
        if self.model in ANTHROPIC_AVAILABLE_MODELS:
            self.messages = []

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
        if self.model in ANTHROPIC_AVAILABLE_MODELS:
            anthropic_client = anthropic.Anthropic(api_key=os.getenv("ANTHROPIC_API_KEY"))
            message = anthropic_client.messages.create(
                model=self.model,
                system=self.system_prompt,
                max_tokens=2048,
                temperature=temperature,
                messages=self.messages,
            )
            rsp_content = message.content[0].text
        else:
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
    def __init__(self, model="mixtral-8x7b-instruct", use_short_prompt=False, use_emnlp_prompt=False):
        super().__init__(model)
        self.full_prompt = (
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
        if use_emnlp_prompt:
            self.simplified_prompt = emnlp_baseline_prompts["general"]
            self.use_short_prompt = True
            use_short_prompt = True
        if use_short_prompt:
            self.system_prompt = self.simplified_prompt
            self.use_short_prompt = True
        else:
            self.system_prompt = self.full_prompt
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
        if self.model in ANTHROPIC_AVAILABLE_MODELS:
            self.messages = []

    # will only chat once
    def compile(self, code=None, out="tmp.s", reset_messages=True):
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
        if reset_messages:
            initial_messages = [
                {
                    "role": "system",
                    "content": (self.system_prompt),
                },
            ]
            self.messages = initial_messages
            if self.model in ANTHROPIC_AVAILABLE_MODELS:
                self.messages = []

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


# Load model directly

model = AutoModelForCausalLM.from_pretrained("deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True)