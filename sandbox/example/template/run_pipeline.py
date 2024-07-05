import os
import subprocess
from pipe_prompt import pipeline_prompts
from openai import OpenAI

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))


def pipeline_llm_compiler(src):
    """Input: src (str or Path), source code file to be compiled
    Output: None
    File Generation: test_llm.s in the same directory as src
    """
    # call the pipeline llm as compiler to obtain test_llm.s

    # Retrieval 1: call LLM with prompt 0 and src code

    # if src is path, read the content
    if os.path.isfile(src):
        src = open(src).read()

    query_0_prompt = pipeline_prompts[0] + "```c\n" + src + "```"

    completion = client.chat.completions.create(
        model="gpt-3.5-turbo", messages=[{"role": "user", "content": query_0_prompt}]
    )
    rsp_0 = completion.choices[0].message.content
    # grab the generated code between ```c and ``` in rsp_0
    generated_code = rsp_0.split("```c")[1].split("```")[0].strip()
    # write the generated code to test_driver.c
    with open("test_driver.c", "w") as f:
        f.write(generated_code)
    
    # pass


def cleanup():
    os.remove("ref")
    os.remove("ref.log")
    os.remove("hyp")
    os.remove("hyp.log")


def run_one_file():
    try:
        # gcc test_driver.c test.c -o ref
        ret = subprocess.run(["gcc", "test_driver.c", "test.c", "-o", "ref"])
        if ret.returncode != 0:
            raise Exception("Failed to compile reference code")
        # ./ref > ref.log
        ret = subprocess.run(["./ref"], stdout=open("ref.log", "w"))
        if ret.returncode != 0:
            raise Exception("Failed to run reference code")
        
        
        
        
        # call the pipeline llm as compiler to obtain test_llm.s
        pipeline_llm_compiler("/data/zhangshuoming/data_workspace/LLM_Compiler/sandbox/example/template/test.c")
        
        
        
        
        
        # gcc test_driver.c test_llm.s -o hyp
        ret = subprocess.run(["gcc", "test_driver.c", "test_llm.s", "-o", "hyp"])
        if ret.returncode != 0:
            raise Exception("Failed to compile hyp code")
        # ./hyp > hyp.log
        ret = subprocess.run(["./hyp"], stdout=open("hyp.log", "w"))
        if ret.returncode != 0:
            raise Exception("Failed to run hyp code")
        # diff ref.log hyp.log
        ret = subprocess.run(["diff", "ref.log", "hyp.log"])
        if ret.returncode != 0:
            raise Exception("Output mismatch")
        print("Output match")

        cleanup()
    except Exception as e:
        print(e)


if __name__ == "__main__":
    run_one_file()
