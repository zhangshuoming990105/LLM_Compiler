	.text
	.globl	CgosStrLen
CgosStrLen:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L5
	movl	$0, %eax
	jmp	.L3
.L5:
	nop
.L4:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L4
	movq	-24(%rbp), %rax
	subq	-8(%rbp), %rax
	subl	$1, %eax
.L3:
	popq	%rbp
	ret
