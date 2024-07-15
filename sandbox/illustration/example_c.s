	.text
	.globl	slice2
slice2:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)			# total
	movq	%rsi, -16(%rbp)			# arr1
	movl	$0, -20(%rbp)			# sum
	movl	$0, -24(%rbp)			# i
.LBB0_1:
	movl	-24(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB0_4
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	addl	-20(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movq	$0, -32(%rbp)			# not_used
	xorps	%xmm0, %xmm0
	movss	%xmm0, -36(%rbp)		# not_used_2
	movl	-20(%rbp), %eax
	popq	%rbp
	retq
