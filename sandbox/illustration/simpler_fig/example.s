	.text
	.file	"example.c"
	.globl	cross_point                     # -- Begin function cross_point
	.p2align	4, 0x90
	.type	cross_point,@function
cross_point:                            # @cross_point
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movlpd	%xmm0, -24(%rbp)
	movlpd	%xmm1, -16(%rbp)
	movlpd	%xmm2, -40(%rbp)
	movlpd	%xmm3, -32(%rbp)
	movss	-20(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-12(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm0
	movss	%xmm0, -44(%rbp)
	movss	-24(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-16(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm0
	movss	%xmm0, -48(%rbp)
	movss	-16(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-24(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-20(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-12(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	mulss	%xmm3, %xmm1
	mulss	%xmm2, %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, -52(%rbp)
	movss	-36(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-28(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm0
	movss	%xmm0, -56(%rbp)
	movss	-40(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-32(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm0
	movss	%xmm0, -60(%rbp)
	movss	-32(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-40(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-36(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-28(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	mulss	%xmm3, %xmm1
	mulss	%xmm2, %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, -64(%rbp)
	movss	-44(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-60(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-56(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-48(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	mulss	%xmm3, %xmm1
	mulss	%xmm2, %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, -68(%rbp)
	movss	-48(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-64(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-60(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	mulss	%xmm3, %xmm1
	mulss	%xmm2, %xmm0
	subss	%xmm1, %xmm0
	movss	-68(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-56(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	-52(%rbp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	movss	-44(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-64(%rbp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	mulss	%xmm3, %xmm1
	mulss	%xmm2, %xmm0
	subss	%xmm1, %xmm0
	movss	-68(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	divss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	cross_point, .Lfunc_end0-cross_point
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movl	$0, -4(%rbp)
	movups	.L__const.main.l1(%rip), %xmm0
	movaps	%xmm0, -32(%rbp)
	movups	.L__const.main.l2(%rip), %xmm0
	movaps	%xmm0, -48(%rbp)
	movsd	-32(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	-24(%rbp), %xmm1                # xmm1 = mem[0],zero
	movsd	-48(%rbp), %xmm2                # xmm2 = mem[0],zero
	movsd	-40(%rbp), %xmm3                # xmm3 = mem[0],zero
	callq	cross_point
	movlpd	%xmm0, -56(%rbp)
	movss	-56(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movss	-52(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	cvtss2sd	%xmm1, %xmm1
	leaq	.L.str(%rip), %rdi
	movb	$2, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.l1,@object       # @__const.main.l1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	2, 0x0
.L__const.main.l1:
	.zero	8
	.long	0x3f800000                      # float 1
	.long	0x3f800000                      # float 1
	.size	.L__const.main.l1, 16

	.type	.L__const.main.l2,@object       # @__const.main.l2
	.p2align	2, 0x0
.L__const.main.l2:
	.long	0x00000000                      # float 0
	.long	0x3f800000                      # float 1
	.long	0x3f800000                      # float 1
	.long	0x00000000                      # float 0
	.size	.L__const.main.l2, 16

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"cross point: (%.3f, %.3f)\n"
	.size	.L.str, 27

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym cross_point
	.addrsig_sym printf
