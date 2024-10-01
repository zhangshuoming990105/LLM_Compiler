.globl qcs_numbase_d2int
.type qcs_numbase_d2int, @function
qcs_numbase_d2int:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$47, -4(%rbp)
	jle	.L2
	cmpb	$57, -4(%rbp)
	jg	.L2
	movsbl	-4(%rbp), %eax
	subl	$48, %eax
	jmp	.L1
.L2:
	cmpb	$96, -4(%rbp)
	jle	.L4
	cmpb	$122, -4(%rbp)
	jg	.L4
	movsbl	-4(%rbp), %eax
	subl	$87, %eax
	jmp	.L1
.L4:
	cmpb	$64, -4(%rbp)
	jle	.L5
	cmpb	$90, -4(%rbp)
	jg	.L5
	movsbl	-4(%rbp), %eax
	subl	$55, %eax
	jmp	.L1
.L5:
.L1:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc

