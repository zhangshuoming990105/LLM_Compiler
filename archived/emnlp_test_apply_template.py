from transformers import AutoModelForCausalLM, AutoTokenizer
from transformers import Conv1D
import torch
# tokenizer = AutoTokenizer.from_pretrained(
#     "deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True
# )
tokenizer = AutoTokenizer.from_pretrained(
    "codellama/CodeLlama-7b-Instruct-hf", trust_remote_code=True
)

# messages = [
#     {
#         "role": "system",
#         "content": "you are ChatGPT, a chatbot that can help you with your questions",
#     },
#     {
#         "role": "user",
#         "content": "I need help with my computer",
#     },
#     {
#         "role": "assistant",
#         "content": "Sure! I can help.",
#     },
# ]

# out = tokenizer.apply_chat_template(
#     messages, tokenize=False, add_generation_prompt=True
# )
# print(out)

model = AutoModelForCausalLM.from_pretrained(
    "deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True
    # "codellama/CodeLlama-7b-Instruct-hf", trust_remote_code=True
)



def get_specific_layer_names(model):
    # Create a list to store the layer names
    layer_names = []
    
    # Recursively visit all modules and submodules
    for name, module in model.named_modules():
        # Check if the module is an instance of the specified layers
        if isinstance(module, (torch.nn.Linear, torch.nn.Embedding, torch.nn.Conv2d, Conv1D)):
            # model name parsing 

            layer_names.append('.'.join(name.split('.')[4:]).split('.')[0])
    
    return layer_names

print(list(set(get_specific_layer_names(model))))