	.file	"matmul.c"
	.text
	.globl	matmul4
	.type	matmul4, @function
matmul4:
.LFB5041:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	%rcx, -112(%rbp)
	movl	-84(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	%rax, -24(%rbp)
	movl	-84(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	%rax, -32(%rbp)
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L7:
	movl	$0, -8(%rbp)
	jmp	.L3
.L6:
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, -80(%rbp)
	vmovdqa	%xmm0, -64(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L4
.L5:
#APP
# 71 "matmul.c" 1
	pajigtnuep
	
# 0 "" 2
#NO_APP
	addl	$8, -12(%rbp)
.L4:
	movl	-12(%rbp), %edx
	cmpl	-84(%rbp), %edx
	jl	.L5
	vmovss	-80(%rbp), %xmm1
	vmovss	-76(%rbp), %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	-72(%rbp), %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	-68(%rbp), %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	-64(%rbp), %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	-60(%rbp), %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	-56(%rbp), %xmm0
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	-52(%rbp), %xmm0
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	imulq	%rcx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-112(%rbp), %rdx
	addq	%rdx, %rcx
	vaddss	%xmm0, %xmm1, %xmm0
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	vmovss	%xmm0, (%rcx,%rdx,4)
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %edx
	cmpl	-84(%rbp), %edx
	jl	.L6
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %edx
	cmpl	-84(%rbp), %edx
	jl	.L7
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5041:
	.size	matmul4, .-matmul4
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
