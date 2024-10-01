
	.text
	.globl	findLongest1s
	.type	findLongest1s, @function
findLongest1s:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -36(%rbp)  # x = edi
	movl	$0, -4(%rbp)     # longest = 0
	movl	$0, -8(%rbp)     # l1 = 0
	movl	$0, -12(%rbp)    # l2 = 0
	movl	$32, -16(%rbp)   # size = 32 (8 * sizeof(int))
	movl	$0, -20(%rbp)    # k = 0
	jmp	.L2
.L4:
	movl	-36(%rbp), %eax  # eax = x
	movl	-20(%rbp), %ecx  # ecx = k
	sarl	%cl, %eax        # eax = x >> k
	andl	$1, %eax         # eax = (x >> k) & 0x1
	testl	%eax, %eax       # check if (x >> k) & 0x1 is 0
	je	.L3               # if zero, jump to .L3
	addl	$1, -8(%rbp)     # l1++
	addl	$1, -20(%rbp)    # k++
	jmp	.L4               # continue the loop
.L3:
	movl	-8(%rbp), %eax   # eax = l1
	addl	-12(%rbp), %eax  # eax = l1 + l2
	cmpl	-4(%rbp), %eax   # compare (l1 + l2) with longest
	jle	.L5               # if (l1 + l2) <= longest, jump to .L5
	movl	%eax, -4(%rbp)   # longest = l1 + l2
.L5:
	movl	-8(%rbp), %eax   # eax = l1
	movl	%eax, -12(%rbp)  # l2 = l1
	movl	$0, -8(%rbp)     # l1 = 0
	movl	-36(%rbp), %eax  # eax = x
	movl	-20(%rbp), %ecx  # ecx = k
	sarl	%cl, %eax        # eax = x >> k
	andl	$1, %eax         # eax = (x >> k) & 0x1
	testl	%eax, %eax       # check if (x >> k) & 0x1 is 0
	je	.L8               # if zero, jump to .L8
	movl	-36(%rbp), %eax  # eax = x
	movl	-20(%rbp), %ecx  # ecx = k
	leal	1(%rcx), %ecx    # ecx = k + 1
	sarl	%cl, %eax        # eax = x >> (k + 1)
	andl	$1, %eax         # eax = (x >> (k + 1)) & 0x1
	testl	%eax, %eax       # check if (x >> (k + 1)) & 0x1 is 0
	jne	.L7               # if not zero, jump to .L7
	movl	$0, -12(%rbp)    # l2 = 0
	addl	$1, -20(%rbp)    # k++
	jmp	.L8               # jump to .L8
.L7:
	cmpl	$0, -12(%rbp)    # compare l2 with 0
	je	.L8               # if l2 == 0, jump to .L8
	addl	$1, -8(%rbp)     # l1++
.L8:
	addl	$1, -20(%rbp)    # k++
.L2:
	movl	-20(%rbp), %eax  # eax = k
	cmpl	-16(%rbp), %eax  # compare k with size
	jl	.L4               # if k < size, jump to .L4
	movl	-4(%rbp), %eax   # eax = longest
	leave
	ret
.LFE0:
	.size	findLongest1s, .-findLongest1s
