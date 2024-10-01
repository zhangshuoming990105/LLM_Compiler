.globl mySqrt
.type mySqrt, @function
mySqrt:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$1, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L4:
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jge	.L3
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	subl	$1, %eax
	addl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L4
.L3:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	je	.L5
	movl	-8(%rbp), %eax
	subl	$1, %eax
	jmp	.L7
.L5:
	movl	-8(%rbp), %eax
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

