.globl FP_Cmp
.type FP_Cmp, @function
FP_Cmp:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -84(%rbp)
	movss	%xmm1, -88(%rbp)
	leaq	-84(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	leaq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-64(%rbp), %rax
	shrq	$31, %rax
	movq	%rax, -48(%rbp)
	movq	-56(%rbp), %rax
	shrq	$31, %rax
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jbe	.L4
	movl	$-1, %eax
	jmp	.L3
.L4:
	movq	-48(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jnb	.L5
	movl	$1, %eax
	jmp	.L3
.L5:
	cmpq	$0, -48(%rbp)
	je	.L6
	movl	$-1, %eax
	jmp	.L7
.L6:
	movl	$1, %eax
.L7:
	movl	%eax, -68(%rbp)
	movq	-64(%rbp), %rax
	shrq	$23, %rax
	andl	$255, %eax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	shrq	$23, %rax
	andl	$255, %eax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jbe	.L8
	movl	-68(%rbp), %eax
	jmp	.L3
.L8:
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jnb	.L9
	movl	-68(%rbp), %eax
	negl	%eax
	jmp	.L3
.L9:
	movq	-64(%rbp), %rax
	andl	$8388607, %eax
	orq	$8388608, %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	andl	$8388607, %eax
	orq	$8388608, %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jbe	.L10
	movl	-68(%rbp), %eax
	jmp	.L3
.L10:
	movl	-68(%rbp), %eax
	negl	%eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

