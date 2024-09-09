import tiktoken

def num_token_from_string(
    string: str, encoding_name: str = "gpt-3.5-turbo-0613"
) -> int:
    encoding = tiktoken.encoding_for_model(encoding_name)
    num_tokens = len(encoding.encode(string))
    return num_tokens

c_code = open("/root/workspace/LLM_Compiler/sandbox/longfunction_workspace/long2_it10.c", "r").read()
asm_code = open("/root/workspace/LLM_Compiler/sandbox/longfunction_workspace/llm_annotated_long2_it10_llm.s", "r").read()
c_tokens = num_token_from_string(c_code)
asm_tokens = num_token_from_string(asm_code)
print(c_tokens)
print(asm_tokens)