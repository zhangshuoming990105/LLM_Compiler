# Load model directly
import os
os.environ["TOKENIZERS_PARALLELISM"] = "false"
from transformers import AutoTokenizer, AutoModelForCausalLM
import torch



if __name__ == "__main__":
    device = "cuda" if torch.cuda.is_available() else "cpu"

    tokenizer = AutoTokenizer.from_pretrained("facebook/llm-compiler-7b")
    model = AutoModelForCausalLM.from_pretrained("facebook/llm-compiler-7b")
    # c_path = argv[1]
    
    c_code = ""
    with open("test.c", "r") as f:
        c_code = f.read()
        f.close()
    prompts = f"""compile the following C code into x86 code:
    Input C code:
    ```c
    {c_code}
    ```
    Output x86 code:
    """
    tokenizer.pad_token = tokenizer.eos_token
    inputs = tokenizer(prompts, return_tensors="pt").to(device)
    model = model.to(device)
    outputs = model.generate(**inputs, max_length=1024)
    decoded_output = tokenizer.decode(outputs[0], skip_special_tokens=True)
    print(decoded_output)
