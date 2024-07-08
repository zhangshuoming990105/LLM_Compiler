    .text
    .globl  light_time
light_time:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp           # Allocate space for local variables
    movsd   %xmm0, -8(%rbp)     # distance
    movsd   .LC0(%rip), %xmm0   # t = 0.0
    movsd   %xmm0, -16(%rbp)    # t
    # movsd   .LC0, -16(%rbp)     # t = 0.0
    movsd   -16(%rbp), %xmm0    # return t
    leave
    retq

    .section .rodata
.LC0:
    .double 0.0