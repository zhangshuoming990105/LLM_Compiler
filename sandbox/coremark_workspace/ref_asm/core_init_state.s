	.file	"core_init_state.c"
	.text
	.section	.rodata
.LC0:
	.string	"5012"
.LC1:
	.string	"1234"
.LC2:
	.string	"-874"
.LC3:
	.string	"+122"
	.section	.data.rel.local,"aw"
	.align 32
	.type	intpat, @object
	.size	intpat, 32
intpat:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.section	.rodata
.LC4:
	.string	"35.54400"
.LC5:
	.string	".1234500"
.LC6:
	.string	"-110.700"
.LC7:
	.string	"+0.64400"
	.section	.data.rel.local
	.align 32
	.type	floatpat, @object
	.size	floatpat, 32
floatpat:
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.section	.rodata
.LC8:
	.string	"5.500e+3"
.LC9:
	.string	"-.123e-2"
.LC10:
	.string	"-87e+832"
.LC11:
	.string	"+0.6e-12"
	.section	.data.rel.local
	.align 32
	.type	scipat, @object
	.size	scipat, 32
scipat:
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.section	.rodata
.LC12:
	.string	"T0.3e-1F"
.LC13:
	.string	"-T.T++Tq"
.LC14:
	.string	"1T3.4e4z"
.LC15:
	.string	"34.0e-T^"
	.section	.data.rel.local
	.align 32
	.type	errpat, @object
	.size	errpat, 32
errpat:
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.text
	.globl	core_init_state
	.type	core_init_state, @function
core_init_state:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movl	%esi, %eax
	movq	%rdx, -48(%rbp)
	movw	%ax, -40(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	subl	$1, -36(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L2
.L13:
	cmpl	$0, -16(%rbp)
	je	.L3
	movl	$0, -12(%rbp)
	jmp	.L4
.L5:
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	-20(%rbp), %ecx
	movl	-12(%rbp), %edx
	addq	%rdx, %rcx
	movq	-48(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
.L4:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jb	.L5
	movl	-20(%rbp), %edx
	movl	-12(%rbp), %eax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movb	$44, (%rax)
	movl	-16(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
.L3:
	movzwl	-40(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -40(%rbp)
	movswl	-40(%rbp), %eax
	andl	$7, %eax
	cmpl	$7, %eax
	je	.L6
	cmpl	$7, %eax
	jg	.L17
	cmpl	$6, %eax
	jg	.L17
	cmpl	$5, %eax
	jge	.L8
	cmpl	$2, %eax
	jg	.L9
	testl	%eax, %eax
	jns	.L10
	jmp	.L17
.L9:
	subl	$3, %eax
	cmpl	$1, %eax
	ja	.L17
	jmp	.L16
.L10:
	movzwl	-40(%rbp), %eax
	sarw	$3, %ax
	cwtl
	andl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	intpat(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$4, -16(%rbp)
	jmp	.L2
.L16:
	movzwl	-40(%rbp), %eax
	sarw	$3, %ax
	cwtl
	andl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	floatpat(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$8, -16(%rbp)
	jmp	.L2
.L8:
	movzwl	-40(%rbp), %eax
	sarw	$3, %ax
	cwtl
	andl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	scipat(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$8, -16(%rbp)
	jmp	.L2
.L6:
	movzwl	-40(%rbp), %eax
	sarw	$3, %ax
	cwtl
	andl	$3, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	errpat(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$8, -16(%rbp)
	jmp	.L2
.L17:
	nop
.L2:
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	addl	$1, %eax
	cmpl	-36(%rbp), %eax
	jb	.L13
	addl	$1, -36(%rbp)
	jmp	.L14
.L15:
	movl	-20(%rbp), %edx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$1, -20(%rbp)
.L14:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jb	.L15
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_init_state, .-core_init_state
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
