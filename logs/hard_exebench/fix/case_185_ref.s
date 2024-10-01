.globl Fare_d
.type Fare_d, @function
Fare_d:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	cmpl	$30, -20(%rbp)
	jg	.L2
	movl	$130, %eax
	jmp	.L3
.L2:
	cmpl	$60, -20(%rbp)
	jg	.L4
	movl	$150, %eax
	jmp	.L3
.L4:
	cmpl	$100, -20(%rbp)
	jg	.L5
	movl	$160, %eax
	jmp	.L3
.L5:
	cmpl	$3000, -20(%rbp)
	jle	.L6
	movl	$-1, %eax
	jmp	.L3
.L6:
	cmpl	$1000, -20(%rbp)
	jle	.L7
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$6, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$200, %eax, %eax
	addl	$100, %eax
	movl	%eax, -4(%rbp)
	jmp	.L8
.L7:
	cmpl	$500, -20(%rbp)
	jle	.L9
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	addl	$50, %eax
	movl	%eax, -4(%rbp)
	jmp	.L8
.L9:
	cmpl	$100, -20(%rbp)
	jle	.L8
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$4, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$50, %eax, %eax
	addl	$30, %eax
	movl	%eax, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	imull	$1325, %eax, %eax
	movl	%eax, -8(%rbp)
	cmpl	$1000, -4(%rbp)
	jg	.L10
	movl	-8(%rbp), %eax
	addl	$9999, %eax
	movslq	%eax, %rdx
	imulq	$1759218605, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$12, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -8(%rbp)
	jmp	.L11
.L10:
	movl	-8(%rbp), %eax
	addl	$50000, %eax
	movslq	%eax, %rdx
	imulq	$351843721, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$13, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	movl	%eax, -8(%rbp)
.L11:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$3, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$5, %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

