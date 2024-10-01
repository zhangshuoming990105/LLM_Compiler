
	.text
	.globl	get_gap_qual
	.type	get_gap_qual, @function
get_gap_qual:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, -4(%rbp)  # score_sum = 0
	movl	$0, -8(%rbp)  # weight_sum = 0
	movl	$1, -12(%rbp) # weight = 1
	movl	$0, -16(%rbp) # i = 0
	jmp	.L2
.L5:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	je	.L3
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	imull	-12(%rbp), %eax
	addl	%eax, -4(%rbp)  # score_sum += window[i] * weight
	movl	-12(%rbp), %eax
	addl	%eax, -8(%rbp)  # weight_sum += weight
.L3:
	cmpl	$3, -16(%rbp)  # if (i < 4 - 1)
	jge	.L4
	addl	$1, -12(%rbp)  # weight++
	jmp	.L2
.L4:
	cmpl	$3, -16(%rbp)  # if (i > 4 - 1)
	jle	.L2
	subl	$1, -12(%rbp)  # weight--
.L2:
	cmpl	$8, -16(%rbp)  # if (i < 4*2)
	jge	.L6
	addl	$1, -16(%rbp)  # i++
	jmp	.L5
.L6:
	cmpl	$0, -8(%rbp)  # if (weight_sum > 0)
	jle	.L7
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)  # score_sum / weight_sum
	movsbl	%al, %eax
	jmp	.L8
.L7:
	movl	$0, %eax  # return '\0'
.L8:
	leave
	ret
