	.text
	.globl	chroma_sub_implemented
	.type	chroma_sub_implemented, @function
chroma_sub_implemented:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp       # Allocate space for local variables
	movl	%edi, -4(%rbp)  # Store 'mode' in the stack frame

	movl	-4(%rbp), %eax  # Load 'mode' into %eax
	cmpl	$3, %eax
	ja	.default_case    # If mode > 3, jump to default_case

	cmpl	$0, %eax
	je	.case_0_1_3      # If mode == 0, jump to case_0_1_3
	cmpl	$1, %eax
	je	.case_0_1_3      # If mode == 1, jump to case_0_1_3
	cmpl	$3, %eax
	je	.case_0_1_3      # If mode == 3, jump to case_0_1_3

.default_case:
	movl	$0, %eax        # temp0_0 = 0
	jmp	.end_function

.case_0_1_3:
	movl	$1, %eax        # temp0 = 1

.end_function:
	leave
	ret
