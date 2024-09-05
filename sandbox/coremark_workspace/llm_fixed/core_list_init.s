    .text
# Struct definitions:
# list_data_s {
#     short data16;  // offset 0, size 2
#     short idx;     // offset 2, size 2
# }; // total size 4, aligned to 2 bytes

# list_head_s {
#     struct list_head_s *next;  // offset 0, size 8
#     struct list_data_s *info;  // offset 8, size 8
# }; // total size 16, aligned to 8 bytes

# MAT_PARAMS_S {
#     int N;     // offset 0, size 4
#     short *A;  // offset 8, size 8
#     short *B;  // offset 16, size 8
#     int *C;    // offset 24, size 8
# }; // total size 32, aligned to 8 bytes

# CORE_PORTABLE_S {
#     u8 portable_id;  // offset 0, size 1
# }; // total size 1, aligned to 1 byte

# RESULTS_S {
#     short seed1;             // offset 0, size 2
#     short seed2;             // offset 2, size 2
#     short seed3;             // offset 4, size 2
#     void *memblock[4];       // offset 8, size 32
#     unsigned size;           // offset 40, size 4
#     unsigned iterations;     // offset 44, size 4
#     unsigned execs;          // offset 48, size 4
#     struct list_head_s *list;// offset 56, size 8
#     mat_params mat;          // offset 64, size 32
#     u16 crc;                 // offset 96, size 2
#     u16 crclist;             // offset 98, size 2
#     u16 crcmatrix;           // offset 100, size 2
#     u16 crcstate;            // offset 102, size 2
#     short err;               // offset 104, size 2
#     core_portable port;      // offset 106, size 1
# }; // total size 112, aligned to 8 bytes

    .globl  core_list_init
    .type   core_list_init, @function
core_list_init:
.LFB0:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $64, %rsp
    movl    %edi, -52(%rbp)        # blksize
    movq    %rsi, -64(%rbp)        # memblock
    movw    %dx, -56(%rbp)         # seed

    # unsigned per_item = 16 + sizeof(struct list_data_s);
    movl    $20, -4(%rbp)          # per_item = 20

    # unsigned size = (blksize / per_item) - 2;
    movl    -52(%rbp), %eax
    movl    $0, %edx
    divl    -4(%rbp)
    subl    $2, %eax
    movl    %eax, -8(%rbp)         # size

    # list_head *memblock_end = memblock + size;
    movl    -8(%rbp), %eax         # Load size into eax
    leal    (%eax,%eax), %eax      # eax = size * 2
    movslq  %eax, %rdx             # Sign-extend eax to 64-bit in rdx
    movq    -64(%rbp), %rax        # Load memblock into rax
    leaq    (%rax,%rdx,8), %rax    # rax = memblock + size * 16 (as 2 * 8)
    movq    %rax, -16(%rbp)        # Store result in memblock_end

    # list_data *datablock = (list_data *)(memblock_end);
    movq    -16(%rbp), %rax
    movq    %rax, -24(%rbp)        # datablock

    # list_data *datablock_end = datablock + size;
    movl    -8(%rbp), %eax
    movslq  %eax, %rdx
    movq    -24(%rbp), %rax
    leaq    (%rax,%rdx,4), %rax
    movq    %rax, -32(%rbp)        # datablock_end

    # list_head *list = memblock;
    movq    -64(%rbp), %rax
    movq    %rax, -40(%rbp)        # list

    # list->next = NULL;
    movq    -40(%rbp), %rax
    movq    $0, (%rax)

    # list->info = datablock;
    movq    -40(%rbp), %rax
    movq    -24(%rbp), %rdx
    movq    %rdx, 8(%rax)

    # list->info->idx = 0x0000;
    movq    -40(%rbp), %rax
    movq    8(%rax), %rax
    movw    $0, 2(%rax)

    # list->info->data16 = (short)0x8080;
    movq    -40(%rbp), %rax
    movq    8(%rax), %rax
    movw    $-32640, (%rax)

    # memblock++;
    addq    $16, -64(%rbp)

    # datablock++;
    addq    $4, -24(%rbp)

    # info.idx = 0x7fff;
    movw    $32767, -44(%rbp)

    # info.data16 = (short)0xffff;
    movw    $-1, -46(%rbp)

    # core_list_insert_new(list, &info, &memblock, &datablock, memblock_end, datablock_end);
    movq    -32(%rbp), %r9
    movq    -16(%rbp), %r8
    leaq    -24(%rbp), %rcx
    leaq    -64(%rbp), %rdx
    leaq    -46(%rbp), %rsi
    movq    -40(%rbp), %rax
    movq    %rax, %rdi
    call    core_list_insert_new@PLT

    # for loop
    movl    $0, -48(%rbp)
