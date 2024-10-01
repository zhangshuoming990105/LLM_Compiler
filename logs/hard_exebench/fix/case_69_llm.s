
.L3:
    cmpl	$0, -8(%rbp)      # Compare current with 0
    jns	.L2                # If current >= 0, jump to .L2
    movl	$0, -8(%rbp)      # current = 0
