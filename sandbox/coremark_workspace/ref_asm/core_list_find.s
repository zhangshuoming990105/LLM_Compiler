	.file	"core_list_find.c"
	.text
	.globl	core_list_find
	.type	core_list_find, @function
core_list_find:
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
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	testw	%ax, %ax
	js	.L7
	jmp	.L3
.L5:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L3:
	cmpq	$0, -8(%rbp)
	je	.L4
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzwl	2(%rax), %edx
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	cmpw	%ax, %dx
	jne	.L5
.L4:
	movq	-8(%rbp), %rax
	jmp	.L6
.L9:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L7:
	cmpq	$0, -8(%rbp)
	je	.L8
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzwl	(%rax), %eax
	cwtl
	movzbl	%al, %edx
	movq	-16(%rbp), %rax
	movzwl	(%rax), %eax
	cwtl
	cmpl	%eax, %edx
	jne	.L9
.L8:
	movq	-8(%rbp), %rax
.L6:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_list_find, .-core_list_find
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
