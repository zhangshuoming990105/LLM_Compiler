from datasets import *
dataset = load_dataset("openai/openai_humaneval")
i = 0
for e in dataset["test"]:
    human_eval_py_code = ""
    human_eval_py_code += e["prompt"]
    human_eval_py_code += e["canonical_solution"]
    
    human_eval_driver_code = ""
    human_eval_driver_code += e["test"]
    print(e["prompt"])
    print("# Solution:")
    print(e["canonical_solution"])
    print("# UnitTest:")
    print(e["test"])
    # print(e)
    i += 1
    if i > 1:
        break
    
    
    