.L3:
    movl    -48(%rbp), %eax
    cmpl    -8(%rbp), %eax
    jge     .L2
    # Loop body
    movzwl  -56(%rbp), %eax
    movl    -48(%rbp), %edx
    xorl    %edx, %eax
    andl    $15, %eax
    movw    %ax, -50(%rbp)         # datpat

    movzwl  -50(%rbp), %eax
    sall    $3, %eax
    movl    %eax, %edx
    movl    -48(%rbp), %eax
    andl    $7, %eax
    orl     %edx, %eax
    movw    %ax, -50(%rbp)         # dat

    movzwl  -50(%rbp), %eax
    sall    $8, %eax
    movl    %eax, %edx
    movzwl  -50(%rbp), %eax
    orl     %edx, %eax
    movw    %ax, -46(%rbp)         # info.data16

    # core_list_insert_new call
    movq    -32(%rbp), %r9
    movq    -16(%rbp), %r8
    leaq    -24(%rbp), %rcx
    leaq    -64(%rbp), %rdx
    leaq    -46(%rbp), %rsi
    movq    -40(%rbp), %rax
    movq    %rax, %rdi
    call    core_list_insert_new@PLT

    addl    $1, -48(%rbp)
    jmp     .L3
.L2:
    # finder = list->next;
    movq    -40(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -16(%rbp)        # finder

    movl    $1, -48(%rbp)          # i = 1
.L7:
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    testq   %rax, %rax
    je      .L8
    movl    -8(%rbp), %eax
    movl    %eax, %edx
    shrl    $31, %edx
    addl    %edx, %eax
    sarl    %eax
    movl    %eax, %edx
    shrl    $31, %edx
    addl    %edx, %eax
    sarl    %eax
    cmpl    %eax, -48(%rbp)
    jge     .L5
    movq    -16(%rbp), %rax
    movq    8(%rax), %rax
    movl    -48(%rbp), %edx
    movw    %dx, 2(%rax)
    addl    $1, -48(%rbp)
    jmp     .L6
.L5:
    movl    -48(%rbp), %eax
    movzwl  -56(%rbp), %edx
    xorl    %edx, %eax
    movw    %ax, -50(%rbp)         # pat
    movl    -48(%rbp), %eax
    andl    $7, %eax
    sall    $8, %eax
    movzwl  %ax, %edx
    movzwl  -50(%rbp), %eax
    orl     %edx, %eax
    andl    $16383, %eax
    movl    %eax, %edx
    movq    -16(%rbp), %rax
    movq    8(%rax), %rax
    movw    %dx, 2(%rax)
    addl    $1, -48(%rbp)
.L6:
    movq    -16(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -16(%rbp)
    jmp     .L7
.L8:
    # list = core_list_mergesort(list, cmp_idx, NULL);
    movl    $0, %edx
    movq    cmp_idx@GOTPCREL(%rip), %rsi
    movq    -40(%rbp), %rax
    movq    %rax, %rdi
    call    core_list_mergesort@PLT
    movq    %rax, -40(%rbp)

    # return list;
    movq    -40(%rbp), %rax
    leave
    ret
.LFE0:
    .size   core_list_init, .-core_list_init