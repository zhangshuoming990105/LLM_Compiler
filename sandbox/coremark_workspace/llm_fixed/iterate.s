    .text
    .globl    iterate
    .type    iterate, @function
iterate:
.LFB0:
    endbr64
    pushq    %rbp
    movq    %rsp, %rbp
    subq    $48, %rsp

    movq    %rdi, -8(%rbp)      # Store first argument (pres) at -8(%rbp)

    # Load res->iterations into eax, then store in -12(%rbp)
    movq    -8(%rbp), %rax
    movl    44(%rax), %eax      # Correct offset for iterations (44)
    movl    %eax, -12(%rbp)

    # Initialize res->crc, res->crclist, res->crcmatrix, res->crcstate to 0
    movq    -8(%rbp), %rax
    movw    $0, 96(%rax)        # res->crc = 0
    movw    $0, 98(%rax)        # res->crclist = 0
    movw    $0, 100(%rax)       # res->crcmatrix = 0
    movw    $0, 102(%rax)       # res->crcstate = 0

    movl    $0, -16(%rbp)       # Initialize i = 0
    jmp    .L2

.L3:    # Loop body
    # Call core_bench_list(res, 1)
    movq    -8(%rbp), %rax
    movl    $1, %esi
    movq    %rax, %rdi
    call    core_bench_list@PLT
    movw    %ax, -18(%rbp)      # Store return value (crc) in -18(%rbp)

    # Call crcu16(crc, res->crc)
    movq    -8(%rbp), %rax
    movzwl    96(%rax), %esi    # Load res->crc into esi
    movzwl    -18(%rbp), %edi   # Load crc into edi
    call    crcu16@PLT
    movq    -8(%rbp), %rdx
    movw    %ax, 96(%rdx)       # Store result back in res->crc

    # Call core_bench_list(res, -1)
    movq    -8(%rbp), %rax
    movl    $-1, %esi
    movq    %rax, %rdi
    call    core_bench_list@PLT
    movw    %ax, -20(%rbp)      # Store return value (crc) in -20(%rbp)

    # Call crcu16(crc, res->crc)
    movq    -8(%rbp), %rax
    movzwl    96(%rax), %esi    # Load res->crc into esi
    movzwl    -20(%rbp), %edi   # Load crc into edi
    call    crcu16@PLT
    movq    -8(%rbp), %rdx
    movw    %ax, 96(%rdx)       # Store result back in res->crc

    cmpl    $0, -16(%rbp)       # Compare i with 0
    jne    .L4
    movq    -8(%rbp), %rax
    movzwl    96(%rax), %eax    # Load res->crc into eax
    movq    -8(%rbp), %rdx
    movw    %ax, 98(%rdx)       # Store res->crc in res->crclist

.L4:
    addl    $1, -16(%rbp)       # Increment i

.L2:    # Loop condition
    movl    -12(%rbp), %eax     # Load iterations into eax
    cmpl    %eax, -16(%rbp)     # Compare i with iterations
    jb    .L3                   # If i < iterations, continue loop

    movl    $0, %eax            # Return value: NULL (0)
    leave
    ret
