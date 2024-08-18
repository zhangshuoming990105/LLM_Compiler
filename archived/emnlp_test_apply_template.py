from transformers import AutoModelForCausalLM, AutoTokenizer

# tokenizer = AutoTokenizer.from_pretrained(
#     "deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True
# )
tokenizer = AutoTokenizer.from_pretrained(
    "codellama/CodeLlama-7b-Instruct-hf", trust_remote_code=True
)

messages = [
    {
        "role": "system",
        "content": "you are ChatGPT, a chatbot that can help you with your questions",
    },
    {
        "role": "user",
        "content": "I need help with my computer",
    },
    {
        "role": "assistant",
        "content": "Sure! I can help.",
    },
]

out = tokenizer.apply_chat_template(
    messages, tokenize=False, add_generation_prompt=True
)
print(out)
