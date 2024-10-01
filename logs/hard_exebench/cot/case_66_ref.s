.globl findLongest1s
.type findLongest1s, @function
findLongest1s:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$32, -4(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L2
.L4:
	addl	$1, -12(%rbp)
	addl	$1, -20(%rbp)
.L3:
	movl	-20(%rbp), %eax
	movl	-36(%rbp), %edx
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L4
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -16(%rbp)
	jge	.L5
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%rbp)
.L5:
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	$0, -12(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L6
	addl	$1, -12(%rbp)
.L6:
	addl	$1, -20(%rbp)
.L2:
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L3
	movl	-16(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

