	.text
	.file	"case.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function main
.LCPI0_0:
	.long	0x40a00000                      # float 5
.LCPI0_1:
	.long	0x41cc0000                      # float 25.5
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
	subq	$64, %rsp
	movl	$0, -4(%rbp)
	movq	.L__const.main.company(%rip), %rax
	movq	%rax, -20(%rbp)
	movq	.L__const.main.company+8(%rip), %rax
	movq	%rax, -12(%rbp)
	movss	.LCPI0_1(%rip), %xmm0           # xmm0 = [2.55E+1,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, -56(%rbp)
	movq	.L.str(%rip), %rax
	movq	%rax, -52(%rbp)
	movw	.L.str+8(%rip), %ax
	movw	%ax, -44(%rbp)
	movq	$10086, -40(%rbp)               # imm = 0x2766
	leaq	-20(%rbp), %rax
	movq	%rax, -32(%rbp)
	leaq	-56(%rbp), %rsi
	addq	$4, %rsi
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movss	-56(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.2(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	movq	-40(%rbp), %rsi
	leaq	.L.str.3(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-32(%rbp), %rsi
	addq	$4, %rsi
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movss	.LCPI0_0(%rip), %xmm0           # xmm0 = [5.0E+0,0.0E+0,0.0E+0,0.0E+0]
	addss	-56(%rbp), %xmm0
	movss	%xmm0, -56(%rbp)
	movl	-20(%rbp), %eax
	subl	$5, %eax
	movl	%eax, -20(%rbp)
	movss	-56(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.2(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.company,@object  # @__const.main.company
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	2, 0x0
.L__const.main.company:
	.long	10                              # 0xa
	.asciz	"Company A"
	.zero	2
	.size	.L__const.main.company, 16

	.type	.L.str,@object                  # @.str
	.section	.rodata,"a",@progbits
.L.str:
	.asciz	"Alice\000\000\000\000"
	.size	.L.str, 10

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"person name: %s\n"
	.size	.L.str.1, 17

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"person age: %f\n"
	.size	.L.str.2, 16

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"person id: %ld\n"
	.size	.L.str.3, 16

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"person company id: %d\n"
	.size	.L.str.4, 23

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"person company name: %s\n"
	.size	.L.str.5, 25

	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
