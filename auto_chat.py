import os
from openai import OpenAI

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

# base_url="https://api.perplexity.ai"
prompt = "Hello, Can you tell me what is Retrieval Augmented Generation?"
completion = client.chat.completions.create(model="gpt-3.5-turbo",
messages=[
  {"role": "user", "content": prompt}
])
print(completion.choices[0].message)

# device = "cuda" if torch.cuda.is_available() else "cpu"
# tokenizer = AutoTokenizer.from_pretrained("facebook/llm-compiler-7b")
# model = LlamaForCausalLM.from_pretrained("facebook/llm-compiler-7b")




