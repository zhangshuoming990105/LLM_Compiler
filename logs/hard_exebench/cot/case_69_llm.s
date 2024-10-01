
    .text
    .globl  FP_Cmp
    .type   FP_Cmp, @function
FP_Cmp:
.LF_FP_Cmp_entry:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $80, %rsp
    movss   %xmm0, -72(%rbp)  # Store a_fp
    movss   %xmm1, -76(%rbp)  # Store b_fp

    # a = (*(unsigned long*)&(a_fp));
    movss   -72(%rbp), %xmm0
    cvtss2sd %xmm0, %xmm0
    movq    %xmm0, -8(%rbp)
    movq    -8(%rbp), %rax
    movq    %rax, -64(%rbp)

    # b = (*(unsigned long*)&(b_fp));
    movss   -76(%rbp), %xmm0
    cvtss2sd %xmm0, %xmm0
    movq    %xmm0, -8(%rbp)
    movq    -8(%rbp), %rax
    movq    %rax, -56(%rbp)

    # if(a == b)
    movq    -64(%rbp), %rax
    cmpq    -56(%rbp), %rax
    jne     .L_if1_else

    # return 0;
    movl    $0, %eax
    jmp     .L_end

.L_if1_else:
    # as = a >> 31;
    movq    -64(%rbp), %rax
    sarq    $31, %rax
    movq    %rax, -48(%rbp)

    # bs = b >> 31;
    movq    -56(%rbp), %rax
    sarq    $31, %rax
    movq    %rax, -40(%rbp)

    # if(as > bs)
    movq    -48(%rbp), %rax
    cmpq    -40(%rbp), %rax
    jle     .L_if2_else

    # return -1;
    movl    $-1, %eax
    jmp     .L_end

.L_if2_else:
    # if(as < bs)
    movq    -48(%rbp), %rax
    cmpq    -40(%rbp), %rax
    jge     .L_if3_else

    # return 1;
    movl    $1, %eax
    jmp     .L_end

.L_if3_else:
    # gt = as ? -1 : 1;
    movq    -48(%rbp), %rax
    testq   %rax, %rax
    setne   %al
    movzbl  %al, %eax
    movl    %eax, -32(%rbp)
    negl    -32(%rbp)
    addl    $1, -32(%rbp)

    # ae = (a >> 23) & 0xff;
    movq    -64(%rbp), %rax
    shrq    $23, %rax
    andl    $0xff, %eax
    movl    %eax, -28(%rbp)

    # be = (b >> 23) & 0xff;
    movq    -56(%rbp), %rax
    shrq    $23, %rax
    andl    $0xff, %eax
    movl    %eax, -24(%rbp)

    # if(ae > be)
    movl    -28(%rbp), %eax
    cmpl    -24(%rbp), %eax
    jle     .L_if4_else

    # return gt;
    movl    -32(%rbp), %eax
    jmp     .L_end

.L_if4_else:
    # if(ae < be)
    movl    -28(%rbp), %eax
    cmpl    -24(%rbp), %eax
    jge     .L_if5_else

    # return -gt;
    movl    -32(%rbp), %eax
    negl    %eax
    jmp     .L_end

.L_if5_else:
    # af = 0x00800000 | (a & 0x007fffff);
    movq    -64(%rbp), %rax
    andl    $0x007fffff, %eax
    orl     $0x00800000, %eax
    movl    %eax, -20(%rbp)

    # bf = 0x00800000 | (b & 0x007fffff);
    movq    -56(%rbp), %rax
    andl    $0x007fffff, %eax
    orl     $0x00800000, %eax
    movl    %eax, -16(%rbp)

    # if(af > bf)
    movl    -20(%rbp), %eax
    cmpl    -16(%rbp), %eax
    jbe     .L_if6_else  # Use unsigned comparison (jbe instead of jle)

    # return gt;
    movl    -32(%rbp), %eax
    jmp     .L_end

.L_if6_else:
    # return -gt;
    movl    -32(%rbp), %eax
    negl    %eax

.L_end:
    # Epilogue
    leave
    ret
