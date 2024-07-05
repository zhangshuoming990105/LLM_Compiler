	.text
	.globl	quant
	.type	quant, @function
quant:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.L2
	addl	$1, -4(%rbp)
	negl	-20(%rbp)
.L2:
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%eax, -8(%rbp)
	movl	-24(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	-20(%rbp), %edx
	subl	%eax, %edx
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	cmpl	%eax, %edx
	jle	.L3
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	%eax, -8(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L4
	negl	-8(%rbp)
.L4:
	movl	-8(%rbp), %eax
	popq	%rbp
	ret