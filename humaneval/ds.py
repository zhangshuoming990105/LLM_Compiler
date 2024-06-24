from datasets import *
dataset = load_dataset("openai/openai_humaneval")
for e in dataset["test"]:
    print(e["prompt"])
    print("# Solution:")
    print(e["canonical_solution"])
    print("# UnitTest:")
    print(e["test"])
    break