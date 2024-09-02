	.file	"calc_func.c"
	.text
	.globl	calc_func
	.type	calc_func, @function
calc_func:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	movw	%ax, -4(%rbp)
	movzwl	-4(%rbp), %eax
	sarw	$7, %ax
	andl	$1, %eax
	movb	%al, -9(%rbp)
	cmpb	$0, -9(%rbp)
	je	.L2
	movzwl	-4(%rbp), %eax
	andl	$127, %eax
	jmp	.L3
.L2:
	movzwl	-4(%rbp), %eax
	andl	$7, %eax
	movw	%ax, -2(%rbp)
	movzwl	-4(%rbp), %eax
	sarw	$3, %ax
	andl	$15, %eax
	movw	%ax, -6(%rbp)
	movzwl	-6(%rbp), %eax
	sall	$4, %eax
	orw	%ax, -6(%rbp)
	movswl	-2(%rbp), %eax
	testl	%eax, %eax
	je	.L4
	cmpl	$1, %eax
	je	.L5
	jmp	.L11
.L4:
	cmpw	$33, -6(%rbp)
	jg	.L7
	movw	$34, -6(%rbp)
.L7:
	movq	-32(%rbp), %rax
	movzwl	96(%rax), %eax
	movzwl	%ax, %r8d
	movswl	-6(%rbp), %edi
	movq	-32(%rbp), %rax
	movzwl	2(%rax), %eax
	movswl	%ax, %ecx
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	movswl	%ax, %edx
	movq	-32(%rbp), %rax
	movq	32(%rax), %rsi
	movq	-32(%rbp), %rax
	movl	40(%rax), %eax
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %edi
	call	core_bench_state@PLT
	movw	%ax, -8(%rbp)
	movq	-32(%rbp), %rax
	movzwl	102(%rax), %eax
	testw	%ax, %ax
	jne	.L12
	movzwl	-8(%rbp), %edx
	movq	-32(%rbp), %rax
	movw	%dx, 102(%rax)
	jmp	.L12
.L5:
	movq	-32(%rbp), %rax
	movzwl	96(%rax), %eax
	movzwl	%ax, %edx
	movswl	-6(%rbp), %eax
	movq	-32(%rbp), %rcx
	addq	$64, %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	call	core_bench_matrix@PLT
	movw	%ax, -8(%rbp)
	movq	-32(%rbp), %rax
	movzwl	100(%rax), %eax
	testw	%ax, %ax
	jne	.L13
	movzwl	-8(%rbp), %edx
	movq	-32(%rbp), %rax
	movw	%dx, 100(%rax)
	jmp	.L13
.L11:
	movzwl	-4(%rbp), %eax
	movw	%ax, -8(%rbp)
	jmp	.L9
.L12:
	nop
	jmp	.L9
.L13:
	nop
.L9:
	movq	-32(%rbp), %rax
	movzwl	96(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-8(%rbp), %eax
	movzwl	%ax, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	crcu16@PLT
	movq	-32(%rbp), %rdx
	movw	%ax, 96(%rdx)
	andw	$127, -8(%rbp)
	movzwl	-4(%rbp), %eax
	movb	$0, %al
	orb	$-128, %al
	orw	-8(%rbp), %ax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movw	%dx, (%rax)
	movzwl	-8(%rbp), %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	calc_func, .-calc_func
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
