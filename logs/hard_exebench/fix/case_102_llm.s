
	.text
	.globl	WanNum
	.type	WanNum, @function
WanNum:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, -20(%rbp)  # Store the input argument n
	movl	$0, -8(%rbp)     # Initialize tmp to 0
	movl	$1, -4(%rbp)     # Initialize i to 1
	jmp	.L2
.L4:
	movl	-4(%rbp), %eax  # Load i into %eax
	cltd                   # Sign-extend %eax into %edx:%eax
	idivl	-20(%rbp)       # Divide %eax by n, remainder in %edx
	movl	%edx, %eax      # Move the remainder (mod result) into %eax
	testl	%eax, %eax      # Test if the remainder is 0
	jne	.L3              # If not zero, skip the addition
	movl	-4(%rbp), %eax  # Load i into %eax
	addl	%eax, -8(%rbp)  # Add i to tmp
.L3:
	addl	$1, -4(%rbp)     # Increment i
.L2:
	movl	-4(%rbp), %eax  # Load i into %eax
	cmpl	-20(%rbp), %eax # Compare i with n
	jl	.L4              # If i < n, continue the loop
	movl	-8(%rbp), %eax  # Load tmp into %eax
	cmpl	-20(%rbp), %eax # Compare tmp with n
	jne	.L5              # If tmp != n, jump to .L5
	movl	$1, %eax        # Return 1 if tmp == n
	jmp	.L6
.L5:
	movl	$0, %eax        # Return 0 if tmp != n
.L6:
	leave
	ret
