	.file	"core_bench_state.c"
	.text
	.globl	core_bench_state
	.type	core_bench_state, @function
core_bench_state:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movl	%ecx, %eax
	movl	%r8d, %esi
	movl	%r9d, %ecx
	movw	%dx, -120(%rbp)
	movw	%ax, -132(%rbp)
	movl	%esi, %eax
	movw	%ax, -136(%rbp)
	movl	%ecx, %eax
	movw	%ax, -140(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-128(%rbp), %rax
	movq	%rax, -88(%rbp)
	movl	$0, -100(%rbp)
	jmp	.L2
.L3:
	movl	-100(%rbp), %eax
	movl	$0, -48(%rbp,%rax,4)
	movl	-100(%rbp), %eax
	movl	-48(%rbp,%rax,4), %edx
	movl	-100(%rbp), %eax
	movl	%edx, -80(%rbp,%rax,4)
	addl	$1, -100(%rbp)
.L2:
	cmpl	$7, -100(%rbp)
	jbe	.L3
	jmp	.L4
.L5:
	leaq	-48(%rbp), %rdx
	leaq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	core_state_transition@PLT
	movl	%eax, -92(%rbp)
	movl	-92(%rbp), %eax
	movl	-80(%rbp,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-92(%rbp), %eax
	movl	%edx, -80(%rbp,%rax,4)
.L4:
	movq	-88(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L5
	movq	-128(%rbp), %rax
	movq	%rax, -88(%rbp)
	jmp	.L6
.L8:
	movq	-88(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$44, %al
	je	.L7
	movq	-88(%rbp), %rax
	movzbl	(%rax), %edx
	movzwl	-120(%rbp), %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rax
	xorl	%ecx, %edx
	movb	%dl, (%rax)
.L7:
	movq	-88(%rbp), %rdx
	movswq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -88(%rbp)
.L6:
	movl	-116(%rbp), %edx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movq	-88(%rbp), %rdx
	cmpq	%rax, %rdx
	jb	.L8
	movq	-128(%rbp), %rax
	movq	%rax, -88(%rbp)
	jmp	.L9
.L10:
	leaq	-48(%rbp), %rdx
	leaq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	core_state_transition@PLT
	movl	%eax, -96(%rbp)
	movl	-96(%rbp), %eax
	movl	-80(%rbp,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-96(%rbp), %eax
	movl	%edx, -80(%rbp,%rax,4)
.L9:
	movq	-88(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L10
	movq	-128(%rbp), %rax
	movq	%rax, -88(%rbp)
	jmp	.L11
.L13:
	movq	-88(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$44, %al
	je	.L12
	movq	-88(%rbp), %rax
	movzbl	(%rax), %edx
	movzwl	-132(%rbp), %eax
	movl	%eax, %ecx
	movq	-88(%rbp), %rax
	xorl	%ecx, %edx
	movb	%dl, (%rax)
.L12:
	movq	-88(%rbp), %rdx
	movswq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -88(%rbp)
.L11:
	movl	-116(%rbp), %edx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movq	-88(%rbp), %rdx
	cmpq	%rax, %rdx
	jb	.L13
	movl	$0, -100(%rbp)
	jmp	.L14
.L15:
	movzwl	-140(%rbp), %edx
	movl	-100(%rbp), %eax
	movl	-80(%rbp,%rax,4), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	crcu32@PLT
	movw	%ax, -140(%rbp)
	movzwl	-140(%rbp), %edx
	movl	-100(%rbp), %eax
	movl	-48(%rbp,%rax,4), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	crcu32@PLT
	movw	%ax, -140(%rbp)
	addl	$1, -100(%rbp)
.L14:
	cmpl	$7, -100(%rbp)
	jbe	.L15
	movzwl	-140(%rbp), %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_bench_state, .-core_bench_state
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
