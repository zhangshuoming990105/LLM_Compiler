import datetime
from openai import OpenAI
import os
import random
import logging
import subprocess
from neural.prompts import prompts

YOUR_API_KEY = "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"

# tier 1: neural-symbolic compiler for c function to assembly
"""
Components:
1. general LLM
2.1 fine-tuned LLM for c-x86 translation
2.2 fine-tuned LLM for c-riscv translation
2.3 fine-tuned LLM for c-arm translation
3. stack allocator(symbolic)
4. cfg generator(symbolic)
5. 
"""
# neural-symbolic stack allocation for any c function
"""
1. neural:
input: c function
output: c function with renamed variables
2. neural:
input: c function
output: list of variables with type, size, alignment
3. symbolic:
input: list of variables with type, size, alignment
output: variable binding table that satisfy (non-overlapping, alignment) requirement
4. neural:
input: c function, variable binding table from 3
output: assembly code
"""
AVAILABLE_MODELS = [
    "mixtral-8x7b-instruct",
    "llama-3-8b-instruct",
    "llama-3-70b-instruct",
    "llama-3-sonar-large-32k-online",
    "llama-3-sonar-large-32k-chat",
    "llama-3-sonar-small-32k-online",
    "llama-3-sonar-small-32k-chat",
]


# wrapper for OpenAI chat API to interact with the assistant
class Chat():
    def __init__(self, model = "mixtral-8x7b-instruct"):
        # check model in AVAILABLE_MODELS
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

    # one round chat, user input -> assistant response
    def chat(self, temperature=0.01):
        user_input = input("User: \n")
        logging.info(f"User input: \n{user_input}")
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
        print(rsp_content)
        logging.info(f"Assistant response: \n{rsp_content}")
        self.messages.append(
            {
                "role": "assistant",
                "content": rsp_content,
            }
        )


class Compiler(Chat):
    def __init__(self):
        super().__init__()
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


if __name__ == "__main__":
    cwd = os.getcwd()
    root_dir = cwd.split("LLM_Compiler")[0]
    os.chdir(root_dir)
    if os.path.exists("LLM_Compiler"):
        os.chdir("LLM_Compiler")
        print(os.getcwd())
        root_dir = os.getcwd()
    else:
        print("Failed to locate the working directory!")
        exit(1)
    python_dir = os.path.join(root_dir, "python")
    sandbox_dir = os.path.join(root_dir, "sandbox/temp")
    log_dir = os.path.join(root_dir, "logs")
    # create temp name
    temp_name = f"temp_{random.randint(0, 1000000)}"
    temp_dir = os.path.join(sandbox_dir, temp_name)
    # create temp dir
    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir, exist_ok=True)
    # create log file
    log_file = os.path.join(log_dir, f"{temp_name}.log")

    logging.basicConfig(filename=log_file, level=logging.INFO)
    logging.info("log file created!")
    # log time
    logging.info("Start time: " + str(datetime.datetime.now()))

    compiler = Chat("llama-3-sonar-large-32k-online")
    for i in range(3):
        compiler.chat()
    logging.info("End time: " + str(datetime.datetime.now()))


# # create a chat-response loop
# for i in range(3):
#     # user input
#     user_input = input(f"Iteration {i}\nUser: \n")
#     print(user_input)
#     print("=" * 20)
#     # possible tools, handling user input
#     # 1. if input is a file path, read the file content
#     # 2. if input is a error message, analyze the error message
#     # 3. if input is a question, answer the question
#     # others, just use the input as it is

#     # 1. convert the input into abs path or relative path
#     if os.path.exists(user_input):
#         with open(user_input, "r") as f:
#             user_input = f.read()
#         print(user_input)
#         print("=" * 20)
#     messages.append(
#         {
#             "role": "user",
#             "content": user_input,
#         }
#     )
#     response = client.chat.completions.create(
#         model="mixtral-8x7b-instruct",
#         temperature=0.01,
#         messages=messages,
#     )
#     rsp_content = response.choices[0].message.content
#     print(rsp_content)
#     # grep the ```x86 code``` part
#     if "```x86" in rsp_content:
#         x86_code = rsp_content.split("```x86")[1].split("```")[0]
#         print(x86_code)
#         print("=" * 20)
#         # write the x86 code into a file
#         with open("output.s", "w") as f:
#             f.write(x86_code)
#         # compile the x86 code into object file, output.o
#         ret = subprocess.run(["clang", "-arch", "x86_64", "output.s", "-c"])
#         if ret.returncode != 0:
#             print("Failed to compile the x86 code!")
#             error_output = ret.stderr
#             normal_output = ret.stdout
#             print(error_output)
#             print(normal_output)
#             # we can further analyze them
#         else:
#             print("Succeed to compile the x86 code!")
#             # break
#     messages.append(
#         {
#             "role": "assistant",
#             "content": rsp_content,
#         }
#     )
