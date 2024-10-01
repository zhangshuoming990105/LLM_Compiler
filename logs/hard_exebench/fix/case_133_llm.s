
	.text
	.globl	mySqrt
	.type	mySqrt, @function
mySqrt:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)  # Store the input x
	movl	$1, -4(%rbp)     # Initialize i to 1
	movl	$0, -8(%rbp)     # Initialize sum to 0
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax   # Load i
	addl	%eax, %eax       # i * 2
	subl	$1, %eax         # i * 2 - 1
	addl	%eax, -8(%rbp)   # sum += i * 2 - 1
	addl	$1, -4(%rbp)     # i++
.L2:
	movl	-8(%rbp), %eax   # Load sum
	cmpl	-20(%rbp), %eax  # Compare sum with x
	jl	.L3               # If sum < x, continue the loop
.L4:
	movl	-8(%rbp), %eax   # Load sum
	cmpl	-20(%rbp), %eax  # Compare sum with x
	jne	.L5               # If sum != x, jump to .L5
	movl	-4(%rbp), %eax   # Load i
	jmp	.L6               # Return i
.L5:
	movl	-4(%rbp), %eax   # Load i
	subl	$1, %eax         # i - 1
.L6:
	popq	%rbp
	ret
