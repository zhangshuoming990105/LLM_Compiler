# Load model directly
import os

os.environ["TOKENIZERS_PARALLELISM"] = "false"
from transformers import AutoTokenizer, AutoModelForCausalLM
import torch


if __name__ == "__main__":
    device = "cuda" if torch.cuda.is_available() else "cpu"
    # facebook/llm-compiler-7b
    tokenizer = AutoTokenizer.from_pretrained("meta-llama/Meta-Llama-3-8B-Instruct")
    model = AutoModelForCausalLM.from_pretrained(
        "meta-llama/Meta-Llama-3-8B-Instruct"
    ).to(device)
    # c_path = argv[1]

    c_code = ""
    with open("sandbox/example/template/test.c", "r") as f:
        c_code = f.read()
        f.close()
    prompts = f"""compile the following C code into x86 assembly:
Please use explicitly typed AT&T syntax in the x86 code, putting them between "```x86" and "```" tags.
Note that the platform is x86-64 Linux.
Input C code:
```c
{c_code}
```
Output x86 code:
"""
    tokenizer.pad_token = tokenizer.eos_token
    inputs = tokenizer(prompts, return_tensors="pt").to(device)
    outputs = model.generate(**inputs)
    decoded_output = tokenizer.decode(outputs[0], skip_special_tokens=True)
    print(decoded_output)
