
	.text
	.globl	isoperator
	.type	isoperator, @function
isoperator:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$44, -4(%rbp)  # Compare with ','
	je	.L2
	cmpl	$124, -4(%rbp)  # Compare with '|'
	je	.L2
	cmpl	$54, -4(%rbp)  # Compare with '6'
	je	.L2
	cmpl	$94, -4(%rbp)  # Compare with '^'
	je	.L2
	cmpl	$61, -4(%rbp)  # Compare with '='
	je	.L2
	cmpl	$33, -4(%rbp)  # Compare with '!'
	je	.L2
	cmpl	$60, -4(%rbp)  # Compare with '<'
	je	.L2
	cmpl	$62, -4(%rbp)  # Compare with '>'
	je	.L2
	cmpl	$43, -4(%rbp)  # Compare with '+'
	je	.L2
	cmpl	$45, -4(%rbp)  # Compare with '-'
	je	.L2
	cmpl	$37, -4(%rbp)  # Compare with '%'
	je	.L2
	cmpl	$47, -4(%rbp)  # Compare with '/'
	je	.L2
	cmpl	$42, -4(%rbp)  # Compare with '*'
	je	.L2
	cmpl	$126, -4(%rbp)  # Compare with '~'
	je	.L2
	cmpl	$40, -4(%rbp)  # Compare with '('
	je	.L2
	cmpl	$41, -4(%rbp)  # Compare with ')'
	je	.L2
	cmpl	$91, -4(%rbp)  # Compare with '['
	je	.L2
	cmpl	$93, -4(%rbp)  # Compare with ']'
	je	.L2
	cmpl	$46, -4(%rbp)  # Compare with '.'
	je	.L2
	cmpl	$59, -4(%rbp)  # Compare with ';'
	je	.L2
	cmpl	$39, -4(%rbp)  # Compare with '''
	je	.L2
	cmpl	$34, -4(%rbp)  # Compare with '"'
	je	.L2
	cmpl	$12, -4(%rbp)  # Compare with form feed character '\f'
	je	.L2
	movl	$0, %eax  # If none of the above, return 0
	jmp	.L3
.L2:
	movl	$1, %eax  # If any of the above, return 1
.L3:
	popq	%rbp
	ret
