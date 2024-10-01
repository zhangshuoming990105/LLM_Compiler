
	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)    # i = 0
	movl	$0, -8(%rbp)    # c = 0
	jmp	.L2
.L5:
	movl	-4(%rbp), %eax  # eax = i
	movl	$4, %ecx
	cltd
	idivl	%ecx           # edx = i % 4
	cmpl	$0, %edx
	jne	.L3
	addl	$1, -8(%rbp)    # c = c + 1
.L3:
	movl	-4(%rbp), %eax  # eax = i
	movl	$4, %ecx
	cltd
	idivl	%ecx           # edx = i % 4
	cmpl	$1, %edx
	jne	.L4
	addl	$100, -8(%rbp)  # c = c + 100
.L4:
	movl	-4(%rbp), %eax  # eax = i
	movl	$4, %ecx
	cltd
	idivl	%ecx           # edx = i % 4
	cmpl	$2, %edx
	jne	.L6              # Jump to else block if i % 4 != 2
	addl	$10000, -8(%rbp) # c = c + 10000
	jmp	.L7              # Skip the else block
.L6:
	addl	$1000000, -8(%rbp) # c = c + 1000000
.L7:
	addl	$1, -4(%rbp)    # i = i + 1
.L2:
	cmpl	$99, -4(%rbp)   # compare i with 99
	jle	.L5
	movl	-8(%rbp), %eax  # return c
	leave
	ret
