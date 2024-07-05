	.text
	.globl	quant
	.type	quant, @function
quant:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp  # Allocate space for local variables

	# Store parameters n and m in stack
	movl	%edi, -4(%rbp)  # n
	movl	%esi, -8(%rbp)  # m

	# Initialize neg to 0
	movl	$0, -12(%rbp)  # neg

	# if (n < 0)
	movl	-4(%rbp), %eax  # Load n into %eax
	testl	%eax, %eax
	jge	.L2  # Jump if n >= 0

	# neg = neg + 1
	addl	$1, -12(%rbp)  # neg++

	# n = -n
	negl	%eax
	movl	%eax, -16(%rbp)  # n_0 = -n
	jmp	.L3

.L2:
	movl	-4(%rbp), %eax
	movl	%eax, -16(%rbp)  # n_0 = n

.L3:
	# i_0 = n_0 / m
	movl	-16(%rbp), %eax  # Load n_0 into %eax
	cltd
	idivl	-8(%rbp)  # Divide by m
	movl	%eax, -20(%rbp)  # i_0 = n_0 / m

	# temp8_0 = n_0 - (m * i_0)
	movl	-8(%rbp), %eax  # Load m into %eax
	imull	-20(%rbp), %eax  # Multiply by i_0
	movl	-16(%rbp), %edx  # Load n_0 into %edx
	subl	%eax, %edx  # n_0 - (m * i_0)
	movl	%edx, -24(%rbp)  # temp8_0

	# temp9_0 = m / 2
	movl	-8(%rbp), %eax  # Load m into %eax
	shrl	$1, %eax  # Divide by 2
	movl	%eax, -28(%rbp)  # temp9_0

	# if (temp8_0 > temp9_0)
	movl	-24(%rbp), %eax  # Load temp8_0 into %eax
	cmpl	-28(%rbp), %eax  # Compare with temp9_0
	jle	.L4  # Jump if temp8_0 <= temp9_0

	# i_1 = i_0 + 1
	movl	-20(%rbp), %eax  # Load i_0 into %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)  # i_1 = i_0 + 1
	jmp	.L5

.L4:
	movl	-20(%rbp), %eax
	movl	%eax, -32(%rbp)  # i_1 = i_0

.L5:
	# i_2 = i_1 * m
	movl	-32(%rbp), %eax  # Load i_1 into %eax
	imull	-8(%rbp), %eax  # Multiply by m
	movl	%eax, -36(%rbp)  # i_2 = i_1 * m

	# if (neg_0)
	movl	-12(%rbp), %eax  # Load neg_0 into %eax
	testl	%eax, %eax
	je	.L6  # Jump if neg_0 == 0

	# i_3 = -i_2
	movl	-36(%rbp), %eax  # Load i_2 into %eax
	negl	%eax
	movl	%eax, -40(%rbp)  # i_3 = -i_2
	jmp	.L7

.L6:
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)  # i_3 = i_2

.L7:
	# Return i_3
	movl	-40(%rbp), %eax  # Load i_3 into %eax

	leave
	ret
