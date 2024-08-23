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
    fix_prompts,
)
from config import (
    PPLX_AVAILABLE_MODELS,
    YOUR_API_KEY,
    GPT_AVAILABLE_MODELS,
    ANTHROPIC_AVAILABLE_MODELS,
    DEEPSEEK_AVAILABLE_MODELS,
    OLLAMA_AVAILABLE_MODELS,
)

# local mode
from transformers import AutoModelForCausalLM, AutoTokenizer
import torch
from peft import (
    PeftModel,
    LoraConfig,
    get_peft_model,
)


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
    def __init__(
        self,
        model="mixtral-8x7b-instruct",
        use_local=False,
        temperature=0.3,
        peft_model="",
    ):
        if (
            model not in PPLX_AVAILABLE_MODELS
            and model not in GPT_AVAILABLE_MODELS
            and model not in ANTHROPIC_AVAILABLE_MODELS
            and model not in DEEPSEEK_AVAILABLE_MODELS
            and model not in OLLAMA_AVAILABLE_MODELS
            and use_local is False
        ):
            logging.error(f"Model {model} is not available!")
            exit(1)
        self.use_local = False
        if use_local:
            self.use_local = True
            self.tokenizer = AutoTokenizer.from_pretrained(
                model, trust_remote_code=True
            )
            self.local_model = AutoModelForCausalLM.from_pretrained(
                model,
                trust_remote_code=True,
                torch_dtype=torch.float16,
                device_map="auto",
            )
            if peft_model != "":
                self.local_model = PeftModel.from_pretrained(
                    self.local_model, peft_model
                )
                self.is_finetuned = True
            else:
                self.is_finetuned = False
        self.model = model
        self.temperature = temperature
        self.gpt_client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.pplx_client = OpenAI(
            api_key=YOUR_API_KEY, base_url="https://api.perplexity.ai"
        )
        self.claude_client = anthropic.Anthropic(api_key=os.getenv("ANTHROPIC_API_KEY"))
        self.deepseek_client = OpenAI(
            api_key="sk-de942e3222de415cb5636482c0b6a378",
            base_url="https://api.deepseek.com",
        )
        self.ollama_client = OpenAI(
            base_url="http://localhost:11434/v1/",
            api_key="ollama",  # required, but unused
        )
        if self.model in GPT_AVAILABLE_MODELS:
            self.client = self.gpt_client
        elif self.model in ANTHROPIC_AVAILABLE_MODELS:
            self.client = self.claude_client
        elif self.model in DEEPSEEK_AVAILABLE_MODELS:
            self.client = self.deepseek_client
        elif self.model in PPLX_AVAILABLE_MODELS:
            self.client = self.pplx_client
        elif self.use_local:
            self.client = self.local_model
        else:
            self.client = self.ollama_client
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

    def message_reset(self):
        initial_messages = [
            {
                "role": "system",
                "content": (self.system_prompt),
            },
        ]
        self.messages = initial_messages
        if self.model in ANTHROPIC_AVAILABLE_MODELS:
            self.messages = []

    def local_chat(self, temperature, user_input=None):
        if user_input is None:
            user_input = input("User: \n")
            logging.info(f"stdin user input: \n{user_input}")
        self.messages.append(
            {
                "role": "user",
                "content": user_input,
            }
        )
        assert self.use_local, "Local mode is not enabled."
        with torch.no_grad():
            # grep the ```c code ``` from the user input
            if "```c" in user_input:
                user_input = user_input.split("```c")[1].split("```")
                if len(user_input) > 0:
                    user_input = user_input[0]
            if not self.is_finetuned:
                messages = [
                    {
                        "role": "system",
                        "content": r"""you are a professional AI assistant in code, based on the user input C code, 
you are going to help me to generate the corresponding x86 assembly.
You will perform like a compiler with O0 optimization level, the architecture is x86_64.
We can assume there will only be one function body to be compiled.
input code will be inside "```c" and "```"tags, please also make sure the generated x86 assembly be inside "```x86" and "```" tags.
Example is below:
User:
```c
int main() {
    printf("Hello, World!\n");
    return 0;
}
```
Assistant:
```x86
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	popq	%rbp
	ret
.LC0:
	.string	"Hello, World!"
 
 ```
 """,
                    },
                    {
                        "role": "user",
                        "content": f"""```c
{user_input}
```""",
                    },
                ]
            else:
                messages = [
                    {
                        "role": "system",
                        "content": r"""you are a professional AI assistant in code, based on the user input C code, 
you are going to help me to generate the corresponding x86 assembly.
You will perform like a compiler with O0 optimization level, the architecture is x86_64.
We can assume there will only be one function body to be compiled.
input code will be inside "```c" and "```"tags, please also make sure the generated x86 assembly be inside "```x86" and "```" tags.
""",
                    },
                    {
                        "role": "user",
                        "content": f"""```c
{user_input}
```""",
                    },
                ]
            message_prompt = self.tokenizer.apply_chat_template(
                messages, tokenize=False, add_generation_prompt=True
            )
            # logging.info("Actual LLM Input:" + message_prompt)
            inputs = self.tokenizer(
                message_prompt,
                return_tensors="pt",
                max_length=2048,
                truncation=True,
            ).to("cuda")
            outputs = self.local_model.generate(
                **inputs,
                temperature=temperature,
                do_sample=True,
                max_new_tokens=2048,
                repetition_penalty=1.1,
                # output_scores=True,
            )
            rsp_content = self.tokenizer.decode(outputs[0])
            # logging.info("Actual LLM Output:" + rsp_content)
            rsp_content = rsp_content[len(message_prompt) :]
        self.messages.append(
            {
                "role": "assistant",
                "content": rsp_content,
            }
        )

    def non_local_chat(self, temperature, user_input=None):
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
        logging.debug(f"current LLM prompt: {self.messages}")
        if query_size >= 8192:
            logging.warning(
                "LLM prompt size exceeds the limit 8192, will truncate the prompt."
            )
        if self.model in ANTHROPIC_AVAILABLE_MODELS:
            anthropic_client = anthropic.Anthropic(
                api_key=os.getenv("ANTHROPIC_API_KEY")
            )
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
        logging.debug(f"LLM response: \n{rsp_content}")
        self.messages.append(
            {
                "role": "assistant",
                "content": rsp_content,
            }
        )

    def chat(self, temperature, user_input=None):
        if self.use_local:
            self.local_chat(temperature=temperature, user_input=user_input)
        else:
            self.non_local_chat(temperature=temperature, user_input=user_input)

    def paraphrase(self, text):
        task_description = "paraphrase the following text, make sure it is well written and syntax correct."
        prompt = f"{task_description}\n{text}"
        self.chat(user_input=prompt)
        paraphrased_text = self.messages[-1]["content"]
        logging.info(f"Paraphrased text: \n{paraphrased_text}")
        return paraphrased_text


