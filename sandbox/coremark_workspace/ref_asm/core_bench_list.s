	.file	"core_bench_list.c"
	.text
	.globl	core_bench_list
	.type	core_bench_list, @function
core_bench_list:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movl	%esi, %eax
	movw	%ax, -76(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$0, -54(%rbp)
	movw	$0, -52(%rbp)
	movw	$0, -50(%rbp)
	movq	-72(%rbp), %rax
	movq	56(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-72(%rbp), %rax
	movzwl	4(%rax), %eax
	movw	%ax, -46(%rbp)
	movl	$0, -44(%rbp)
	movzwl	-76(%rbp), %eax
	movw	%ax, -42(%rbp)
	movw	$0, -48(%rbp)
	jmp	.L2
.L7:
	movzwl	-48(%rbp), %eax
	movzbl	%al, %eax
	movw	%ax, -44(%rbp)
	leaq	-44(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	core_list_find@PLT
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	core_list_reverse@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L3
	movzwl	-50(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -50(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movzwl	(%rax), %eax
	sarw	$8, %ax
	andl	$1, %eax
	addw	%ax, -54(%rbp)
	jmp	.L4
.L3:
	movzwl	-52(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -52(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movzwl	(%rax), %eax
	cwtl
	andl	$1, %eax
	testl	%eax, %eax
	je	.L5
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movzwl	(%rax), %eax
	sarw	$9, %ax
	andl	$1, %eax
	addw	%ax, -54(%rbp)
.L5:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L4
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
.L4:
	movzwl	-42(%rbp), %eax
	testw	%ax, %ax
	js	.L6
	movzwl	-42(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -42(%rbp)
.L6:
	movzwl	-48(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -48(%rbp)
.L2:
	movzwl	-48(%rbp), %eax
	cmpw	-46(%rbp), %ax
	jl	.L7
	movzwl	-52(%rbp), %eax
	sall	$2, %eax
	subw	-50(%rbp), %ax
	addw	%ax, -54(%rbp)
	cmpw	$0, -76(%rbp)
	jle	.L8
	movq	-72(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	cmp_complex@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	core_list_mergesort@PLT
	movq	%rax, -40(%rbp)
.L8:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	core_list_remove@PLT
	movq	%rax, -24(%rbp)
	leaq	-44(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	core_list_find@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L10
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L10
.L11:
	movzwl	-54(%rbp), %edx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movzwl	(%rax), %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -54(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
.L10:
	cmpq	$0, -32(%rbp)
	jne	.L11
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	core_list_undo_remove@PLT
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movl	$0, %edx
	movq	cmp_idx@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	core_list_mergesort@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	.L12
.L13:
	movzwl	-54(%rbp), %edx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movzwl	(%rax), %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -54(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
.L12:
	cmpq	$0, -32(%rbp)
	jne	.L13
	movzwl	-54(%rbp), %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_bench_list, .-core_bench_list
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
