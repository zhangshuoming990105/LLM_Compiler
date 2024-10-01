
	.text
	.globl	duplisearch
	.type	duplisearch, @function
duplisearch:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)  # A
	movl	%esi, -28(%rbp)  # n
	movl	%edx, -32(%rbp)  # target
	movl	$0, -4(%rbp)     # left = 0
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)   # right = n - 1
	cmpl	$1, -28(%rbp)
	jg	.L2               # if (n < 2)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-32(%rbp), %eax
	jne	.L3               # if (A[0] == target)
	movl	$0, %eax
	jmp	.L4
.L3:
	movl	$-1, %eax
	jmp	.L4
.L2:
	jmp	.L5
.L10:
	movl	-8(%rbp), %eax
	addl	-4(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -12(%rbp)  # tmp = (right + left) / 2
	movq	-24(%rbp), %rax
	movslq	-12(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	-32(%rbp), %eax
	jne	.L6               # if (A[tmp] == target)
	movl	-12(%rbp), %eax
	jmp	.L4
.L6:
	movq	-24(%rbp), %rax
	movslq	-12(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	-4(%rbp), %eax
	jle	.L7               # if (A[tmp] > A[left])
	movq	-24(%rbp), %rax
	movslq	-12(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	-32(%rbp), %eax
	jle	.L8               # if (A[tmp] > target && A[left] <= target)
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	-32(%rbp), %eax
	jg	.L8               # if (A[left] > target)
	movl	-12(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)   # right = tmp - 1
	jmp	.L5
.L8:
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)   # left = tmp
	jmp	.L5
.L7:
	movq	-24(%rbp), %rax
	movslq	-12(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	-32(%rbp), %eax
	jge	.L9               # if (A[tmp] < target && target <= A[right])
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	-32(%rbp), %eax
	jl	.L9               # if (A[right] < target)
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)   # left = tmp + 1
	jmp	.L5
.L9:
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)   # right = tmp
	jmp	.L5
.L11:
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)   # left++
.L5:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L10              # while (left <= right)
	movl	$-1, %eax
.L4:
	popq	%rbp
	ret