class Compiler(Chat):
    def __init__(
        self,
        model="mixtral-8x7b-instruct",
        use_one_shot_prompt=False,
        use_zero_shot_prompt=False,
        use_local=False,
        temperature=0.3,
        peft_model="",
    ):
        super().__init__(
            model, use_local=use_local, temperature=temperature, peft_model=peft_model
        )
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
        if use_zero_shot_prompt:
            self.simplified_prompt = emnlp_baseline_prompts["general"]
            self.use_one_shot_prompt = True
            use_one_shot_prompt = True
        if use_one_shot_prompt:
            self.system_prompt = self.simplified_prompt
            self.use_one_shot_prompt = True
        else:
            self.system_prompt = self.full_prompt
            self.use_one_shot_prompt = False

        query_size = num_token_from_string(self.system_prompt)
        logging.info(f"LLM default prompt size: {query_size}")
        self.message_reset()

    def compile_with_error_message(
        self,
        code=None,
        out="tmp.s",
        reset_messages=True,
        use_local=False,
        error_asm="",
        error_message="",
        prompt_prefix="",
        prompt_postfix="",
    ):
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
        code = f"#Input:\n```c\n{code}\n```"
        error_asm = f"#Output:\n```x86\n{error_asm}\n```"
        error_prompt = (
            fix_prompts["error_message_pre"]
            + f"```plaintext\n{error_message}\n```"
            + fix_prompts["error_message_post"]
        )
        prompt = (
            f"{prompt_prefix}\n{code}\n{error_asm}\n{error_prompt}\n{prompt_postfix}"
        )
        self.chat(user_input=prompt, temperature=self.temperature)
        compiler_rsp = self.messages[-1]["content"]
        self.assemble(compiler_rsp, out=out)
        if reset_messages:
            self.message_reset()

    # will only chat once
    def compile(
        self,
        code=None,
        out="tmp.s",
        reset_messages=True,
        use_local=False,
        prompt_prefix="",
        prompt_postfix="",
    ):
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
        # warp code between ```c and ```
        code = f"#Input:\n```c\n{code}\n```"
        self.chat(user_input=code, temperature=self.temperature)
        compiler_rsp = self.messages[-1]["content"]
        self.assemble(compiler_rsp, out=out)
        # reset the messages
        if reset_messages:
            self.message_reset()

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

    def analyze(self, code, temperature):
        # 0. a general analysis on the code, find out what the code is doing
        # 1. analyze if code contains numerical values
        # 2. analyze if code contains string values
        # 3. analyze if code contains function calls
        # 4. analyze if code is recursive
        prompt = fix_prompts["analyze_pre"]
        prompt += f"""Below is the code you need to analyze:
```c
{code}
```
{fix_prompts["analyze_post"]}
"""
        self.chat(user_input=prompt, temperature=temperature)
        # handle rsp, if error, return default values
        rsp = self.messages[-1]["content"]
        numerical = False
        hex_octal = False
        functioncall = False
        recursive = False
        try:
            # grep the rsp in ```plaintext and ```
            rsp = rsp.split("```plaintext")[1].split("```")[0]
            # rsp is "True/False, True/False, True/False, True/False"
            rsp = rsp.split(",")
            if len(rsp) == 4:
                numerical = True if rsp[0].strip() == "True" else False
                hex_octal = True if rsp[1].strip() == "True" else False
                functioncall = True if rsp[2].strip() == "True" else False
                recursive = True if rsp[3].strip() == "True" else False
            else:
                logging.warning(f"Failed to parse the analysis result! the response is {rsp}")
        except Exception as e:
            logging.warning(f"Failed to parse the analysis result: \n{e}")
        self.message_reset()
        return numerical, hex_octal, functioncall, recursive


