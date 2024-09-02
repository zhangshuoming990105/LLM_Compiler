	.file	"core_list_mergesort.c"
	.text
	.globl	core_list_mergesort
	.type	core_list_mergesort, @function
core_list_mergesort:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movl	$1, -52(%rbp)
.L20:
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -8(%rbp)
	movl	$0, -48(%rbp)
	jmp	.L2
.L17:
	addl	$1, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L3
.L6:
	addl	$1, -44(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L22
	addl	$1, -36(%rbp)
.L3:
	movl	-36(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L6
	jmp	.L5
.L22:
	nop
.L5:
	movl	-52(%rbp), %eax
	movl	%eax, -40(%rbp)
	jmp	.L7
.L15:
	cmpl	$0, -44(%rbp)
	jne	.L8
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	subl	$1, -40(%rbp)
	jmp	.L9
.L8:
	cmpl	$0, -40(%rbp)
	je	.L10
	cmpq	$0, -24(%rbp)
	jne	.L11
.L10:
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	subl	$1, -44(%rbp)
	jmp	.L9
.L11:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %r8
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	*%r8
	testl	%eax, %eax
	jg	.L12
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	subl	$1, -44(%rbp)
	jmp	.L9
.L12:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	subl	$1, -40(%rbp)
.L9:
	cmpq	$0, -8(%rbp)
	je	.L13
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L14
.L13:
	movq	-16(%rbp), %rax
	movq	%rax, -72(%rbp)
.L14:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
.L7:
	cmpl	$0, -44(%rbp)
	jg	.L15
	cmpl	$0, -40(%rbp)
	jle	.L16
	cmpq	$0, -24(%rbp)
	jne	.L15
.L16:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
.L2:
	cmpq	$0, -32(%rbp)
	jne	.L17
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	cmpl	$1, -48(%rbp)
	jg	.L18
	movq	-72(%rbp), %rax
	jmp	.L21
.L18:
	sall	-52(%rbp)
	jmp	.L20
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_list_mergesort, .-core_list_mergesort
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
