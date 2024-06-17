import datetime
from openai import OpenAI
import os
import random
import logging
import subprocess
from neural.prompts import prompts

YOUR_API_KEY = "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"

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
        # print(rsp_content)
        logging.info(f"Assistant response: \n{rsp_content}")
        self.messages.append(
            {
                "role": "assistant",
                "content": rsp_content,
            }
        )


class Compiler(Chat):
    def __init__(self, model="mixtral-8x7b-instruct"):
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
        
    def chat(self, temperature=0.01, user_input=None):
        super().chat(temperature, user_input)
        
    def compile(self, code=None):
        # identify the code type
        # first assume it's c code
        # check code is a file path or code content
        if os.path.exists(code):
            with open(code, "r") as f:
                code = f.read()
        self.chat(user_input=code)
        # grep the ```x86 code``` part
        compiler_rsp = self.messages[-1]["content"]
        self.assemble(compiler_rsp)
    
    #   
    def assemble(self, compiler_rsp):
    # grep the ```x86 code``` part
        if "```x86" in compiler_rsp:
            x86_code = compiler_rsp.split("```x86")[1].split("```")[0]
            logging.info(f"x86 code: \n{x86_code}")
            # write the x86 code into a file
            with open("output.s", "w") as f:
                f.write(x86_code)
            # compile the x86 code into object file, output.o
            ret = subprocess.run(["clang", "-arch", "x86_64", "output.s", "-c"])
            if ret.returncode != 0:
                error_output = ret.stderr
                normal_output = ret.stdout
                logging.warning("Failed to compile the x86 code!")
                logging.info(error_output)
                logging.info(normal_output)
                # we can further analyze them
            else:
                logging.info("Succeed to compile the x86 code!")
        else:
            logging.warning("Failed to find the x86 code!")
        
        
def get_env():
    cwd = os.getcwd()
    root_dir = cwd.split("LLM_Compiler")[0]
    os.chdir(root_dir)
    if os.path.exists("LLM_Compiler"):
        os.chdir("LLM_Compiler")
        root_dir = os.getcwd()
    else:
        root_dir = None
    return root_dir

if __name__ == "__main__":
    root_dir = get_env()
    if root_dir is None:
        print("Failed to locate the working directory!")
        exit(1)
    python_dir = os.path.join(root_dir, "python")
    sandbox_dir = os.path.join(root_dir, "sandbox/temp")
    log_dir = os.path.join(root_dir, "logs")
    # create temp name with random number + date
    temp_name = f"temp_{datetime.datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}_{random.randint(0, 1000000)}"
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

    # initialize the compiler
    compiler = Compiler()
    # compiler = Compiler("llama-3-sonar-large-32k-online")
    code = """int fib(int n) {
    if (n <= 1) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}"""
    file_code = "/Users/zhangshuoming/workspace/LLM_CoT_compilation/LLM_Compiler/sandbox/example/example.c"
    # first round chat
    compiler.compile(file_code)
    logging.info("End time: " + str(datetime.datetime.now()))
