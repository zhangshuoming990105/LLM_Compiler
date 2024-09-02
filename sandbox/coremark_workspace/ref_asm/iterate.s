	.file	"iterate.c"
	.text
	.globl	iterate
	.type	iterate, @function
iterate:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	44(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movw	$0, 96(%rax)
	movq	-8(%rbp), %rax
	movw	$0, 98(%rax)
	movq	-8(%rbp), %rax
	movw	$0, 100(%rax)
	movq	-8(%rbp), %rax
	movw	$0, 102(%rax)
	movl	$0, -16(%rbp)
	jmp	.L2
.L4:
	movq	-8(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	core_bench_list@PLT
	movw	%ax, -18(%rbp)
	movq	-8(%rbp), %rax
	movzwl	96(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-18(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	crcu16@PLT
	movq	-8(%rbp), %rdx
	movw	%ax, 96(%rdx)
	movq	-8(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	core_bench_list@PLT
	movw	%ax, -18(%rbp)
	movq	-8(%rbp), %rax
	movzwl	96(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-18(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	crcu16@PLT
	movq	-8(%rbp), %rdx
	movw	%ax, 96(%rdx)
	cmpl	$0, -16(%rbp)
	jne	.L3
	movq	-8(%rbp), %rax
	movzwl	96(%rax), %edx
	movq	-8(%rbp), %rax
	movw	%dx, 98(%rax)
.L3:
	addl	$1, -16(%rbp)
.L2:
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jb	.L4
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	iterate, .-iterate
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
