.globl TLAString_toDouble
.type TLAString_toDouble, @function
TLAString_toDouble:
.LFB23:
	.cfi_startproc
	endbr64
	movzbl	(%rdi), %ecx
	leal	-43(%rcx), %edx
	movsbl	%cl, %eax
	andl	$253, %edx
	jne	.L2
	movsbl	1(%rdi), %eax
	addq	$1, %rdi
.L2:
	pxor	%xmm0, %xmm0
	testb	%al, %al
	je	.L3
	cmpb	$46, %al
	je	.L3
	movsd	.LC2(%rip), %xmm4
	movss	.LC3(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm1, %xmm1
	movapd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	addq	$1, %rdi
	cvtsi2ssl	%eax, %xmm1
	mulsd	%xmm4, %xmm2
	movsbl	(%rdi), %eax
	subss	%xmm3, %xmm1
	cvtss2sd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	testb	%al, %al
	je	.L3
	cmpb	$46, %al
	jne	.L4
.L25:
	movsbl	1(%rdi), %eax
	leaq	1(%rdi), %rdx
	testb	%al, %al
	je	.L6
	movss	.LC1(%rip), %xmm4
	movss	.LC3(%rip), %xmm3
	movaps	%xmm4, %xmm2
	.p2align 4,,10
	.p2align 3
.L7:
	pxor	%xmm1, %xmm1
	addq	$1, %rdx
	cvtsi2ssl	%eax, %xmm1
	movsbl	(%rdx), %eax
	subss	%xmm3, %xmm1
	divss	%xmm2, %xmm1
	mulss	%xmm4, %xmm2
	cvtss2sd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	testb	%al, %al
	jne	.L7
.L6:
	cmpb	$45, %cl
	je	.L28
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$46, %al
	je	.L25
	cmpb	$45, %cl
	jne	.L1
.L28:
	xorpd	.LC4(%rip), %xmm0
	ret
	.cfi_endproc
.LC4: 	.long	0
.LC2: 	.long	0
.LC3: 	.long	1111490560
.LC1: 	.long	1092616192