	.file	"cmp_idx.c"
	.text
	.globl	cmp_idx
	.type	cmp_idx, @function
cmp_idx:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	movb	$0, %al
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	shrw	$8, %ax
	orl	%eax, %edx
	movq	-8(%rbp), %rax
	movw	%dx, (%rax)
	movq	-16(%rbp), %rax
	movzwl	(%rax), %eax
	movb	$0, %al
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movzwl	(%rax), %eax
	shrw	$8, %ax
	orl	%eax, %edx
	movq	-16(%rbp), %rax
	movw	%dx, (%rax)
.L2:
	movq	-8(%rbp), %rax
	movzwl	2(%rax), %eax
	movswl	%ax, %edx
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	cwtl
	subl	%eax, %edx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	cmp_idx, .-cmp_idx
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
