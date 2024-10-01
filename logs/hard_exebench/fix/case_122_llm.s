
	.text
	.globl	vowel
	.type	vowel, @function
vowel:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)  # Store the address of the input array in -24(%rbp)
	movl	$0, -4(%rbp)     # Initialize count to 0

	movq	-24(%rbp), %rax  # Load the address of the input array into %rax
	movq	%rax, -16(%rbp)  # Store the address in -16(%rbp) for iteration

.L2:
	movq	-16(%rbp), %rax  # Load the current address of the character into %rax
	movzbl	(%rax), %eax     # Load the current character into %eax
	testb	%al, %al         # Check if the character is '\0' (end of string)
	je	.L4               # If it is, jump to .L4 to exit the loop

	# Compare the current character with each vowel
	cmpb	$97, %al         # 'a'
	je	.L3
	cmpb	$65, %al         # 'A'
	je	.L3
	cmpb	$101, %al        # 'e'
	je	.L3
	cmpb	$69, %al         # 'E'
	je	.L3
	cmpb	$105, %al        # 'i'
	je	.L3
	cmpb	$73, %al         # 'I'
	je	.L3
	cmpb	$111, %al        # 'o'
	je	.L3
	cmpb	$79, %al         # 'O'
	je	.L3
	cmpb	$117, %al        # 'u'
	je	.L3
	cmpb	$85, %al         # 'U'
	jne	.L5

.L3:
	addl	$1, -4(%rbp)     # Increment count if a vowel is found

.L5:
	addq	$1, -16(%rbp)    # Move to the next character in the string
	jmp	.L2               # Jump back to the start of the loop

.L4:
	movl	-4(%rbp), %eax   # Move the count to %eax to return it
	popq	%rbp
	ret
