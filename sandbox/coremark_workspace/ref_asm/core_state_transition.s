	.file	"core_state_transition.c"
	.text
	.globl	core_state_transition
	.type	core_state_transition, @function
core_state_transition:
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
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L2
.L34:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -13(%rbp)
	cmpb	$44, -13(%rbp)
	jne	.L3
	addq	$1, -8(%rbp)
	jmp	.L4
.L3:
	cmpl	$7, -12(%rbp)
	ja	.L36
	movl	-12(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L7(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L7(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L7:
	.long	.L13-.L7
	.long	.L36-.L7
	.long	.L12-.L7
	.long	.L11-.L7
	.long	.L10-.L7
	.long	.L9-.L7
	.long	.L8-.L7
	.long	.L6-.L7
	.text
.L13:
	movzbl	-13(%rbp), %eax
	movl	%eax, %edi
	call	ee_isdigit@PLT
	testb	%al, %al
	je	.L14
	movl	$4, -12(%rbp)
	jmp	.L15
.L14:
	cmpb	$43, -13(%rbp)
	je	.L16
	cmpb	$45, -13(%rbp)
	jne	.L17
.L16:
	movl	$2, -12(%rbp)
	jmp	.L15
.L17:
	cmpb	$46, -13(%rbp)
	jne	.L18
	movl	$5, -12(%rbp)
	jmp	.L15
.L18:
	movl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
.L15:
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L19
.L12:
	movzbl	-13(%rbp), %eax
	movl	%eax, %edi
	call	ee_isdigit@PLT
	testb	%al, %al
	je	.L20
	movl	$4, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L19
.L20:
	cmpb	$46, -13(%rbp)
	jne	.L22
	movl	$5, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L19
.L22:
	movl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L19
.L10:
	cmpb	$46, -13(%rbp)
	jne	.L23
	movl	$5, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$16, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L37
.L23:
	movzbl	-13(%rbp), %eax
	movl	%eax, %edi
	call	ee_isdigit@PLT
	testb	%al, %al
	jne	.L37
	movl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$16, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L37
.L9:
	cmpb	$69, -13(%rbp)
	je	.L25
	cmpb	$101, -13(%rbp)
	jne	.L26
.L25:
	movl	$3, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$20, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L38
.L26:
	movzbl	-13(%rbp), %eax
	movl	%eax, %edi
	call	ee_isdigit@PLT
	testb	%al, %al
	jne	.L38
	movl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$20, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L38
.L11:
	cmpb	$43, -13(%rbp)
	je	.L28
	cmpb	$45, -13(%rbp)
	jne	.L29
.L28:
	movl	$6, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$12, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L19
.L29:
	movl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$12, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L19
.L8:
	movzbl	-13(%rbp), %eax
	movl	%eax, %edi
	call	ee_isdigit@PLT
	testb	%al, %al
	je	.L31
	movl	$7, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L19
.L31:
	movl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L19
.L6:
	movzbl	-13(%rbp), %eax
	movl	%eax, %edi
	call	ee_isdigit@PLT
	testb	%al, %al
	jne	.L39
	movl	$1, -12(%rbp)
	movq	-32(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	jmp	.L39
.L36:
	nop
	jmp	.L19
.L37:
	nop
	jmp	.L19
.L38:
	nop
	jmp	.L19
.L39:
	nop
.L19:
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L4
	cmpl	$1, -12(%rbp)
	jne	.L34
.L4:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_state_transition, .-core_state_transition
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
