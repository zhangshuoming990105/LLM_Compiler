   .text
    .globl  retPosVector
retPosVector:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp           # Allocate space for local variables
    movb    %dil, -1(%rbp)      # letra
    movq    %rsi, -16(%rbp)     # alfabeto
    movl    $0, -20(%rbp)       # i_0 = 0
.L1:
    movl    -20(%rbp), %eax
    movq    -16(%rbp), %rdx
    movzbl  (%rdx,%rax,1), %ecx
    testb   %cl, %cl
    je      .L2                 # if alfabeto[i_0] == 0, exit loop
    movl    -20(%rbp), %eax
    movq    -16(%rbp), %rdx
    movzbl  (%rdx,%rax,1), %ecx
    cmpb    -1(%rbp), %cl       # if alfabeto[i_0] == letra
    je      .L3
    addl    $1, -20(%rbp)       # i_0++
    jmp     .L1
.L2:
    leave
    ret
.L3:
    movl    -20(%rbp), %eax     # return i_0
    leave
    ret