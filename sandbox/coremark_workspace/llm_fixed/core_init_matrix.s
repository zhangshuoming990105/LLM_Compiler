    .text
    .globl  core_init_matrix
    .type   core_init_matrix, @function
core_init_matrix:
.LFB0:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx
    subq    $56, %rsp
    movl    %edi, -36(%rbp)        # blksize
    movq    %rsi, -48(%rbp)        # memblk
    movl    %edx, -40(%rbp)        # seed
    movq    %rcx, -56(%rbp)        # p

    movl    $0, -20(%rbp)          # N = 0
    movl    $1, -24(%rbp)          # order = 1
    movl    $0, -28(%rbp)          # i = 0
    movl    $0, -32(%rbp)          # j = 0

    cmpl    $0, -40(%rbp)
    jne     .L2
    movl    $1, -40(%rbp)          # if (seed == 0) seed = 1;
.L2:
    jmp     .L3
.L4:
    addl    $1, -28(%rbp)          # i++
    movl    -28(%rbp), %eax
    imull   %eax, %eax
    sall    $3, %eax               # i * i * 2 * 4
    movl    %eax, -32(%rbp)        # j = i * i * 2 * 4
.L3:
    movl    -32(%rbp), %eax
    cmpl    -36(%rbp), %eax
    jb      .L4                    # while (j < blksize)

    movl    -28(%rbp), %eax
    subl    $1, %eax
    movl    %eax, -20(%rbp)        # N = i - 1

    movq    -48(%rbp), %rax
    addq    $3, %rax
    andq    $-4, %rax
    addq    $4, %rax               # align_mem(memblk)
    movq    %rax, -16(%rbp)        # A = (short *)align_mem(memblk)

    movl    -20(%rbp), %eax
    movslq  %eax, %rdx
    movl    -20(%rbp), %eax
    cltq
    imulq   %rdx, %rax
    leaq    0(,%rax,2), %rdx
    movq    -16(%rbp), %rax
    addq    %rdx, %rax
    movq    %rax, -8(%rbp)         # B = A + N * N

    movl    $0, -28(%rbp)          # i = 0
    jmp     .L5
.L8:
    movl    $0, -32(%rbp)          # j = 0
    jmp     .L6
.L7:
    movl    -24(%rbp), %eax
    imull   -40(%rbp), %eax
    movl    $65536, %ecx
    cltd
    idivl   %ecx
    movl    %edx, -40(%rbp)        # seed = ((order * seed) % 65536)

    movl    -40(%rbp), %edx
    movl    -24(%rbp), %eax
    addl    %edx, %eax
    movw    %ax, -34(%rbp)         # val = (seed + order)

    movzwl  -34(%rbp), %eax
    andl    $65535, %eax           # matrix_clip(val, 0)
    movw    %ax, -34(%rbp)

    movl    -20(%rbp), %eax
    imull   -28(%rbp), %eax
    movl    %eax, %edx
    movl    -32(%rbp), %eax
    addl    %edx, %eax
    cltq
    leaq    0(,%rax,2), %rdx
    movq    -8(%rbp), %rax
    addq    %rdx, %rax
    movzwl  -34(%rbp), %edx
    movw    %dx, (%rax)            # B[i * N + j] = val

    movzwl  -34(%rbp), %eax
    movl    -24(%rbp), %edx
    addl    %edx, %eax
    movw    %ax, -34(%rbp)         # val = (val + order)

    movzwl  -34(%rbp), %eax
    andl    $255, %eax             # matrix_clip(val, 1)
    movw    %ax, -34(%rbp)

    movl    -20(%rbp), %eax
    imull   -28(%rbp), %eax
    movl    %eax, %edx
    movl    -32(%rbp), %eax
    addl    %edx, %eax
    cltq
    leaq    0(,%rax,2), %rdx
    movq    -16(%rbp), %rax
    addq    %rdx, %rax
    movzwl  -34(%rbp), %edx
    movw    %dx, (%rax)            # A[i * N + j] = val

    addl    $1, -24(%rbp)          # order++
    addl    $1, -32(%rbp)          # j++
.L6:
    movl    -32(%rbp), %eax
    cmpl    -20(%rbp), %eax
    jl      .L7                    # for (j < N)
    addl    $1, -28(%rbp)          # i++
.L5:
    movl    -28(%rbp), %eax
    cmpl    -20(%rbp), %eax
    jl      .L8                    # for (i < N)

    movq    -56(%rbp), %rax
    movq    -16(%rbp), %rdx
    movq    %rdx, 8(%rax)          # p->A = A

    movq    -56(%rbp), %rax
    movq    -8(%rbp), %rdx
    movq    %rdx, 16(%rax)         # p->B = B

    movl    -20(%rbp), %eax
    movslq  %eax, %rdx
    movl    -20(%rbp), %eax
    cltq
    imulq   %rdx, %rax
    leaq    0(,%rax,2), %rdx
    movq    -8(%rbp), %rax
    addq    %rdx, %rax
    addq    $3, %rax
    andq    $-4, %rax
    addq    $4, %rax               # align_mem(B + N * N)
    movq    -56(%rbp), %rdx
    movq    %rax, 24(%rdx)         # p->C = (int *)align_mem(B + N * N)

    movq    -56(%rbp), %rax
    movl    -20(%rbp), %edx
    movl    %edx, (%rax)           # p->N = N

    movl    -20(%rbp), %eax        # return N

    addq    $56, %rsp
    popq    %rbx
    popq    %rbp
    ret
.LFE0:
    .size   core_init_matrix, .-core_init_matrix