
    .text
    .globl  findLongest1s
    .type   findLongest1s, @function
findLongest1s:
.LF_findLongest1s_entry:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp
    movl    %edi, -24(%rbp)  # Store x

    # Initialize variables
    movl    $0, -4(%rbp)     # k = 0
    movl    $0, -8(%rbp)     # longest = 0
    movl    $0, -12(%rbp)    # l1 = 0
    movl    $0, -16(%rbp)    # l2 = 0
    movl    $32, -20(%rbp)   # size = 8 * sizeof(int)

    # for(k=0; k < size; k++)
.L_for_loop:
    movl    -4(%rbp), %eax
    cmpl    -20(%rbp), %eax
    jge     .L_for_end

    # while (x >> k & 0x1)
.L_while_loop:
    movl    -24(%rbp), %eax
    movl    -4(%rbp), %ecx
    sarl    %cl, %eax
    andl    $1, %eax
    testl   %eax, %eax
    je      .L_while_end

    # l1++
    addl    $1, -12(%rbp)
    # k++
    addl    $1, -4(%rbp)
    jmp     .L_while_loop

.L_while_end:
    # if ((l1 + l2) > longest)
    movl    -12(%rbp), %eax
    addl    -16(%rbp), %eax
    cmpl    -8(%rbp), %eax
    jle     .L_if_end

    # longest = l1 + l2
    movl    -12(%rbp), %eax
    addl    -16(%rbp), %eax
    movl    %eax, -8(%rbp)

.L_if_end:
    # l2 = l1
    movl    -12(%rbp), %eax
    movl    %eax, -16(%rbp)
    # l1 = 0
    movl    $0, -12(%rbp)

    # if (((x >> k & 0x1) == 0x0) && (x >> (k+1) & 0x1 == 0x0))
    movl    -24(%rbp), %eax
    movl    -4(%rbp), %ecx
    sarl    %cl, %eax
    andl    $1, %eax
    testl   %eax, %eax
    jne     .L_else_if

    movl    -24(%rbp), %eax
    movl    -4(%rbp), %ecx
    leal    1(%rcx), %ecx
    sarl    %cl, %eax
    andl    $1, %eax
    testl   %eax, %eax
    jne     .L_else_if

    # l2 = 0
    movl    $0, -16(%rbp)
    # k++
    addl    $1, -4(%rbp)
    jmp     .L_for_loop

.L_else_if:
    # if (l2)
    cmpl    $0, -16(%rbp)
    je      .L_for_loop

    # l1++
    addl    $1, -12(%rbp)
    jmp     .L_for_loop

.L_for_end:
    # return longest
    movl    -8(%rbp), %eax

    # Epilogue
    leave
    ret
