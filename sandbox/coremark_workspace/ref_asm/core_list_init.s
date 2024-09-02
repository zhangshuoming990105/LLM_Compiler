	.file	"core_list_init.c"
	.text
	.globl	core_list_init
	.type	core_list_init, @function
core_list_init:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movl	%edx, %eax
	movw	%ax, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$20, -60(%rbp)
	movl	-84(%rbp), %eax
	movl	$0, %edx
	divl	-60(%rbp)
	subl	$2, %eax
	movl	%eax, -56(%rbp)
	movq	-96(%rbp), %rax
	movl	-56(%rbp), %edx
	salq	$4, %rdx
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	-56(%rbp), %edx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movw	$0, 2(%rax)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movw	$-32640, (%rax)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -96(%rbp)
	movq	-48(%rbp), %rax
	addq	$4, %rax
	movq	%rax, -48(%rbp)
	movw	$32767, -50(%rbp)
	movw	$-1, -52(%rbp)
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %rdi
	leaq	-48(%rbp), %rcx
	leaq	-96(%rbp), %rdx
	leaq	-52(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	core_list_insert_new@PLT
	movl	$0, -64(%rbp)
	jmp	.L2
.L3:
	movl	-64(%rbp), %eax
	movl	%eax, %edx
	movzwl	-88(%rbp), %eax
	xorl	%edx, %eax
	andl	$15, %eax
	movw	%ax, -68(%rbp)
	movzwl	-68(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-64(%rbp), %eax
	andl	$7, %eax
	orl	%edx, %eax
	movw	%ax, -66(%rbp)
	movzwl	-66(%rbp), %eax
	sall	$8, %eax
	movl	%eax, %edx
	movzwl	-66(%rbp), %eax
	orl	%edx, %eax
	movw	%ax, -52(%rbp)
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %rdi
	leaq	-48(%rbp), %rcx
	leaq	-96(%rbp), %rdx
	leaq	-52(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	core_list_insert_new@PLT
	addl	$1, -64(%rbp)
.L2:
	movl	-64(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jb	.L3
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movl	$1, -64(%rbp)
	jmp	.L4
.L7:
	movl	-56(%rbp), %eax
	movl	%eax, %edx
	movl	$3435973837, %eax
	imulq	%rdx, %rax
	shrq	$32, %rax
	shrl	$2, %eax
	cmpl	%eax, -64(%rbp)
	jnb	.L5
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -64(%rbp)
	movq	-40(%rbp), %rdx
	movq	8(%rdx), %rdx
	movw	%ax, 2(%rdx)
	jmp	.L6
.L5:
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -64(%rbp)
	movl	%eax, %edx
	movzwl	-88(%rbp), %eax
	xorl	%edx, %eax
	movw	%ax, -70(%rbp)
	movl	-64(%rbp), %eax
	sall	$8, %eax
	andw	$1792, %ax
	orw	-70(%rbp), %ax
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	andw	$16383, %dx
	movw	%dx, 2(%rax)
.L6:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L4:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L7
	movq	-16(%rbp), %rax
	movl	$0, %edx
	movq	cmp_idx@GOTPCREL(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	core_list_mergesort@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_list_init, .-core_list_init
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
