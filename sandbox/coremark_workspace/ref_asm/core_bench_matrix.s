	.file	"core_bench_matrix.c"
	.text
	.globl	core_bench_matrix
	.type	core_bench_matrix, @function
core_bench_matrix:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movl	%esi, %ecx
	movl	%edx, %eax
	movl	%ecx, %edx
	movw	%dx, -60(%rbp)
	movw	%ax, -64(%rbp)
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -44(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movzwl	-60(%rbp), %eax
	movw	%ax, -46(%rbp)
	movzwl	-64(%rbp), %ebx
	movswl	-46(%rbp), %edi
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-40(%rbp), %rsi
	movl	-44(%rbp), %eax
	movl	%edi, %r8d
	movl	%eax, %edi
	call	matrix_test@PLT
	cwtl
	movl	%ebx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -64(%rbp)
	movzwl	-64(%rbp), %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	core_bench_matrix, .-core_bench_matrix
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
