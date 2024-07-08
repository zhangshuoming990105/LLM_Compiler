	.text
	.globl	big_endian              # -- Begin function big_endian
big_endian:                             # @big_endian
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$1, -8(%rbp)
	movsbl	-1(%rbp), %eax
	cmpl	$1, %eax
	sete	%cl
	andb	$1, %cl
	movzbl	%cl, %eax
	popq	%rbp
	retq
