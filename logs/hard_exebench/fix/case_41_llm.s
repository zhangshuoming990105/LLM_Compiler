
	.text
	.globl	InterpCubeLagrange
	.type	InterpCubeLagrange, @function
InterpCubeLagrange:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$160, %rsp
	movsd	%xmm0, -8(%rbp)      # xdiff
	movsd	%xmm1, -16(%rbp)     # ydiff
	movsd	%xmm2, -24(%rbp)     # zdiff
	movsd	%xmm3, -32(%rbp)     # vval000
	movsd	%xmm4, -40(%rbp)     # vval001
	movsd	%xmm5, -48(%rbp)     # vval010
	movsd	%xmm6, -56(%rbp)     # vval011
	movsd	%xmm7, -64(%rbp)     # vval100
	movsd	%xmm8, -72(%rbp)     # vval101
	movsd	%xmm9, -80(%rbp)     # vval110
	movsd	%xmm10, -88(%rbp)    # vval111

	# Compute oneMinusXdiff = 1.0 - xdiff
	movsd	.LC0(%rip), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, -104(%rbp)    # oneMinusXdiff

	# Compute oneMinusYdiff = 1.0 - ydiff
	movsd	.LC0(%rip), %xmm0
	subsd	-16(%rbp), %xmm0
	movsd	%xmm0, -112(%rbp)    # oneMinusYdiff

	# Compute oneMinusZdiff = 1.0 - zdiff
	movsd	.LC0(%rip), %xmm0
	subsd	-24(%rbp), %xmm0
	movsd	%xmm0, -120(%rbp)    # oneMinusZdiff

	# Compute value
	movsd	-32(%rbp), %xmm0     # vval000
	mulsd	-104(%rbp), %xmm0    # vval000 * oneMinusXdiff
	mulsd	-112(%rbp), %xmm0    # vval000 * oneMinusXdiff * oneMinusYdiff
	mulsd	-120(%rbp), %xmm0    # vval000 * oneMinusXdiff * oneMinusYdiff * oneMinusZdiff
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-40(%rbp), %xmm0     # vval001
	mulsd	-104(%rbp), %xmm0    # vval001 * oneMinusXdiff
	mulsd	-112(%rbp), %xmm0    # vval001 * oneMinusXdiff * oneMinusYdiff
	mulsd	-24(%rbp), %xmm0     # vval001 * oneMinusXdiff * oneMinusYdiff * zdiff
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-48(%rbp), %xmm0     # vval010
	mulsd	-104(%rbp), %xmm0    # vval010 * oneMinusXdiff
	mulsd	-16(%rbp), %xmm0     # vval010 * oneMinusXdiff * ydiff
	mulsd	-120(%rbp), %xmm0    # vval010 * oneMinusXdiff * ydiff * oneMinusZdiff
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-56(%rbp), %xmm0     # vval011
	mulsd	-104(%rbp), %xmm0    # vval011 * oneMinusXdiff
	mulsd	-16(%rbp), %xmm0     # vval011 * oneMinusXdiff * ydiff
	mulsd	-24(%rbp), %xmm0     # vval011 * oneMinusXdiff * ydiff * zdiff
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-64(%rbp), %xmm0     # vval100
	mulsd	-8(%rbp), %xmm0      # vval100 * xdiff
	mulsd	-112(%rbp), %xmm0    # vval100 * xdiff * oneMinusYdiff
	mulsd	-120(%rbp), %xmm0    # vval100 * xdiff * oneMinusYdiff * oneMinusZdiff
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-72(%rbp), %xmm0     # vval101
	mulsd	-8(%rbp), %xmm0      # vval101 * xdiff
	mulsd	-112(%rbp), %xmm0    # vval101 * xdiff * oneMinusYdiff
	mulsd	-24(%rbp), %xmm0     # vval101 * xdiff * oneMinusYdiff * zdiff
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-80(%rbp), %xmm0     # vval110
	mulsd	-8(%rbp), %xmm0      # vval110 * xdiff
	mulsd	-16(%rbp), %xmm0     # vval110 * xdiff * ydiff
	mulsd	-120(%rbp), %xmm0    # vval110 * xdiff * ydiff * oneMinusZdiff
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-88(%rbp), %xmm0     # vval111
	mulsd	-8(%rbp), %xmm0      # vval111 * xdiff
	mulsd	-16(%rbp), %xmm0     # vval111 * xdiff * ydiff
	mulsd	-24(%rbp), %xmm0     # vval111 * xdiff * ydiff * zdiff
	addsd	-128(%rbp), %xmm0
	movsd	%xmm0, -128(%rbp)    # value

	movsd	-128(%rbp), %xmm0    # load final value
	leave
	ret
.LC0:
	.long	0
	.long	1072693248
