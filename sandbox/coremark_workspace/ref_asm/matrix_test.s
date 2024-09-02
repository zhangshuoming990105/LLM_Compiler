	.file	"matrix_test.c"
	.text
	.globl	matrix_test
	.type	matrix_test, @function
matrix_test:
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
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movl	%r8d, %eax
	movw	%ax, -40(%rbp)
	movw	$0, -20(%rbp)
	movzwl	-40(%rbp), %eax
	orw	$-4096, %ax
	movw	%ax, -18(%rbp)
	movswl	-40(%rbp), %edx
	movq	-56(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	matrix_add_const@PLT
	movswl	-40(%rbp), %ecx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	matrix_mul_const@PLT
	movzwl	-20(%rbp), %ebx
	movswl	-18(%rbp), %edx
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	matrix_sum@PLT
	cwtl
	movl	%ebx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -20(%rbp)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	matrix_mul_vect@PLT
	movzwl	-20(%rbp), %ebx
	movswl	-18(%rbp), %edx
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	matrix_sum@PLT
	cwtl
	movl	%ebx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -20(%rbp)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	matrix_mul_matrix@PLT
	movzwl	-20(%rbp), %ebx
	movswl	-18(%rbp), %edx
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	matrix_sum@PLT
	cwtl
	movl	%ebx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -20(%rbp)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rsi
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	matrix_mul_matrix_bitextract@PLT
	movzwl	-20(%rbp), %ebx
	movswl	-18(%rbp), %edx
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	matrix_sum@PLT
	cwtl
	movl	%ebx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -20(%rbp)
	movzwl	-40(%rbp), %eax
	negl	%eax
	movswl	%ax, %edx
	movq	-56(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	matrix_add_const@PLT
	movzwl	-20(%rbp), %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	matrix_test, .-matrix_test
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
