"""
generate exe, input, output for each function
"""
import torch
import os
import time
import sys
import json
import subprocess
import argparse
from datasets import load_dataset
from transformers import (
    AutoTokenizer,
    AutoModelForCausalLM,
    LlamaForCausalLM,
    generation,
)
import struct
import re
os.environ["TOKENIZERS_PARALLELISM"] = "false"
# os.environ["CUDA_VISIBLE_DEVICES"] = "7"


def fill_template(c_src):
    prompt_template = f"""[INST]Compile the following C code into x86 assembly without optimization.
<code>
{c_src}
</code>
[/INST]
"""
    return prompt_template


def grab_assembly(raw_output: str, special_token="<code>"):
    # grab the ```asm{code}``` from raw_output
    start = raw_output.rfind(special_token)
    end = raw_output.rfind("</code>", start + 1)
    asm = raw_output[start + len(special_token) : end]
    return asm


def numeric_handler(asm: str):
    int_to_float = lambda n: struct.unpack("@f", struct.pack("@I", n))[0]
    float_to_int = lambda f: struct.unpack("@I", struct.pack("@f", f))[0]
    int_to_double = lambda n: struct.unpack("@d", struct.pack("@Q", n))[0]
    double_to_int = lambda f: struct.unpack("@Q", struct.pack("@d", f))[0]
    # find all float_to_int(float_value.f) pattern
    matches = re.findall(r"float_to_int\((\d+\.\d+)\)", asm)
    print(matches)
    for match in matches:
        value: int = float_to_int(float(match))
        asm = asm.replace("float_to_int(" + match + ")", str(value))

    matches = re.findall(r"double_to_quad\((\d+\.\d+)\)", asm)
    print(matches)
    for match in matches:
        value: int = double_to_int(float(match))
        asm = asm.replace("double_to_quad(" + match + ")", str(value))
    return asm


def run_inference(
    model: AutoModelForCausalLM,
    tokenizer: AutoTokenizer,
    eval_script: str,
    beam_num: int = 1,
):
    model_input = tokenizer(eval_script, return_tensors="pt").to("cuda")
    model.eval()
    with torch.no_grad():
        candidates = model.generate(
            **model_input,
            max_new_tokens=2048,
            # use_cache = False,
            # num_beams=beam_num,
            # num_return_sequences=beam_num,
            # do_sample=True,
            # temperature=1.2,
            # top_k=20,
            # top_p=0.9,
            
        )
        outputs = []
        for candidate in candidates:
            output = tokenizer.decode(candidate)
            output = grab_assembly(output)
            print(output)
            outputs.append(output)
        return outputs[0]


# this driver currently only support single file/function input
def run_driver(
    model,
    tokenizer,
    c_src: str,
    gen_asm: bool = False,
    gen_obj: bool = False,
    gen_lib: bool = False,
    gen_exe: bool = True,
    output_file: str = "a.out",
    need_numeric_handler: bool = False,
    beam_num: int = 1,
):
    ### 1. compile to generate assmebly
    prompt = fill_template(c_src)
    if len(prompt) > 2048:
        print(f"SKIP: very long input")
        return
    asm = run_inference(model, tokenizer, prompt, beam_num=beam_num)
    # asm = grab_assembly(output)
    if need_numeric_handler:
        asm = numeric_handler(asm)
    asm_file = open(f"tmp.s", "w")
    asm_file.write(asm)
    asm_file.close()
    if gen_asm:
        os.rename("tmp.s", output_file)
        return
    ### 2. assemble into static library
    try:
        ret = subprocess.run(
            ["gcc", "-c", f"tmp.s", "-o", f"tmp.o"], check=True, timeout=20
        )
        if gen_obj:
            # rm tmp.s
            os.remove("tmp.s")
            os.rename("tmp.o", output_file)
            return
        ret = subprocess.run(["ar", "rcs", f"libtmp.a", f"tmp.o"], check=True)
    except Exception:
        print(f"non_compilable: \n{asm}")
        return
    if gen_lib:
        # rm tmp.s, tmp.o
        os.remove("tmp.s")
        os.remove("tmp.o")
        os.rename("libtmp.a", output_file)
        return
    ### 3.TODO: assemble together into an executable(a main is needed)
    pass


def main(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument("-S", action="store_true", help="Generate assembly code")
    parser.add_argument("-c", action="store_true", help="Generate object code")
    parser.add_argument("-n", action="store_true", help="using numeric model")
    parser.add_argument("-a1", action="store_true", help="using augment1 model")
    parser.add_argument("-beam_num", action="store_true", help="using beam search")
    parser.add_argument("-lib", action="store_true", help="Generate static library")
    parser.add_argument("input_files", nargs="*")
    parser.add_argument("-o", metavar="OUTPUT_FILE", type=str, help="output file")
    parser.add_argument("-dry_run", action="store_true", help="dry run")
    args = parser.parse_args(argv)
    output_file = "a.out"
    if args.o:
        output_file = args.o
    if args.S:
        print("Generating assembly code")
        if output_file == "a.out":
            output_file = "tmp.s"
    if args.c:
        print("Generating object code")
        if output_file == "a.out":
            output_file = "tmp.o"
    if args.lib:
        print("Generating static library")
        if output_file == "a.out":
            output_file = "libtmp.a"
    beam_num = 1
    if args.beam_num:
        beam_num = 4
    input_files = []
    for f in args.input_files:
        if f.endswith(".c"):
            input_files.append(f)
    print(input_files)
    if not args.dry_run:
        need_numeric_handler = False
        base_model = "facebook/llm-compiler-7b"
        print(f"Loading aicc model from {base_model}")
        model = AutoModelForCausalLM.from_pretrained(
            base_model, torch_dtype=torch.float16, device_map="auto"
        )
        tokenizer = AutoTokenizer.from_pretrained(base_model)
        start_time = time.time()
        # todo:
        # 1. split the input file into functions
        # 2. compile each function into assembly
        # 3. concat the assembly into a single assembly file
        # 4. compile the assembly file into object file
        for c_src_file in input_files:
            c_src = open(c_src_file, "r").read()
            run_driver(
                model,
                tokenizer,
                c_src,
                gen_asm=args.S,
                gen_obj=args.c,
                gen_lib=args.lib,
                gen_exe=args.o,
                output_file=output_file,
                need_numeric_handler=need_numeric_handler,
                beam_num=beam_num,
            )
        end_time = time.time()
        print(
            f"total time: {time.strftime('%H:%M:%S', time.gmtime(end_time - start_time))}"
        )


if __name__ == "__main__":
    # args = [
    #     "-S",
    #     "-n",
    #     "/home/zhangshuoming/project/CompilerEval/utility_script/example.c",
    #     "-o",
    #     "/home/zhangshuoming/project/CompilerEval/utility_script/example_ai.s",
    #     # "-beam_num",
    # ]
    # main(args)
    main(sys.argv[1:])
