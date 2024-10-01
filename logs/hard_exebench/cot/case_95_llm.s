
    .text
    .globl  get_gap_qual
    .type   get_gap_qual, @function
get_gap_qual:
.LF_get_gap_qual_entry:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp
    movq    %rdi, -24(%rbp)  # Store window pointer

    # Initialize local variables
    movl    $0, -4(%rbp)     # score_sum = 0
    movl    $0, -8(%rbp)     # weight_sum = 0
    movl    $1, -12(%rbp)    # weight = 1
    movl    $0, -16(%rbp)    # i = 0

    # Loop initialization
    jmp     .L_loop_cond

.L_loop_body:
    # Check if window[i] != -1
    movq    -24(%rbp), %rax
    movl    -16(%rbp), %edx
    movl    (%rax, %rdx, 4), %ecx  # window[i]
    cmpl    $.LC_minus_one, %ecx
    je      .L_skip_update

    # Update score_sum and weight_sum
    movl    -12(%rbp), %eax
    imull   %ecx, %eax
    addl    %eax, -4(%rbp)         # score_sum += window[i] * weight
    addl    -12(%rbp), -8(%rbp)    # weight_sum += weight

.L_skip_update:
    # Update weight
    cmpl    $.LC_four, -16(%rbp)
    jl      .L_increment_weight
    cmpl    $.LC_eight, -16(%rbp)
    jg      .L_decrement_weight
    jmp     .L_weight_unchanged

.L_increment_weight:
    incl    -12(%rbp)              # weight++
    jmp     .L_weight_unchanged

.L_decrement_weight:
    decl    -12(%rbp)              # weight--

.L_weight_unchanged:
    # Increment loop counter
    incl    -16(%rbp)              # i++

.L_loop_cond:
    cmpl    $.LC_eight, -16(%rbp)
    jle     .L_loop_body

    # Check if weight_sum > 0
    cmpl    $0, -8(%rbp)
    jle     .L_return_null

    # Calculate and return score_sum / weight_sum
    movl    -4(%rbp), %eax
    cltd
    idivl   -8(%rbp)
    movsbl  %al, %eax
    jmp     .L_return

.L_return_null:
    movl    $.LC_null_char, %eax

.L_return:
    # Epilogue
    leave
    ret

    .section    .rodata
.LC_minus_one:
    .long   -1
.LC_eight:
    .long   8
.LC_four:
    .long   4
.LC_null_char:
    .string "\0"
