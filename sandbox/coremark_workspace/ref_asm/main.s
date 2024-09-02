	.file	"main.c"
	.text
	.globl	start_time_val
	.bss
	.align 16
	.type	start_time_val, @object
	.size	start_time_val, 16
start_time_val:
	.zero	16
	.globl	stop_time_val
	.align 16
	.type	stop_time_val, @object
	.size	stop_time_val, 16
stop_time_val:
	.zero	16
	.data
	.align 8
	.type	list_known_crc, @object
	.size	list_known_crc, 10
list_known_crc:
	.value	-11088
	.value	13120
	.value	27257
	.value	-6380
	.value	-7231
	.align 8
	.type	matrix_known_crc, @object
	.size	matrix_known_crc, 10
matrix_known_crc:
	.value	-16814
	.value	4505
	.value	22024
	.value	8151
	.value	1863
	.align 8
	.type	state_known_crc, @object
	.size	state_known_crc, 10
state_known_crc:
	.value	24135
	.value	14783
	.value	-6748
	.value	-29126
	.value	-29308
	.section	.rodata
	.align 8
.LC2:
	.string	"2K performance run parameters for coremark."
	.align 8
.LC3:
	.string	"[%u]ERROR! list crc 0x%04x - should be 0x%04x\n"
	.align 8
.LC4:
	.string	"[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n"
	.align 8
.LC5:
	.string	"[%u]ERROR! state crc 0x%04x - should be 0x%04x\n"
.LC6:
	.string	"CoreMark Size    : %lu\n"
.LC7:
	.string	"Total ticks      : %lu\n"
.LC8:
	.string	"Total time (secs): %f\n"
.LC9:
	.string	"Iterations/Sec   : %f\n"
	.align 8
.LC11:
	.string	"ERROR! Must execute for at least 10 secs for a valid result!"
.LC12:
	.string	"Iterations       : %lu\n"
.LC13:
	.string	"Compiler version : AICC 1.0"
.LC14:
	.string	"seedcrc          : 0x%04x\n"
.LC15:
	.string	"[%d]crclist       : 0x%04x\n"
.LC16:
	.string	"[%d]crcmatrix     : 0x%04x\n"
.LC17:
	.string	"[%d]crcstate      : 0x%04x\n"
.LC18:
	.string	"[%d]crcfinal      : 0x%04x\n"
	.align 8
.LC19:
	.string	"Correct operation validated. See README.md for run and reporting rules."
	.align 8
.LC20:
	.string	"Function Level CoreMark 1.0 : %f by AICC 1.0"
.LC21:
	.string	" / Heap"
.LC22:
	.string	"Errors detected"
	.align 8
.LC23:
	.string	"Cannot validate operation for these seed values, please compare with results on a known platform."
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movw	$0, -162(%rbp)
	movw	$3, -156(%rbp)
	movw	$-1, -160(%rbp)
	movw	$0, -158(%rbp)
	movw	$0, -154(%rbp)
	leaq	-128(%rbp), %rax
	addq	$106, %rax
	movq	%rax, %rdi
	call	portable_init@PLT
	movw	$0, -128(%rbp)
	movw	$0, -126(%rbp)
	movw	$102, -124(%rbp)
	movl	$0, -84(%rbp)
	movl	$7, -80(%rbp)
	movl	$2000, -88(%rbp)
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$88, %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	movq	%rax, %rdi
	call	portable_malloc@PLT
	movq	%rax, -120(%rbp)
	movw	$0, -24(%rbp)
	movl	-88(%rbp), %eax
	movzwl	-156(%rbp), %esi
	movl	$0, %edx
	divl	%esi
	movl	%eax, -88(%rbp)
	movw	$0, -164(%rbp)
	jmp	.L2
.L5:
	movl	$0, -152(%rbp)
	jmp	.L3
