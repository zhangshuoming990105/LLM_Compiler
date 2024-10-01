.globl vowel
.type vowel, @function
vowel:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	cmpq	$97, -24(%rbp)
	je	.L2
	cmpq	$65, -24(%rbp)
	je	.L2
	cmpq	$101, -24(%rbp)
	je	.L2
	cmpq	$69, -24(%rbp)
	je	.L2
	cmpq	$105, -24(%rbp)
	je	.L2
	cmpq	$73, -24(%rbp)
	je	.L2
	cmpq	$111, -24(%rbp)
	je	.L2
	cmpq	$79, -24(%rbp)
	je	.L2
	cmpq	$117, -24(%rbp)
	je	.L2
	cmpq	$85, -24(%rbp)
	jne	.L3
.L2:
	addl	$1, -4(%rbp)
.L3:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