class Decompiler(Chat):
    def __init__(self, model="mixtral-8x7b-instruct", arch="x86"):
        super().__init__(model)
        self.system_prompt = (
            decompiler_prompts["general"]
            + decompiler_prompts["mission"]
            + decompiler_prompts["task_format"]
            + decompiler_prompts["task_example"]
        )
        self.initial_messages = [
            {
                "role": "system",
                "content": (self.system_prompt),
            },
        ]
        self.messages = self.initial_messages
        if self.model in ANTHROPIC_AVAILABLE_MODELS:
            self.messages = []
        self.arch = arch

    def decompile(self, code=None, reset_messages=True):
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
        self.chat(user_input=code, temperature=self.temperature)
        decompiler_rsp = self.messages[-1]["content"]
        if f"```c" in decompiler_rsp:
            c_code = decompiler_rsp.split("```c")[1].split("```")
            if len(c_code) > 0:
                c_code = c_code[0]
            # logging.info(f"C code: \n{c_code}")
        else:
            logging.warning('Failed to find the C code tag "```c"!')
            c_code = decompiler_rsp
        with open("disassembled.c", "w") as f:
            f.write(c_code)
        # reset the messages for the next round
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


class CodeTranslator(Chat):
    def __init__(self, model="mixtral-8x7b-instruct", source="python", target="c"):
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
        if self.model in ANTHROPIC_AVAILABLE_MODELS:
            self.messages = []

    def translate(
        self,
        code=None,
        source="python",
        target="c",
        specify_out_file="",
        desc_pre="",
        desc_post="",
        reset_messages=True,
    ):
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
        # description = self.paraphrase(description)
        prompt = desc_pre
        prompt += f"[INST]#Description:\n{description}\n[/INST]#Input:\n```{source}\n{code}```\n"
        prompt += desc_post

        self.chat(user_input=code, temperature=self.temperature)
        compiler_rsp = self.messages[-1]["content"]
        # logging.info(f"Translated code: \n{compiler_rsp}")
        # grep the translated code
        if f"```{target}" in compiler_rsp:
            target_code = compiler_rsp.split(f"```{target}")[1].split("```")
            if len(target_code) > 0:
                target_code = target_code[0]
            logging.info(f"target {target} code: \n{target_code}")
            if specify_out_file == "":
                with open(f"output.{target}", "w") as f:
                    f.write(target_code)
            else:
                with open(specify_out_file, "w") as f:
                    f.write(target_code)
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
