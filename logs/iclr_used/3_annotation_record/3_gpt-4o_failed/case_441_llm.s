
    .text
# Local constants in function
    .section    .rodata
.LC_5_div_9: 
    .double 0.5555555555555556  # For (5.0 / 9.0);
.LC_32:
    .double 32.0  # For 32.0

# Function body
    .text
    .globl  toCelsius
    .type   toCelsius, @function
toCelsius:
.LF_toCelsius_entry:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movss   %xmm0, -8(%rbp)  # Store fahrenheit in local stack
    
    # (5.0 / 9.0) * (fahrenheit - 32)
    cvtss2sd -8(%rbp), %xmm0  # Convert single to double
    movsd   .LC_5_div_9(%rip), %xmm1
    movsd   .LC_32(%rip), %xmm2
    subsd   %xmm2, %xmm0
    mulsd   %xmm1, %xmm0
    cvtsd2ss %xmm0, %xmm0  # Convert double back to single
    movss   %xmm0, -4(%rbp)  # Store result
    
    # Return result
    movaps  -4(%rbp), %xmm0  # Use movaps instead of movss to avoid precision loss
    
    # Epilogue
    leave
    ret
