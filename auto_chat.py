import os
from openai import OpenAI
from config import AVAILABLE_MODELS, GPT_AVAILABLE_MODELS


openai_client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
pplx_client = OpenAI(
    api_key=os.getenv("PPLX_API_KEY"), base_url="https://api.perplexity.ai"
)

model = "llama-3-sonar-small-32k-online"
if model in AVAILABLE_MODELS:
    client = pplx_client
elif model in GPT_AVAILABLE_MODELS:
    client = openai_client
else:
    raise ValueError(
        f"Model {model} not found in AVAILABLE_MODELS or GPT_AVAILABLE_MODELS"
    )


prompt = "Hi, what time is it in Rochester, NY, USA right now?"
completion = client.chat.completions.create(
    model=model, messages=[{"role": "user", "content": prompt}]
)
print(completion.choices[0].message.content)
