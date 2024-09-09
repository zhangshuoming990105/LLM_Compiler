import tiktoken
import os

def num_token_from_string(
    string: str, encoding_name: str = "gpt-3.5-turbo-0613"
) -> int:
    encoding = tiktoken.encoding_for_model(encoding_name)
    num_tokens = len(encoding.encode(string))
    return num_tokens

dir = "/root/workspace/LLM_Compiler/sandbox/longfunction_workspace/"
for file in os.listdir(dir):
    if file.endswith(".c"):
        c_code = open(dir + file, "r").read()
        c_tokens = num_token_from_string(c_code)
        print(f"{file}: {c_tokens}")
    if file.endswith(".s"):
        asm_code = open(dir + file, "r").read()
        asm_tokens = num_token_from_string(asm_code)
        print(f"{file}: {asm_tokens}")