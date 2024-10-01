
	.text
	.globl	Fare_d
	.type	Fare_d, @function
Fare_d:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)  # Store km in local variable

	# Check if km <= 30
	cmpl	$30, -4(%rbp)
	jg	.L2
	movl	$130, %eax
	jmp	.L11

.L2:
	# Check if km <= 60
	cmpl	$60, -4(%rbp)
	jg	.L3
	movl	$150, %eax
	jmp	.L11

.L3:
	# Check if km <= 100
	cmpl	$100, -4(%rbp)
	jg	.L4
	movl	$160, %eax
	jmp	.L11  # Return immediately after setting %eax to 160

.L4:
	# Check if km > 3000
	cmpl	$3000, -4(%rbp)
	jle	.L5
	movl	$-1, %eax
	jmp	.L11

.L5:
	# Check if km > 1000
	cmpl	$1000, -4(%rbp)
	jle	.L6
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	$200, %ecx
	cltd
	idivl	%ecx
	imull	$200, %eax, %eax
	addl	$100, %eax
	movl	%eax, -8(%rbp)  # Store c_km in local variable
	jmp	.L7

.L6:
	# Check if km > 500
	cmpl	$500, -4(%rbp)
	jle	.L8
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	$100, %ecx
	cltd
	idivl	%ecx
	imull	$100, %eax, %eax
	addl	$50, %eax
	movl	%eax, -8(%rbp)  # Store c_km in local variable
	jmp	.L7

.L8:
	# Check if km > 100
	cmpl	$100, -4(%rbp)
	jle	.L9
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	$50, %ecx
	cltd
	idivl	%ecx
	imull	$50, %eax, %eax
	addl	$30, %eax
	movl	%eax, -8(%rbp)  # Store c_km in local variable
	jmp	.L7

.L9:
	# Default case
	movl	$0, -8(%rbp)  # Store c_km in local variable

.L7:
	# Calculate fare = 1325 * c_km
	movl	-8(%rbp), %eax
	imull	$1325, %eax, %eax
	movl	%eax, -12(%rbp)  # Store fare in local variable

	# Check if c_km <= 1000
	cmpl	$1000, -8(%rbp)
	jg	.L10
	movl	-12(%rbp), %eax
	addl	$9999, %eax
	movl	$10000, %ecx
	cltd
	idivl	%ecx
	imull	$10, %eax, %eax
	movl	%eax, -12(%rbp)  # Update fare
	jmp	.L11

.L10:
	# Calculate fare = (fare + 50000) / 100000 * 100
	movl	-12(%rbp), %eax
	addl	$50000, %eax
	movl	$100000, %ecx
	cltd
	idivl	%ecx
	imull	$100, %eax, %eax
	movl	%eax, -12(%rbp)  # Update fare

.L11:
	# Calculate final fare
	movl	-12(%rbp), %eax
	imull	$1000, %eax, %edx
	movl	$100000, %eax
	cltd
	idivl	%eax
	movl	%edx, %eax
	addl	$5, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	imull	$10, %eax, %eax
	addl	-12(%rbp), %eax

	popq	%rbp
	ret