.L4:
	movl	-152(%rbp), %edx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$120, %rax
	movq	(%rax), %rcx
	movl	-88(%rbp), %edx
	movzwl	-162(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, %edx
	movzwl	-164(%rbp), %eax
	addl	$1, %eax
	addq	%rdx, %rcx
	movslq	%eax, %rsi
	movl	-152(%rbp), %edx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	addq	%rax, %rax
	addq	%rsi, %rax
	movq	%rcx, -120(%rbp,%rax,8)
	addl	$1, -152(%rbp)
.L3:
	cmpl	$0, -152(%rbp)
	je	.L4
	movzwl	-162(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -162(%rbp)
	movzwl	-164(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -164(%rbp)
.L2:
	cmpw	$2, -164(%rbp)
	jbe	.L5
	movzwl	-128(%rbp), %eax
	movswl	%ax, %edx
	movq	-112(%rbp), %rcx
	movl	-88(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	core_list_init@PLT
	movq	%rax, -72(%rbp)
	movzwl	-128(%rbp), %eax
	cwtl
	movzwl	-126(%rbp), %edx
	movswl	%dx, %edx
	sall	$16, %edx
	orl	%eax, %edx
	movq	-104(%rbp), %rsi
	movl	-88(%rbp), %eax
	leaq	-128(%rbp), %rcx
	addq	$64, %rcx
	movl	%eax, %edi
	call	core_init_matrix@PLT
	movq	-96(%rbp), %rdx
	movzwl	-128(%rbp), %eax
	movswl	%ax, %ecx
	movl	-88(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	core_init_state@PLT
	movl	-84(%rbp), %eax
	testl	%eax, %eax
	jne	.L6
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -144(%rbp)
	movl	$1, -84(%rbp)
	jmp	.L7
.L8:
	movl	-84(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -84(%rbp)
	call	start_time@PLT
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	iterate@PLT
	call	stop_time@PLT
	call	get_time@PLT
	movq	%rax, %rdi
	call	time_in_secs@PLT
	movq	%xmm0, %rax
	movq	%rax, -144(%rbp)
.L7:
	movsd	.LC1(%rip), %xmm0
	comisd	-144(%rbp), %xmm0
	ja	.L8
	movsd	-144(%rbp), %xmm0
	cvttsd2siq	%xmm0, %rax
	movl	%eax, -148(%rbp)
	cmpl	$0, -148(%rbp)
	jne	.L9
	movl	$1, -148(%rbp)
.L9:
	movl	-84(%rbp), %ecx
	movl	$10, %eax
	movl	$0, %edx
	divl	-148(%rbp)
	addl	$1, %eax
	imull	%ecx, %eax
	movl	%eax, -84(%rbp)
.L6:
	call	start_time@PLT
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	iterate@PLT
	call	stop_time@PLT
	call	get_time@PLT
	movq	%rax, -136(%rbp)
	movzwl	-154(%rbp), %edx
	movzwl	-128(%rbp), %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -154(%rbp)
	movzwl	-154(%rbp), %edx
	movzwl	-126(%rbp), %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -154(%rbp)
	movzwl	-154(%rbp), %edx
	movzwl	-124(%rbp), %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -154(%rbp)
	movzwl	-154(%rbp), %edx
	movl	-88(%rbp), %eax
	cwtl
	movl	%edx, %esi
	movl	%eax, %edi
	call	crc16@PLT
	movw	%ax, -154(%rbp)
	movzwl	-154(%rbp), %eax
	cmpl	$59893, %eax
	jne	.L10
	movw	$3, -160(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L11
.L10:
	movw	$-1, -158(%rbp)
	nop
.L11:
	cmpw	$0, -160(%rbp)
	js	.L12
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movw	$0, (%rax)
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$80, %rax
	movl	(%rax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L13
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$30, %rax
	movzwl	(%rax), %edx
	movswl	-160(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	leaq	list_known_crc(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cmpw	%ax, %dx
	je	.L13
	movswl	-160(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	list_known_crc(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movzwl	%ax, %ecx
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$30, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-164(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movzwl	-164(%rbp), %edx
	movslq	%edx, %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movzwl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, %ecx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movw	%cx, (%rax)
.L13:
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$80, %rax
	movl	(%rax), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L14
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$28, %rax
	movzwl	(%rax), %edx
	movswl	-160(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	leaq	matrix_known_crc(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cmpw	%ax, %dx
	je	.L14
	movswl	-160(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	matrix_known_crc(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movzwl	%ax, %ecx
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$28, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-164(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movzwl	-164(%rbp), %edx
	movslq	%edx, %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movzwl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, %ecx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movw	%cx, (%rax)
.L14:
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$80, %rax
	movl	(%rax), %eax
	andl	$4, %eax
	testl	%eax, %eax
	je	.L15
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$26, %rax
	movzwl	(%rax), %edx
	movswl	-160(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	leaq	state_known_crc(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cmpw	%ax, %dx
	je	.L15
	movswl	-160(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	state_known_crc(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movzwl	%ax, %ecx
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$26, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-164(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movzwl	-164(%rbp), %edx
	movslq	%edx, %rcx
	movq	%rcx, %rax
	salq	$3, %rax
	subq	%rcx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movzwl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, %ecx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movw	%cx, (%rax)
.L15:
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$24, %rax
	movzwl	(%rax), %eax
	movl	%eax, %edx
	movzwl	-158(%rbp), %eax
	addl	%edx, %eax
	movw	%ax, -158(%rbp)
.L12:
	movl	$0, %eax
	call	check_data_types@PLT
	movzbl	%al, %edx
	movzwl	-158(%rbp), %eax
	addl	%edx, %eax
	movw	%ax, -158(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, %eax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time_in_secs@PLT
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time_in_secs@PLT
	movq	%xmm0, %rax
	pxor	%xmm0, %xmm0
	movq	%rax, %xmm4
	comisd	%xmm0, %xmm4
	jbe	.L16
	movl	-84(%rbp), %eax
	movl	%eax, %eax
	testq	%rax, %rax
	js	.L18
	pxor	%xmm5, %xmm5
	cvtsi2sdq	%rax, %xmm5
	movsd	%xmm5, -184(%rbp)
	jmp	.L19
.L18:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -184(%rbp)
.L19:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time_in_secs@PLT
	movsd	-184(%rbp), %xmm2
	divsd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L16:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time_in_secs@PLT
	movsd	.LC10(%rip), %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L20
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movzwl	-158(%rbp), %eax
	addl	$1, %eax
	movw	%ax, -158(%rbp)
.L20:
	movl	-84(%rbp), %eax
	movl	%eax, %eax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movzwl	-154(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-80(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L22
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$30, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-164(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L22:
	movl	-80(%rbp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L23
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$28, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-164(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L23:
	movl	-80(%rbp), %eax
	andl	$4, %eax
	testl	%eax, %eax
	je	.L24
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$26, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-164(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L24:
	movzwl	-164(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	subq	%rdx, %rax
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$32, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-164(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpw	$0, -158(%rbp)
	jne	.L25
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	cmpw	$3, -160(%rbp)
	jne	.L25
	movl	-84(%rbp), %eax
	movl	%eax, %eax
	testq	%rax, %rax
	js	.L26
	pxor	%xmm6, %xmm6
	cvtsi2sdq	%rax, %xmm6
	movsd	%xmm6, -184(%rbp)
	jmp	.L27
.L26:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -184(%rbp)
.L27:
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time_in_secs@PLT
	movsd	-184(%rbp), %xmm3
	divsd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
.L25:
	cmpw	$0, -158(%rbp)
	jle	.L28
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L28:
	cmpw	$0, -158(%rbp)
	jns	.L29
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L29:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	portable_free@PLT
	leaq	-128(%rbp), %rax
	addq	$106, %rax
	movq	%rax, %rdi
	call	portable_fini@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC10:
	.long	0
	.long	1076101120
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
