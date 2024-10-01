.globl InterpCubeLagrange
.type InterpCubeLagrange, @function
InterpCubeLagrange:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -40(%rbp)
	movsd	%xmm1, -48(%rbp)
	movsd	%xmm2, -56(%rbp)
	movsd	%xmm3, -64(%rbp)
	movsd	%xmm4, -72(%rbp)
	movsd	%xmm5, -80(%rbp)
	movsd	%xmm6, -88(%rbp)
	movsd	%xmm7, -96(%rbp)
	movsd	.LC0(%rip), %xmm0
	subsd	-40(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	.LC0(%rip), %xmm0
	subsd	-48(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC0(%rip), %xmm0
	subsd	-56(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-64(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	-16(%rbp), %xmm1
	movsd	-72(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movsd	-80(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movsd	-88(%rbp), %xmm0
	mulsd	-32(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movsd	-96(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movsd	16(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movsd	24(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	addsd	%xmm0, %xmm1
	movsd	32(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	mulsd	-48(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LC0: 	.long	0
