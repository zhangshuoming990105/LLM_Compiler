    .text
# Struct definitions:
# list_data_s {
#     short data16;  // offset 0, size 2
#     short idx;     // offset 2, size 2
# }; // total size 4, aligned to 2 bytes

# list_head_s {
#     struct list_head_s *next; // offset 0, size 8
#     struct list_data_s *info; // offset 8, size 8
# }; // total size 16, aligned to 8 bytes

# MAT_PARAMS_S {
#     int N;       // offset 0, size 4
#     short *A;    // offset 8, size 8
#     short *B;    // offset 16, size 8
#     int *C;      // offset 24, size 8
# }; // total size 32, aligned to 8 bytes

# CORE_PORTABLE_S {
#     u8 portable_id; // offset 0, size 1
# }; // total size 1, aligned to 1 byte

# RESULTS_S {
#     short seed1;              // offset 0, size 2
#     short seed2;              // offset 2, size 2
#     short seed3;              // offset 4, size 2
#     void *memblock[4];        // offset 8, size 32
#     unsigned size;            // offset 40, size 4
#     unsigned iterations;      // offset 44, size 4
#     unsigned execs;           // offset 48, size 4
#     struct list_head_s *list; // offset 56, size 8
#     mat_params mat;           // offset 64, size 32
#     u16 crc;                  // offset 96, size 2
#     u16 crclist;              // offset 98, size 2
#     u16 crcmatrix;            // offset 100, size 2
#     u16 crcstate;             // offset 102, size 2
#     short err;                // offset 104, size 2
#     core_portable port;       // offset 106, size 1
# }; // total size 112, aligned to 8 bytes

    .globl  core_bench_list
    .type   core_bench_list, @function
core_bench_list:
.LFB0:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $64, %rsp
    movq    %rdi, -56(%rbp)        # Save res pointer
    movw    %si, -58(%rbp)         # Save finder_idx

    # Initialize local variables
    movw    $0, -2(%rbp)           # retval = 0
    movw    $0, -4(%rbp)           # found = 0
    movw    $0, -6(%rbp)           # missed = 0
    movq    -56(%rbp), %rax
    movq    56(%rax), %rax
    movq    %rax, -16(%rbp)        # list = res->list
    movq    -56(%rbp), %rax
    movzwl  4(%rax), %eax
    movw    %ax, -18(%rbp)         # find_num = res->seed3
    movq    $0, -32(%rbp)          # Initialize info
    movw    -58(%rbp), %ax
    movw    %ax, -30(%rbp)         # info.idx = finder_idx
    movw    $0, -20(%rbp)          # i = 0

.L2:    # Start of for loop
    movzwl  -20(%rbp), %eax
    cmpw    -18(%rbp), %ax
    jge     .L3                    # Jump if i >= find_num

    movzwl  -20(%rbp), %eax
    andl    $255, %eax
    movw    %ax, -32(%rbp)         # info.data16 = (i & 0xff)

    # Call core_list_find
    leaq    -32(%rbp), %rdx
    movq    -16(%rbp), %rax
    movq    %rdx, %rsi
    movq    %rax, %rdi
    call    core_list_find@PLT
    movq    %rax, -40(%rbp)        # this_find = core_list_find(list, &info)

    # Call core_list_reverse
    movq    -16(%rbp), %rax
    movq    %rax, %rdi
    call    core_list_reverse@PLT
    movq    %rax, -16(%rbp)        # list = core_list_reverse(list)

    cmpq    $0, -40(%rbp)
    jne     .L4                    # Jump if this_find != NULL

    # Missed case
    addw    $1, -6(%rbp)           # missed++
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    shrw    $8, %ax
    andl    $1, %eax
    movzwl  %ax, %eax
    movzwl  -2(%rbp), %edx
    addl    %edx, %eax
    movw    %ax, -2(%rbp)          # retval += (list->next->info->data16 >> 8) & 1
    jmp     .L5

