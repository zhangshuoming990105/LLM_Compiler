
    .text
    .globl  InterpCubeLagrange
    .type   InterpCubeLagrange, @function
InterpCubeLagrange:
.LF_InterpCubeLagrange_entry:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $128, %rsp
    
    # Store function arguments
    movsd   %xmm0, -40(%rbp)  # xdiff
    movsd   %xmm1, -48(%rbp)  # ydiff
    movsd   %xmm2, -56(%rbp)  # zdiff
    movsd   %xmm3, -64(%rbp)  # vval000
    movsd   %xmm4, -72(%rbp)  # vval001
    movsd   %xmm5, -80(%rbp)  # vval010
    movsd   %xmm6, -88(%rbp)  # vval011
    movsd   %xmm7, -96(%rbp)  # vval100
    movsd   %xmm8, -104(%rbp) # vval101
    movsd   %xmm9, -112(%rbp) # vval110
    movsd   %xmm10, -120(%rbp) # vval111
    
    # oneMinusXdiff = 1.0 - xdiff;
    movsd   .LC_one(%rip), %xmm0
    subsd   -40(%rbp), %xmm0
    movsd   %xmm0, -16(%rbp)
    
    # oneMinusYdiff = 1.0 - ydiff;
    movsd   .LC_one(%rip), %xmm0
    subsd   -48(%rbp), %xmm0
    movsd   %xmm0, -24(%rbp)
    
    # oneMinusZdiff = 1.0 - zdiff;
    movsd   .LC_one(%rip), %xmm0
    subsd   -56(%rbp), %xmm0
    movsd   %xmm0, -32(%rbp)
    
    # value = 0.0;
    xorpd   %xmm0, %xmm0
    movsd   %xmm0, -8(%rbp)
    
    # value += vval000 * (oneMinusXdiff) * (oneMinusYdiff) * (oneMinusZdiff)
    movsd   -64(%rbp), %xmm0  # vval000
    mulsd   -16(%rbp), %xmm0  # vval000 * oneMinusXdiff
    mulsd   -24(%rbp), %xmm0  # vval000 * oneMinusXdiff * oneMinusYdiff
    mulsd   -32(%rbp), %xmm0  # vval000 * oneMinusXdiff * oneMinusYdiff * oneMinusZdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # value += vval001 * (oneMinusXdiff) * (oneMinusYdiff) * zdiff
    movsd   -72(%rbp), %xmm0  # vval001
    mulsd   -16(%rbp), %xmm0  # vval001 * oneMinusXdiff
    mulsd   -24(%rbp), %xmm0  # vval001 * oneMinusXdiff * oneMinusYdiff
    mulsd   -56(%rbp), %xmm0  # vval001 * oneMinusXdiff * oneMinusYdiff * zdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # value += vval010 * (oneMinusXdiff) * ydiff * (oneMinusZdiff)
    movsd   -80(%rbp), %xmm0  # vval010
    mulsd   -16(%rbp), %xmm0  # vval010 * oneMinusXdiff
    mulsd   -48(%rbp), %xmm0  # vval010 * oneMinusXdiff * ydiff
    mulsd   -32(%rbp), %xmm0  # vval010 * oneMinusXdiff * ydiff * oneMinusZdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # value += vval011 * (oneMinusXdiff) * ydiff * zdiff
    movsd   -88(%rbp), %xmm0  # vval011
    mulsd   -16(%rbp), %xmm0  # vval011 * oneMinusXdiff
    mulsd   -48(%rbp), %xmm0  # vval011 * oneMinusXdiff * ydiff
    mulsd   -56(%rbp), %xmm0  # vval011 * oneMinusXdiff * ydiff * zdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # value += vval100 * xdiff * (oneMinusYdiff) * (oneMinusZdiff)
    movsd   -96(%rbp), %xmm0  # vval100
    mulsd   -40(%rbp), %xmm0  # vval100 * xdiff
    mulsd   -24(%rbp), %xmm0  # vval100 * xdiff * oneMinusYdiff
    mulsd   -32(%rbp), %xmm0  # vval100 * xdiff * oneMinusYdiff * oneMinusZdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # value += vval101 * xdiff * (oneMinusYdiff) * zdiff
    movsd   -104(%rbp), %xmm0 # vval101
    mulsd   -40(%rbp), %xmm0  # vval101 * xdiff
    mulsd   -24(%rbp), %xmm0  # vval101 * xdiff * oneMinusYdiff
    mulsd   -56(%rbp), %xmm0  # vval101 * xdiff * oneMinusYdiff * zdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # value += vval110 * xdiff * ydiff * (oneMinusZdiff)
    movsd   -112(%rbp), %xmm0 # vval110
    mulsd   -40(%rbp), %xmm0  # vval110 * xdiff
    mulsd   -48(%rbp), %xmm0  # vval110 * xdiff * ydiff
    mulsd   -32(%rbp), %xmm0  # vval110 * xdiff * ydiff * oneMinusZdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # value += vval111 * xdiff * ydiff * zdiff
    movsd   -120(%rbp), %xmm0 # vval111
    mulsd   -40(%rbp), %xmm0  # vval111 * xdiff
    mulsd   -48(%rbp), %xmm0  # vval111 * xdiff * ydiff
    mulsd   -56(%rbp), %xmm0  # vval111 * xdiff * ydiff * zdiff
    movsd   -8(%rbp), %xmm1   # load current value
    addsd   %xmm0, %xmm1      # add to current value
    movsd   %xmm1, -8(%rbp)   # store updated value
    
    # return value;
    movsd   -8(%rbp), %xmm0
    
    # Epilogue
    leave
    ret

    .section    .rodata
    .align 8
.LC_one:
    .double 1.0
