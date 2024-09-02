    .file   "get_time.c"
    .text
    .globl  get_time
    .type   get_time, @function
get_time:
.LFB0:
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp

    # Calculate difference in seconds and convert to milliseconds
    movq    stop_time_val(%rip), %rdx
    movq    start_time_val(%rip), %rax
    subq    %rax, %rdx
    imulq   $1000, %rdx, %rsi

    # Calculate difference in nanoseconds
    movq    8+stop_time_val(%rip), %rdx
    movq    8+start_time_val(%rip), %rax
    subq    %rax, %rdx

    # Convert nanoseconds to milliseconds using division
    movq    %rdx, %rax
    movl    $1000000, %ecx
    cqto                    # Sign-extend RAX into RDX:RAX
    idivq   %rcx            # Divide RDX:RAX by RCX, result in RAX

    # Combine milliseconds from seconds and nanoseconds
    addq    %rsi, %rax
    movq    %rax, -8(%rbp)

    # Load result into return register
    movq    -8(%rbp), %rax

    popq    %rbp
    ret
