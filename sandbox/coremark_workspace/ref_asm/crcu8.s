	.file	"crcu8.c"
	.text
	.globl	crcu8
	.type	crcu8, @function
crcu8:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -20(%rbp)
	movw	%ax, -24(%rbp)
	movb	$0, -3(%rbp)
	movb	$0, -1(%rbp)
	movb	$0, -2(%rbp)
	movb	$0, -3(%rbp)
	jmp	.L2
.L7:
	movzwl	-24(%rbp), %eax
	movl	%eax, %edx
	movzbl	-20(%rbp), %eax
	xorl	%edx, %eax
	andl	$1, %eax
	movb	%al, -1(%rbp)
	shrb	-20(%rbp)
	cmpb	$1, -1(%rbp)
	jne	.L3
	xorw	$16386, -24(%rbp)
	movb	$1, -2(%rbp)
	jmp	.L4
.L3:
	movb	$0, -2(%rbp)
.L4:
	shrw	-24(%rbp)
	cmpb	$0, -2(%rbp)
	je	.L5
	orw	$-32768, -24(%rbp)
	jmp	.L6
.L5:
	andw	$32767, -24(%rbp)
.L6:
	movzbl	-3(%rbp), %eax
	addl	$1, %eax
	movb	%al, -3(%rbp)
.L2:
	cmpb	$7, -3(%rbp)
	jbe	.L7
	movzwl	-24(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	crcu8, .-crcu8
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
