	.text
	.globl	JKMarray_idx
JKMarray_idx:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	-4(%rbp), %eax
	imull	%eax, %eax
	sall	$2, %eax
	addl	$5, %eax
	imull	-4(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1431655766, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$31, %eax
	subl	%eax, %edx	# ((4 * J * J + 5) * J) / 3
	movl	-4(%rbp), %eax
	imull	%eax, %eax
	addl	%eax, %eax	# 2 * J * J
	addl	%eax, %edx	# ((4 * J * J + 5) * J) / 3 + 2 * J * J
	movl	-4(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	imull	-8(%rbp), %eax
	addl	%eax, %edx
	movl	-12(%rbp), %eax # + M
	addl	%edx, %eax
	popq	%rbp
	ret
