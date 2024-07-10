	.globl	retPosVector            # -- Begin function retPosVector
retPosVector:                           # @retPosVector
	pushq	%rbp
	movq	%rsp, %rbp
	movb	%dil, -5(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpb	$0, (%rax,%rcx)
	je	.LBB0_6
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	movsbl	-5(%rbp), %esi
	cmpl	%esi, %edx
	jne	.LBB0_4
# %bb.3:
	movl	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_6
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_5
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_1
.LBB0_6:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
