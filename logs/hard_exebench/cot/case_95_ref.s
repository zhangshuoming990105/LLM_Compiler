.globl get_gap_qual
.type get_gap_qual, @function
get_gap_qual:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$1, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L6:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	je	.L3
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	imull	-8(%rbp), %eax
	addl	%eax, -16(%rbp)
	movl	-8(%rbp), %eax
	addl	%eax, -12(%rbp)
.L3:
	cmpl	$2, -4(%rbp)
	jg	.L4
	addl	$1, -8(%rbp)
	jmp	.L5
.L4:
	cmpl	$3, -4(%rbp)
	jle	.L5
	subl	$1, -8(%rbp)
.L5:
	addl	$1, -4(%rbp)
.L2:
	cmpl	$7, -4(%rbp)
	jle	.L6
	cmpl	$0, -12(%rbp)
	jle	.L7
	movl	-16(%rbp), %eax
	cltd
	idivl	-12(%rbp)
	jmp	.L8
.L7:
	movl	$0, %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

