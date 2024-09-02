	.file	"matrix_sum.c"
	.text
	.globl	matrix_sum
	.type	matrix_sum, @function
matrix_sum:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, %eax
	movw	%ax, -40(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	movw	$0, -22(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L7:
	movl	$0, -8(%rbp)
	jmp	.L3
.L6:
	movl	-12(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	%eax, -20(%rbp)
	movswl	-40(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jle	.L4
	movzwl	-22(%rbp), %eax
	addl	$10, %eax
	movw	%ax, -22(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L5
.L4:
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	setg	%al
	movzbl	%al, %edx
	movzwl	-22(%rbp), %eax
	addl	%edx, %eax
	movw	%ax, -22(%rbp)
.L5:
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jb	.L6
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jb	.L7
	movzwl	-22(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	matrix_sum, .-matrix_sum
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
