	.globl	fib                             # -- Begin function fib
	.type	fib,@function
fib:                                    # @fib
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	cmpl	$1, -8(%rbp)
	jg	.LBB0_2
# %bb.1:
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_3
.LBB0_2:
	movl	-8(%rbp), %edi
	subl	$1, %edi
	callq	fib
	movl	%eax, -12(%rbp)                 # 4-byte Spill
	movl	-8(%rbp), %edi
	subl	$2, %edi
	callq	fib
	movl	%eax, %ecx
	movl	-12(%rbp), %eax                 # 4-byte Reload
	addl	%ecx, %eax
	movl	%eax, -4(%rbp)
.LBB0_3:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	fib, .Lfunc_end0-fib