.L4:    # Found case
    addw    $1, -4(%rbp)           # found++
    movq    -40(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    andl    $1, %eax
    testl   %eax, %eax
    je      .L6
    movq    -40(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    shrw    $9, %ax
    andl    $1, %eax
    movzwl  %ax, %eax
    movzwl  -2(%rbp), %edx
    addl    %edx, %eax
    movw    %ax, -2(%rbp)          # retval += (this_find->info->data16 >> 9) & 1

.L6:
    movq    -40(%rbp), %rax
    movq    (%rax), %rax
    testq   %rax, %rax
    je      .L5
    movq    -40(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -48(%rbp)        # finder = this_find->next
    movq    -40(%rbp), %rax
    movq    -48(%rbp), %rdx
    movq    (%rdx), %rdx
    movq    %rdx, (%rax)           # this_find->next = finder->next
    movq    -16(%rbp), %rax
    movq    (%rax), %rdx
    movq    -48(%rbp), %rax
    movq    %rdx, (%rax)           # finder->next = list->next
    movq    -16(%rbp), %rax
    movq    -48(%rbp), %rdx
    movq    %rdx, (%rax)           # list->next = finder

.L5:
    movzwl  -30(%rbp), %eax
    cwtl
    testl   %eax, %eax
    js      .L7
    addw    $1, -30(%rbp)          # info.idx++

.L7:
    addw    $1, -20(%rbp)          # i++
    jmp     .L2

.L3:    # End of for loop
    movzwl  -4(%rbp), %eax
    sall    $2, %eax
    movzwl  -6(%rbp), %edx
    subl    %edx, %eax
    movzwl  -2(%rbp), %edx
    addl    %edx, %eax
    movw    %ax, -2(%rbp)          # retval += found * 4 - missed

    cmpw    $0, -58(%rbp)
    jle     .L8
    # Call core_list_mergesort
    movq    -56(%rbp), %rdx
    leaq    cmp_complex(%rip), %rsi
    movq    -16(%rbp), %rax
    movq    %rdx, %rcx
    movq    %rax, %rdi
    call    core_list_mergesort@PLT
    movq    %rax, -16(%rbp)        # list = core_list_mergesort(list, cmp_complex, res)

.L8:
    # Call core_list_remove
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, %rdi
    call    core_list_remove@PLT
    movq    %rax, -48(%rbp)        # remover = core_list_remove(list->next)

    # Call core_list_find
    leaq    -32(%rbp), %rdx
    movq    -16(%rbp), %rax
    movq    %rdx, %rsi
    movq    %rax, %rdi
    call    core_list_find@PLT
    movq    %rax, -40(%rbp)        # finder = core_list_find(list, &info)

    cmpq    $0, -40(%rbp)
    jne     .L9
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -40(%rbp)        # finder = list->next

.L9:
    jmp     .L10

.L11:
    movq    -16(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    movzwl  -2(%rbp), %edx
    movzwl  %ax, %eax
    movl    %edx, %esi
    movl    %eax, %edi
    call    crc16@PLT
    movw    %ax, -2(%rbp)          # retval = crc16(list->info->data16, retval)
    movq    -40(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -40(%rbp)        # finder = finder->next

.L10:
    cmpq    $0, -40(%rbp)
    jne     .L11

    # Call core_list_undo_remove
    movq    -16(%rbp), %rax
    movq    (%rax), %rdx
    movq    -48(%rbp), %rax
    movq    %rdx, %rsi
    movq    %rax, %rdi
    call    core_list_undo_remove@PLT
    movq    %rax, -48(%rbp)        # remover = core_list_undo_remove(remover, list->next)

    # Call core_list_mergesort
    movl    $0, %edx
    leaq    cmp_idx(%rip), %rsi
    movq    -16(%rbp), %rax
    movq    %rdx, %rcx
    movq    %rax, %rdi
    call    core_list_mergesort@PLT
    movq    %rax, -16(%rbp)        # list = core_list_mergesort(list, cmp_idx, NULL)

    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -40(%rbp)        # finder = list->next
    jmp     .L12

.L13:
    movq    -16(%rbp), %rax
    movq    8(%rax), %rax
    movzwl  (%rax), %eax
    movzwl  -2(%rbp), %edx
    movzwl  %ax, %eax
    movl    %edx, %esi
    movl    %eax, %edi
    call    crc16@PLT
    movw    %ax, -2(%rbp)          # retval = crc16(list->info->data16, retval)
    movq    -40(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -40(%rbp)        # finder = finder->next

.L12:
    cmpq    $0, -40(%rbp)
    jne     .L13

    movzwl  -2(%rbp), %eax         # Return retval
    leave
    ret
