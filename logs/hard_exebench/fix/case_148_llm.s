
	.text
	.globl	median3
	.type	median3, @function
median3:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movss	%xmm0, -20(%rbp)  # Store yy
	movss	%xmm1, -24(%rbp)  # Store kaa
	movss	%xmm2, -28(%rbp)  # Store koo
	movss	-20(%rbp), %xmm0
	movss	%xmm0, -48(%rbp)  # array[0] = yy
	movss	-24(%rbp), %xmm0
	movss	%xmm0, -44(%rbp)  # array[1] = kaa
	movss	-28(%rbp), %xmm0
	movss	%xmm0, -40(%rbp)  # array[2] = koo
	movl	$0, -4(%rbp)      # j = 0
	jmp	.L2
.L5:
	movl	$0, -8(%rbp)      # i = 0
	jmp	.L3
.L4:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0     # array[i]
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1     # array[i+1]
	comiss	%xmm1, %xmm0
	jbe	.L3                # if array[i] <= array[i+1], skip swap
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0     # tmp = array[i]
	movss	%xmm0, -12(%rbp)
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0     # array[i+1]
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	%xmm0, (%rax)     # array[i] = array[i+1]
	movss	-12(%rbp), %xmm0
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	%xmm0, (%rax)     # array[i+1] = tmp
.L3:
	addl	$1, -8(%rbp)      # i++
.L2:
	movl	-4(%rbp), %eax
	leal	-2(%rax), %edx
	movl	-8(%rbp), %eax
	cmpl	%eax, %edx
	jg	.L4                # if i < 3-1-j, continue inner loop
	addl	$1, -4(%rbp)      # j++
.L6:
	cmpl	$1, -4(%rbp)
	jle	.L5                # if j <= 1, continue outer loop
	movss	-44(%rbp), %xmm0  # return array[1]
	leave
	ret
	.size	median3, .-median3
