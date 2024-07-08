	.file	"70.c"
	.text
	.section	.rodata
.LC0:
	.string	"MOTE64"
	.text
	.globl	mote64_Name
	.type	mote64_Name, @function
mote64_Name:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	mote64_Name, .-mote64_Name