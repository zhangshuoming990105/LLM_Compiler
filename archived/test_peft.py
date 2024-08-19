import torch
from peft import (
    PeftModel,
    LoraConfig,
    get_peft_model,
)

from transformers import (
    AutoTokenizer,
    AutoModelForCausalLM,
)

from datasets import load_dataset

#inference using the adapters
tokenizer = AutoTokenizer.from_pretrained("deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True)

def tokenize(prompt):
    result = tokenizer(
        prompt,
        truncation=True,
        max_length=4096,
        padding=False,
        return_tensors=None,
    )

    # "self-supervised learning" means the labels are also the inputs:
    result["labels"] = result["input_ids"].copy()

    return result

def generate_and_tokenize_prompt(data_point):
    text = data_point["text"]
    full_prompt = f"""{text}
"""
    return tokenize(full_prompt)

corpus = load_dataset("mistral0105/emnlp_baseline_train_ds_for_deepseekcoder", split="train")
small_dataset = corpus.train_test_split(0.05, 0.95, True)
# a real small subset out of the dataset(5% -> 0.25%, 4.75%)
# small_dataset = small_dataset["test"].train_test_split(0.05, 0.95, True)
train_dataset = small_dataset["train"]
eval_dataset = small_dataset["test"]
print(train_dataset.shape)
print(eval_dataset.shape)

tokenized_train_dataset = train_dataset.map(
    generate_and_tokenize_prompt,
    cache_file_name=f".cache/tokenized_train_c_x86_O0_DeepSeek-Coder-V2-Lite-Instruct",
)
tokenized_val_dataset = eval_dataset.map(
    generate_and_tokenize_prompt,
    cache_file_name=f".cache/tokenized_eval_c_x86_O0_DeepSeek-Coder-V2-Lite-Instruct",
)
print("tokenize dataset done.")

for e in tokenized_val_dataset:
    print(e['text'])
    # print(e['input_ids'])
    # print(e['labels'])
    break

output_dir = "/root/workspace/LLM_Compiler/peft_trainer/lora_adapters/DeepSeek-Coder-V2-Lite-Instruct_c_x86_O0_lora64_32_0.02_none_b16_gpu4/checkpoint-5000"
adapter_name = output_dir
model = AutoModelForCausalLM.from_pretrained("deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True, device_map="auto")
model = PeftModel.from_pretrained(model, adapter_name)

test_case = """you are a professional AI assistant in code, based on the user input C code, 
you are going to help me to generate the corresponding x86 assembly.
You will perform like a compiler with O0 optimization level, the architecture is x86_64.
We can assume there will only be one function body to be compiled.
input code will be inside "```c" and "```"tags, please also make sure the generated x86 assembly be inside "```x86" and "```" tags.

User: ```c
#include <string.h>

int strcasecmp(const char *s1, const char *s2)
{
        const char * p1 = s1;
        const char * p2 = s2;
        char c1, c2;

        if (p1 == p2)
                return 0;

        do {
                c1 = ((*p1++) | 0x20);
                c2 = ((*p2++) | 0x20);
                if (c1 == '\0')
                        break;
        } while (c1 == c2);
        return (int) (c1 - c2);
}
```

Assistant:"""
input_0 = tokenizer(test_case, return_tensors="pt", truncation=True, max_length=2048).to('cuda')

generate_ids = model.generate(**input_0, max_new_tokens=2048)
print(generate_ids)
rsp_content = tokenizer.decode(generate_ids[0], skip_special_tokens=True)
print(rsp_content)
