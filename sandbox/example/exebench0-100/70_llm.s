    .text
    .globl  mote64_Name
mote64_Name:
    pushq   %rbp
    movq    %rsp, %rbp
    movq    $.L.str, %rax       # Load address of the string "MOTE64" into %rax
    popq    %rbp
    retq

    .section .rodata
.L.str:
    .string "MOTE64"