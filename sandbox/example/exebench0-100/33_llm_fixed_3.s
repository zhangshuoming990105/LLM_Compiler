    .text
    .globl  CgosStrLen
CgosStrLen:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp             # Allocate space for ss_0 and s
    movq    %rdi, -8(%rbp)        # s = %rdi
    movq    -8(%rbp), %rax
    movq    %rax, -16(%rbp)       # ss_0 = s
    cmpq    $0, -8(%rbp)          # if (!s)
    jne     .L1
    movl    $0, %eax              # return 0
    jmp     .L2

.L1:
    movq    -8(%rbp), %rax
.L3:
    cmpb    $0, (%rax)            # while (*s++)
    je      .L4
    incq    %rax
    jmp     .L3

.L4:
    movq    -16(%rbp), %rdx       # s - ss_0
    subq    %rdx, %rax
    movl    %eax, %eax            # zero-extend lower 32 bits of %rax into %eax

.L2:
    leave
    ret