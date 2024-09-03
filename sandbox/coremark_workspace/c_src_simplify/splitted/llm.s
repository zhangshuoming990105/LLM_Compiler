    .text
    .globl    core_bench_list
    .type   core_bench_list, @function
core_bench_list:
.LFB0:
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $80, %rsp
    movq    %rdi, -72(%rbp)  # Store res (first argument) on stack
    movl    %esi, %eax
    movw    %ax, -76(%rbp)   # Store finder_idx (second argument) on stack

    # Initialize local variables
    movw    $0, -2(%rbp)     # retval = 0
    movw    $0, -4(%rbp)     # found = 0
    movw    $0, -6(%rbp)     # missed = 0

    # list = res->list
    movq    -72(%rbp), %rax
    movq    56(%rax), %rax
    movq    %rax, -16(%rbp)

    # find_num = res->seed3
    movq    -72(%rbp), %rax
    movzwl  4(%rax), %eax
    movw    %ax, -28(%rbp)

    # Initialize info struct
    movl    $0, -52(%rbp)    # info.data16 = 0
    movzwl  -76(%rbp), %eax
    movw    %ax, -50(%rbp)   # info.idx = finder_idx

    # Start of for loop
    movw    $0, -26(%rbp)    # i = 0
    jmp     .L2

.L7:  # Loop body
    # info.data16 = (i & 0xff)
    movzwl  -26(%rbp), %eax
    movzbl  %al, %eax
    movw    %ax, -52(%rbp)

    # this_find = core_list_find(list, &info)
    leaq    -52(%rbp), %rdx
    movq    -16(%rbp), %rax
    movq    %rdx, %rsi
    movq    %rax, %rdi
    call    core_list_find@PLT
    movq    %rax, -48(%rbp)

    # list = core_list_reverse(list)
    movq    -16(%rbp), %rax
    movq    %rax, %rdi
    call    core_list_reverse@PLT
    movq    %rax, -16(%rbp)

    # if (this_find == NULL)
    cmpq    $0, -48(%rbp)
    jne     .L3

    # missed++
    movzwl  -6(%rbp), %eax
    addl    $1, %eax
    movw    %ax, -6(%rbp)

    # retval += (list->next->info->data16 >> 8) & 1
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    sarw    $8, %ax
    andl    $1, %eax
    addw    %ax, -2(%rbp)
    jmp     .L4

.L3:  # else branch
    # found++
    movzwl  -4(%rbp), %eax
    addl    $1, %eax
    movw    %ax, -4(%rbp)

    # if (this_find->info->data16 & 0x1)
    movq    -48(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    cwtl
    andl    $1, %eax
    testl   %eax, %eax
    je      .L5

    # retval += (this_find->info->data16 >> 9) & 1
    movq    -48(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    sarw    $9, %ax
    andl    $1, %eax
    addw    %ax, -2(%rbp)

.L5:
    # if (this_find->next != NULL)
    movq    -48(%rbp), %rax
    movq    (%rax), %rax
    testq   %rax, %rax
    je      .L4

    # Rearrange list (finder = this_find->next; ...)
    movq    -48(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -24(%rbp)
    movq    -24(%rbp), %rax
    movq    (%rax), %rdx
    movq    -48(%rbp), %rax
    movq    %rdx, (%rax)
    movq    -16(%rbp), %rax
    movq    (%rax), %rdx
    movq    -24(%rbp), %rax
    movq    %rdx, (%rax)
    movq    -16(%rbp), %rax
    movq    -24(%rbp), %rdx
    movq    %rdx, (%rax)

.L4:
    # if (info.idx >= 0) info.idx++
    movzwl  -50(%rbp), %eax
    testw   %ax, %ax
    js      .L6
    movzwl  -50(%rbp), %eax
    addl    $1, %eax
    movw    %ax, -50(%rbp)

.L6:
    # i++
    movzwl  -26(%rbp), %eax
    addl    $1, %eax
    movw    %ax, -26(%rbp)

.L2:  # Loop condition
    movzwl  -26(%rbp), %eax
    cmpw    -28(%rbp), %ax
    jl      .L7

    # retval += found * 4 - missed
    movzwl  -4(%rbp), %eax
    sall    $2, %eax
    subw    -6(%rbp), %ax
    addw    %ax, -2(%rbp)

    # if (finder_idx > 0)
    cmpw    $0, -76(%rbp)
    jle     .L8

    # list = core_list_mergesort(list, cmp_complex, res)
    movq    -72(%rbp), %rdx
    movq    -16(%rbp), %rax
    movq    cmp_complex@GOTPCREL(%rip), %rcx
    movq    %rcx, %rsi
    movq    %rax, %rdi
    call    core_list_mergesort@PLT
    movq    %rax, -16(%rbp)

.L8:
    # remover = core_list_remove(list->next)
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, %rdi
    call    core_list_remove@PLT
    movq    %rax, -40(%rbp)

    # finder = core_list_find(list, &info)
    leaq    -52(%rbp), %rdx
    movq    -16(%rbp), %rax
    movq    %rdx, %rsi
    movq    %rax, %rdi
    call    core_list_find@PLT
    movq    %rax, -24(%rbp)

    # if (!finder) finder = list->next
    cmpq    $0, -24(%rbp)
    jne     .L10
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -24(%rbp)
    jmp     .L10

.L11:  # while (finder) loop
    # retval = crc16(list->info->data16, retval)
    movzwl  -2(%rbp), %edx
    movq    -16(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    cwtl
    movl    %edx, %esi
    movl    %eax, %edi
    call    crc16@PLT
    movw    %ax, -2(%rbp)

    # finder = finder->next
    movq    -24(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -24(%rbp)

.L10:
    cmpq    $0, -24(%rbp)
    jne     .L11

    # remover = core_list_undo_remove(remover, list->next)
    movq    -16(%rbp), %rax
    movq    (%rax), %rdx
    movq    -40(%rbp), %rax
    movq    %rdx, %rsi
    movq    %rax, %rdi
    call    core_list_undo_remove@PLT
    movq    %rax, -40(%rbp)

    # list = core_list_mergesort(list, cmp_idx, NULL)
    movq    -16(%rbp), %rax
    movl    $0, %edx
    movq    cmp_idx@GOTPCREL(%rip), %rcx
    movq    %rcx, %rsi
    movq    %rax, %rdi
    call    core_list_mergesort@PLT
    movq    %rax, -16(%rbp)

    # finder = list->next
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -24(%rbp)
    jmp     .L12

.L13:  # while (finder) loop
    # retval = crc16(list->info->data16, retval)
    movzwl  -2(%rbp), %edx
    movq    -16(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    cwtl
    movl    %edx, %esi
    movl    %eax, %edi
    call    crc16@PLT
    movw    %ax, -2(%rbp)

    # finder = finder->next
    movq    -24(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -24(%rbp)

.L12:
    cmpq    $0, -24(%rbp)
    jne     .L13

    # return retval
    movzwl  -2(%rbp), %eax
    leave
    ret