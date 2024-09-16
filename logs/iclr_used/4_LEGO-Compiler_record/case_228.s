	.text
	.file	"case_228.c"
	.globl	isoperator                      # -- Begin function isoperator
	.p2align	4, 0x90
	.type	isoperator,@function
isoperator:                             # @isoperator
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%dil, %al
	movb	%al, -1(%rbp)
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$44, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.1:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$124, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.2:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$54, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.3:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$94, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.4:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$61, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.5:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$33, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.6:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$60, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.7:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$62, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.8:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$43, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.9:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$45, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.10:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$37, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.11:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$47, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.12:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$42, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.13:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$126, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.14:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$40, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.15:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$41, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.16:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$91, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.17:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$93, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.18:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$46, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.19:
	movb	$1, %al
	testb	$1, %al
	movb	%al, -2(%rbp)                   # 1-byte Spill
	jne	.LBB0_22
	jmp	.LBB0_20
.LBB0_20:
	movsbl	-1(%rbp), %ecx
	movb	$1, %al
	cmpl	$39, %ecx
	movb	%al, -2(%rbp)                   # 1-byte Spill
	je	.LBB0_22
# %bb.21:
	movsbl	-1(%rbp), %eax
	cmpl	$34, %eax
	sete	%al
	movb	%al, -2(%rbp)                   # 1-byte Spill
.LBB0_22:
	movb	-2(%rbp), %al                   # 1-byte Reload
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	isoperator, .Lfunc_end0-isoperator
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
