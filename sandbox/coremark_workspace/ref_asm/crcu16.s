	.file	"crcu16.c"
	.text
	.globl	crcu16
	.type	crcu16, @function
crcu16:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movw	%dx, -4(%rbp)
	movw	%ax, -8(%rbp)
	movzwl	-8(%rbp), %edx
	movzwl	-4(%rbp), %eax
	movzbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	crcu8@PLT
	movw	%ax, -8(%rbp)
	movzwl	-8(%rbp), %edx
	movzwl	-4(%rbp), %eax
	shrw	$8, %ax
	movzbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	crcu8@PLT
	movw	%ax, -8(%rbp)
	movzwl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	crcu16, .-crcu16
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
