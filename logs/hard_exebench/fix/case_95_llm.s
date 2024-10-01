
	.text
	.globl	qcs_numbase_d2int
	.type	qcs_numbase_d2int, @function
qcs_numbase_d2int:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)  # Store the input character in -4(%rbp)
	movl	-4(%rbp), %eax  # Load the input character into %eax
	cmpl	$48, %eax       # Compare with '0' (ASCII 48)
	jl	.L2              # Jump to .L2 if less than '0'
	cmpl	$57, %eax       # Compare with '9' (ASCII 57)
	jg	.L2              # Jump to .L2 if greater than '9'
	subl	$48, %eax       # Subtract 48 to convert to integer
	jmp	.L3              # Jump to .L3 to return the result
.L2:
	movl	-4(%rbp), %eax  # Load the input character into %eax
	cmpl	$97, %eax       # Compare with 'a' (ASCII 97)
	jl	.L4              # Jump to .L4 if less than 'a'
	cmpl	$122, %eax      # Compare with 'z' (ASCII 122)
	jg	.L4              # Jump to .L4 if greater than 'z'
	subl	$87, %eax       # Subtract 87 to convert to integer (10 + 'a' - 'a')
	jmp	.L3              # Jump to .L3 to return the result
.L4:
	movl	-4(%rbp), %eax  # Load the input character into %eax
	cmpl	$65, %eax       # Compare with 'A' (ASCII 65)
	jl	.L5              # Jump to .L5 if less than 'A'
	cmpl	$90, %eax       # Compare with 'Z' (ASCII 90)
	jg	.L5              # Jump to .L5 if greater than 'Z'
	subl	$55, %eax       # Subtract 55 to convert to integer (10 + 'A' - 'A')
	jmp	.L3              # Jump to .L3 to return the result
.L5:
	movl	$0, %eax        # Return 0 for any other characters
.L3:
	popq	%rbp
	ret
