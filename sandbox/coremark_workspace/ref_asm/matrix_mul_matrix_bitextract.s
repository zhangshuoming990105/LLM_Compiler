	.file	"matrix_mul_matrix_bitextract.c"
	.text
	.globl	matrix_mul_matrix_bitextract
	.type	matrix_mul_matrix_bitextract, @function
matrix_mul_matrix_bitextract:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L2
.L7:
	movl	$0, -12(%rbp)
	jmp	.L3
.L6:
	movl	-16(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, (%rax)
	movl	$0, -8(%rbp)
	jmp	.L4
.L5:
	movl	-16(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movswl	%ax, %edx
	movl	-8(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	movl	%eax, %eax
	leaq	(%rax,%rax), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movzwl	(%rax), %eax
	cwtl
	imull	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-16(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	sarl	$2, %eax
	andl	$15, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	sarl	$5, %eax
	andl	$127, %eax
	imull	%edx, %eax
	addl	%eax, %ecx
	movl	-16(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -8(%rbp)
.L4:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L5
	addl	$1, -12(%rbp)
.L3:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L6
	addl	$1, -16(%rbp)
.L2:
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L7
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	matrix_mul_matrix_bitextract, .-matrix_mul_matrix_bitextract
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
