
	.text
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)  # Store 'a' in -24(%rbp)
	movq	%rsi, -32(%rbp)  # Store 'b' in -32(%rbp)
	movl	$1, -4(%rbp)     # Initialize 'd' to 1
	movl	$1, -8(%rbp)     # Initialize 'i' to 1
	jmp	.L2
.L4:
	movl	-8(%rbp), %eax  # Load 'i' into %eax
	movslq	%eax, %rdx      # Sign-extend 'i' to 64-bit
	movq	-24(%rbp), %rax # Load 'a' into %rax
	cqto                   # Sign-extend %rax to %rdx:%rax
	idivq	%rdx            # Divide %rdx:%rax by 'i'
	movq	%rdx, %rax      # Move remainder to %rax
	testq	%rax, %rax      # Check if remainder is 0
	jne	.L3              # If not, skip to .L3
	movl	-8(%rbp), %eax  # Load 'i' into %eax
	movslq	%eax, %rdx      # Sign-extend 'i' to 64-bit
	movq	-32(%rbp), %rax # Load 'b' into %rax
	cqto                   # Sign-extend %rax to %rdx:%rax
	idivq	%rdx            # Divide %rdx:%rax by 'i'
	movq	%rdx, %rax      # Move remainder to %rax
	testq	%rax, %rax      # Check if remainder is 0
	jne	.L3              # If not, skip to .L3
	movl	-8(%rbp), %eax  # Load 'i' into %eax
	movl	%eax, -4(%rbp)   # Update 'd' to 'i'
.L3:
	addl	$1, -8(%rbp)     # Increment 'i' by 1
.L2:
	movl	-8(%rbp), %eax  # Load 'i' into %eax
	cltq                   # Sign-extend %eax to 64-bit
	cmpq	-24(%rbp), %rax # Compare 'i' with 'a'
	jg	.L5              # If 'i' > 'a', jump to .L5
	movl	-8(%rbp), %eax  # Load 'i' into %eax
	cltq                   # Sign-extend %eax to 64-bit
	cmpq	-32(%rbp), %rax # Compare 'i' with 'b'
	jle	.L4             # If 'i' <= 'b', jump to .L4
.L5:
	movl	-4(%rbp), %eax  # Load 'd' into %eax
	popq	%rbp
	ret
