.globl median3
.type median3, @function
median3:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movss	%xmm0, -36(%rbp)
	movss	%xmm1, -40(%rbp)
	movss	%xmm2, -44(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movss	-36(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	movss	-40(%rbp), %xmm0
	movss	%xmm0, -16(%rbp)
	movss	-44(%rbp), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L2
.L7:
	movl	$0, -32(%rbp)
	jmp	.L3
.L6:
	movl	-32(%rbp), %eax
	cltq
	movss	-20(%rbp,%rax,4), %xmm0
	movl	-32(%rbp), %eax
	addl	$1, %eax
	cltq
	movss	-20(%rbp,%rax,4), %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L4
	movl	-32(%rbp), %eax
	cltq
	movss	-20(%rbp,%rax,4), %xmm0
	movss	%xmm0, -24(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	cltq
	movss	-20(%rbp,%rax,4), %xmm0
	movl	-32(%rbp), %eax
	cltq
	movss	%xmm0, -20(%rbp,%rax,4)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	cltq
	movss	-24(%rbp), %xmm0
	movss	%xmm0, -20(%rbp,%rax,4)
.L4:
	addl	$1, -32(%rbp)
.L3:
	movl	$2, %eax
	subl	-28(%rbp), %eax
	cmpl	%eax, -32(%rbp)
	jl	.L6
	addl	$1, -28(%rbp)
.L2:
	cmpl	$1, -28(%rbp)
	jle	.L7
	movss	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

