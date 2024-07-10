    .text
    .globl  UI_ClampCvar
UI_ClampCvar:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp           # Allocate space for local variables

    movss   %xmm2, -12(%rbp)    # value
    movss   %xmm0, -4(%rbp)     # min
    movss   %xmm1, -8(%rbp)     # max

    movss   -12(%rbp), %xmm0    # Load value into xmm0
    ucomiss -4(%rbp), %xmm0     # Compare value with min
    jae     .L1                 # Jump if value >= min
    movss   -4(%rbp), %xmm0     # Return min
    jmp     .L3

.L1:
    movss   -12(%rbp), %xmm0    # Load value into xmm0
    ucomiss -8(%rbp), %xmm0     # Compare value with max
    jbe     .L2                 # Jump if value <= max
    movss   -8(%rbp), %xmm0     # Return max
    jmp     .L3

.L2:
    movss   -12(%rbp), %xmm0    # Return value

.L3:
    leave
    ret