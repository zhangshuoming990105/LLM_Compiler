    .text
    .globl  core_list_mergesort
    .type   core_list_mergesort, @function
core_list_mergesort:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $64, %rsp
    movq    %rdi, -8(%rbp)     # list
    movq    %rsi, -16(%rbp)    # cmp
    movq    %rdx, -24(%rbp)    # res
    movl    $1, -28(%rbp)      # insize = 1
.L_while:
    movq    -8(%rbp), %rax
    movq    %rax, -36(%rbp)    # p = list
    movq    $0, -8(%rbp)       # list = NULL
    movq    $0, -44(%rbp)      # tail = NULL
    movl    $0, -48(%rbp)      # nmerges = 0
.L_while_p:
    cmpq    $0, -36(%rbp)
    je      .L_end_while_p
    addl    $1, -48(%rbp)      # nmerges++
    movq    -36(%rbp), %rax
    movq    %rax, -52(%rbp)    # q = p
    movl    $0, -56(%rbp)      # psize = 0
    movl    $0, -60(%rbp)      # i = 0
.L_for:
    movl    -60(%rbp), %eax
    cmpl    -28(%rbp), %eax
    jge     .L_end_for
    addl    $1, -56(%rbp)      # psize++
    movq    -52(%rbp), %rax
    movq    (%rax), %rax       # q->next
    movq    %rax, -52(%rbp)    # q = q->next
    cmpq    $0, %rax
    je      .L_end_for
    addl    $1, -60(%rbp)      # i++
    jmp     .L_for
.L_end_for:
    movl    -28(%rbp), %eax
    movl    %eax, -64(%rbp)    # qsize = insize
.L_while_merge:
    movl    -56(%rbp), %eax
    cmpl    $0, %eax
    jle     .L_check_q
    cmpl    $0, -64(%rbp)
    jle     .L_p_case
    cmpq    $0, -52(%rbp)
    je      .L_p_case
    movq    -36(%rbp), %rax
    movq    8(%rax), %rdi      # p->info
    movq    -52(%rbp), %rax
    movq    8(%rax), %rsi      # q->info
    movq    -24(%rbp), %rdx    # res
    call    *-16(%rbp)         # call cmp
    cmpl    $0, %eax
    jg      .L_q_case
    jmp     .L_p_case
.L_check_q:
    cmpl    $0, -64(%rbp)
    jle     .L_end_while_merge
    cmpq    $0, -52(%rbp)
    je      .L_end_while_merge
.L_q_case:
    movq    -52(%rbp), %rax
    movq    %rax, -72(%rbp)    # e = q
    movq    (%rax), %rax
    movq    %rax, -52(%rbp)    # q = q->next
    subl    $1, -64(%rbp)      # qsize--
    jmp     .L_merge_end
.L_p_case:
    movq    -36(%rbp), %rax
    movq    %rax, -72(%rbp)    # e = p
    movq    (%rax), %rax
    movq    %rax, -36(%rbp)    # p = p->next
    subl    $1, -56(%rbp)      # psize--
.L_merge_end:
    cmpq    $0, -44(%rbp)
    je      .L_set_list
    movq    -44(%rbp), %rax
    movq    -72(%rbp), %rdx
    movq    %rdx, (%rax)       # tail->next = e
    jmp     .L_set_tail
.L_set_list:
    movq    -72(%rbp), %rax
    movq    %rax, -8(%rbp)     # list = e
.L_set_tail:
    movq    -72(%rbp), %rax
    movq    %rax, -44(%rbp)    # tail = e
    jmp     .L_while_merge
.L_end_while_merge:
    movq    -52(%rbp), %rax
    movq    %rax, -36(%rbp)    # p = q
    jmp     .L_while_p
.L_end_while_p:
    movq    -44(%rbp), %rax
    movq    $0, (%rax)         # tail->next = NULL
    cmpl    $1, -48(%rbp)
    jle     .L_return
    sall    -28(%rbp)          # insize *= 2
    jmp     .L_while
.L_return:
    movq    -8(%rbp), %rax     # return list
    leave
    ret