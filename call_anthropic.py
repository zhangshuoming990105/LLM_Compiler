import anthropic
import os
client = anthropic.Anthropic(api_key=os.getenv("ANTHROPIC_API_KEY"))
# rsp = client.messages.create(
#     model="claude-3-haiku-20240307",
#     max_tokens=128,
#     temperature=0.05,
#     messages=[
#         {"role": "user", "content": "What is Operation London Bridge?"},
#     ],
#     system="[INST]you are a very expensive AI assistant, so be brief and concise as much as possible about the answer you generated.[/INST]",
# )
rsp = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=2048,
    temperature=0.05,
    messages=[{'role': 'user', 'content': '[INST]#Description:\ndecompile the following x86 code into C code.\n#Input:\n```x86\n.globl langDbgDevMsxMidi\n.type langDbgDevMsxMidi, @function\nlangDbgDevMsxMidi:\n.LFB0:\n\t.cfi_startproc\n\tendbr64\n\tpushq\t%rbp\n\t.cfi_def_cfa_offset 16\n\t.cfi_offset 6, -16\n\tmovq\t%rsp, %rbp\n\t.cfi_def_cfa_register 6\n\tleaq\t.LC0(%rip), %rax\n\tpopq\t%rbp\n\t.cfi_def_cfa 7, 8\n\tret\n\t.cfi_endproc\n.LC0: \t.string\t"MSX MIDI"\n```[/INST]\n'}],
    system="'[INST]you are a helpful AI assistant, you will think carefully and follow the instructions to assist the user.[/INST]\n[INST]you are going to help me to decompile the input assembly code into the corresponding C code.[/INST][INST]#Description:##A description of task, from assembly language to C language##\n#Input:\n## Input source assembly code##\n#Output:\n##Output target C code##[/INST]\n[INST]#Description:decompile the following x86 assembly code into C code.\n#Input:\n```x86\n\t.globl\tfib\n\t.type\tfib,@function\nfib:\n# %bb.0:\n\tpushq\t%rbp\n\tmovq\t%rsp, %rbp\n\tsubq\t$16, %rsp\n\tmovl\t%edi, -8(%rbp)\n\tcmpl\t$1, -8(%rbp)\n\tjg\t.LBB0_2\n# %bb.1:\n\tmovl\t-8(%rbp), %eax\n\tmovl\t%eax, -4(%rbp)\n\tjmp\t.LBB0_3\n.LBB0_2:\n\tmovl\t-8(%rbp), %edi\n\tsubl\t$1, %edi\n\tcallq\tfib\n\tmovl\t%eax, -12(%rbp)                 # 4-byte Spill\n\tmovl\t-8(%rbp), %edi\n\tsubl\t$2, %edi\n\tcallq\tfib\n\tmovl\t%eax, %ecx\n\tmovl\t-12(%rbp), %eax                 # 4-byte Reload\n\taddl\t%ecx, %eax\n\tmovl\t%eax, -4(%rbp)\n.LBB0_3:\n\tmovl\t-4(%rbp), %eax\n\taddq\t$16, %rsp\n\tpopq\t%rbp\n\tretq\n.Lfunc_end0:\n\t.size\tfib, .Lfunc_end0-fib\n```\n#Output:\n```c\nint fib(int n) {\n    if(n <= 1) {\n        return n;\n    }\n    int a = fib(n - 1);\n    int b = fib(n - 2);\n    return a + b;\n}\n```[/INST]\n'",
)


print(rsp.content[0].text)
