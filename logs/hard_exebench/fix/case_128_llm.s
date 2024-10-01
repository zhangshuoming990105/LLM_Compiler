
	.text
	.globl	my_strncmp
	.type	my_strncmp, @function
my_strncmp:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)  # Store str1
	movq	%rsi, -32(%rbp)  # Store str2
	movl	%edx, -36(%rbp)  # Store n
	movl	$-1, -4(%rbp)    # Initialize i to -1
	jmp	.L2
.L3:
	addl	$1, -4(%rbp)     # Increment i
.L2:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax     # Load str1[i]
	testb	%al, %al        # Check if str1[i] is '\0'
	je	.L4
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax  # Compare i with n
	jge	.L4
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx     # Load str1[i]
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax     # Load str2[i]
	cmpb	%al, %dl         # Compare str1[i] with str2[i]
	je	.L3
.L4:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx     # Load str1[i]
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax     # Load str2[i]
	subl	%eax, %edx       # Compute str1[i] - str2[i]
	movl	%edx, %eax
	testl	%eax, %eax       # Check if the result is negative, zero, or positive
	jns	.L5
	movl	$-1, %eax        # Return -1 if str1[i] < str2[i]
	jmp	.L6
.L5:
	cmpl	$0, %eax         # Check if the result is positive
	jg	.L8
	movl	$0, %eax         # Return 0 if str1[i] == str2[i]
	jmp	.L6
.L8:
	movl	$1, %eax         # Return 1 if str1[i] > str2[i]
.L6:
	popq	%rbp
	ret
