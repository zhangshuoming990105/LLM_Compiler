    .text
    .globl  quant
    .type   quant, @function
quant:
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    movl    %edi, -20(%rbp)    # n
    movl    %esi, -24(%rbp)    # m
    movl    $0, -4(%rbp)       # neg = 0
    cmpl    $0, -20(%rbp)
    jge     .L2
    addl    $1, -4(%rbp)       # neg++
    negl    -20(%rbp)          # n = -n
.L2:
    movl    -20(%rbp), %eax
    cltd
    idivl   -24(%rbp)
    movl    %eax, -8(%rbp)     # i = n / m
    movl    -8(%rbp), %eax
    imull   -24(%rbp), %eax    # m * i
    movl    -20(%rbp), %edx
    subl    %eax, %edx         # n - m * i
    movl    -24(%rbp), %eax
    movl    %eax, %ecx
    shrl    $31, %ecx
    addl    %ecx, %eax
    sarl    %eax               # m / 2
    cmpl    %eax, %edx
    jle     .L3
    addl    $1, -8(%rbp)       # i += 1
.L3:
    movl    -8(%rbp), %eax
    imull   -24(%rbp), %eax    # i *= m
    movl    %eax, -8(%rbp)
    cmpl    $0, -4(%rbp)
    je      .L4
    negl    -8(%rbp)           # i = -i
.L4:
    movl    -8(%rbp), %eax     # return i
    popq    %rbp
    ret