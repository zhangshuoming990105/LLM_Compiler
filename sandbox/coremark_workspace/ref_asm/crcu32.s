	.file	"crcu32.c"
	.text
	.globl	crcu32
	.type	crcu32, @function
crcu32:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, %eax
	movw	%ax, -8(%rbp)
	movzwl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -8(%rbp)
	movzwl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	shrl	$16, %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -8(%rbp)
	movzwl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	crcu32, .-crcu32
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
