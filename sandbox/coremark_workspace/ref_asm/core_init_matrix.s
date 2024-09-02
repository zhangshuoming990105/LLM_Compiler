	.file	"core_init_matrix.c"
	.text
	.globl	core_init_matrix
	.type	core_init_matrix, @function
core_init_matrix:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -56(%rbp)
	movq	%rcx, -72(%rbp)
	movl	$0, -20(%rbp)
	movl	$1, -32(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	cmpl	$0, -56(%rbp)
	jne	.L3
	movl	$1, -56(%rbp)
	jmp	.L3
.L4:
	addl	$1, -28(%rbp)
	movl	-28(%rbp), %eax
	imull	%eax, %eax
	sall	$3, %eax
	movl	%eax, -24(%rbp)
.L3:
	movl	-24(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L4
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	movq	-64(%rbp), %rax
	subq	$1, %rax
	andq	$-4, %rax
	addq	$4, %rax
	movq	%rax, -16(%rbp)
	movl	-20(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L5
.L8:
	movl	$0, -24(%rbp)
	jmp	.L6
.L7:
	movl	-32(%rbp), %eax
	imull	-56(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$16, %eax
	addl	%eax, %edx
	movzwl	%dx, %edx
	subl	%eax, %edx
	movl	%edx, -56(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movw	%ax, -34(%rbp)
	movl	-28(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzwl	-34(%rbp), %eax
	movw	%ax, (%rdx)
	movl	-32(%rbp), %eax
	movl	%eax, %edx
	movzwl	-34(%rbp), %eax
	addl	%edx, %eax
	movw	%ax, -34(%rbp)
	andw	$255, -34(%rbp)
	movl	-28(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movzwl	-34(%rbp), %eax
	movw	%ax, (%rdx)
	addl	$1, -32(%rbp)
	addl	$1, -24(%rbp)
.L6:
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L7
	addl	$1, -28(%rbp)
.L5:
	movl	-28(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L8
	movq	-72(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-72(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movl	-20(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	subq	$1, %rax
	andq	$-4, %rax
	addq	$4, %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, 24(%rax)
	movl	-20(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, (%rax)
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_init_matrix, .-core_init_matrix
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
