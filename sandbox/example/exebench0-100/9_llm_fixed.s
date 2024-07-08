   .text
    .globl  JKMarray_idx
JKMarray_idx:
    pushq   %rbp
    movq    %rsp, %rbp
    movl    %edi, -4(%rbp)      # J
    movl    %esi, -8(%rbp)      # K
    movl    %edx, -12(%rbp)     # M

    movl    -4(%rbp), %eax      # Load J into %eax
    imull   $4, %eax, %eax      # 4 * J
    imull   -4(%rbp), %eax      # 4 * J * J
    addl    $5, %eax            # 4 * J * J + 5
    imull   -4(%rbp), %eax      # (4 * J * J + 5) * J
    movl    $3, %ecx            # Move 3 into %ecx
    cltd                        # Sign extend %eax to %edx:%eax
    idivl    %ecx               # ((4 * J * J + 5) * J) / 3

    movl    -4(%rbp), %ecx      # Load J into %ecx
    imull   %ecx, %ecx          # J * J
    leal    (%ecx,%ecx,1), %ecx # 2 * J * J
    addl    %ecx, %eax          # ((4 * J * J + 5) * J) / 3 + 2 * J * J

    movl    -8(%rbp), %ecx      # Load K into %ecx
    movl    -4(%rbp), %edx      # Load J into %edx
    leal    (,%edx,2), %edx     # 2 * J
    addl    $1, %edx            # 2 * J + 1
    imull   %ecx, %edx          # K * (2 * J + 1)
    addl    %edx, %eax          # ((4 * J * J + 5) * J) / 3 + 2 * J * J + K * (2 * J + 1)

    addl    -12(%rbp), %eax     # + M

    popq    %rbp
    retq