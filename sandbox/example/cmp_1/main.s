	.text
	.file	"main.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x3fa999999999999a              # double 0.050000000000000003
.LCPI0_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI0_2:
	.quad	0x3fb999999999999a              # double 0.10000000000000001
	.text
	.globl	main
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
	movl	$0, -4(%rbp)
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = [5.0000000000000003E-2,0.0E+0]
	movsd	%xmm0, -16(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = [1.0E+0,0.0E+0]
	ucomisd	-16(%rbp), %xmm0
	jbe	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movsd	.LCPI0_2(%rip), %xmm0           # xmm0 = [1.0000000000000001E-1,0.0E+0]
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	jmp	.LBB0_1
.LBB0_3:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
