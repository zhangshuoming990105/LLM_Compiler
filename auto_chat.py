import os
import openai
openai.api_key = os.getenv("OPENAI_API_KEY")
import torch


api_key=os.getenv("OPENAI_API_KEY")
# base_url="https://api.perplexity.ai"
prompt = "Please generate a blog outline on how a beginner can break into the field of data science."
completion = openai.ChatCompletion.create(
  model="gpt-3.5-turbo",
  messages=[
    {"role": "system", "content": "You are a helpful assistant with extensive experience in data science and technical writing."},
    {"role": "user", "content": prompt}
  ]
)
print(completion.choices[0].message)

# device = "cuda" if torch.cuda.is_available() else "cpu"
# tokenizer = AutoTokenizer.from_pretrained("facebook/llm-compiler-7b")
# model = LlamaForCausalLM.from_pretrained("facebook/llm-compiler-7b")




