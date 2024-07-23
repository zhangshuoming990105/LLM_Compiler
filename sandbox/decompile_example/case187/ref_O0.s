.globl TLAString_toDouble
.type TLAString_toDouble, @function
TLAString_toDouble:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -13(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	cmpb	$45, -13(%rbp)
	je	.L2
	cmpb	$43, -13(%rbp)
	jne	.L4
.L2:
	addq	$1, -24(%rbp)
	jmp	.L4
.L6:
	movsd	-8(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cvtsi2ssl	%eax, %xmm0
	movss	.LC2(%rip), %xmm2
	subss	%xmm2, %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addq	$1, -24(%rbp)
.L4:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L5
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L6
.L5:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$46, %al
	jne	.L7
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	addq	$1, -24(%rbp)
	jmp	.L8
.L9:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cvtsi2ssl	%eax, %xmm0
	movss	.LC2(%rip), %xmm1
	subss	%xmm1, %xmm0
	divss	-12(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movss	-12(%rbp), %xmm1
	movss	.LC3(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	addq	$1, -24(%rbp)
.L8:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L9
.L7:
	cmpb	$45, -13(%rbp)
	jne	.L10
	movsd	-8(%rbp), %xmm0
	movq	.LC4(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
.L10:
	movsd	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LC4: 	.long	0
.LC2: 	.long	1111490560
.LC3: 	.long	1092616192
.LC1: 	.long	0