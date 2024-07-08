   .text
   .globl  quant
   .type   quant, @function
quant:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movl    %edi, -4(%rbp)
    movl    %esi, -8(%rbp)
    movl    $0, -12(%rbp)
    cmpl    $0, -4(%rbp)
    jl     .L2
    movl    $1, -12(%rbp)
    negl    -4(%rbp)
    movl    -4(%rbp), %eax
    negl    %eax
    movl    %eax, -4(%rbp)
.L2:
    movl    -4(%rbp), %eax
    cltq
    movl    -8(%rbp), %edx
    imull   %edx, %eax
    movl    $0, %edx
    cmpl    %edx, %eax
    jbe    .L3
    addl    $1, %eax
    imull   -8(%rbp), %eax
.L3:
    cmpl    $0, -12(%rbp)
    je     .L4
    negl    %eax
.L4:
    movl    %eax, %eax
    leave
    ret