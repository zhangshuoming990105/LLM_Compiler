	.text
	.globl	quant
	.type	quant, @function
quant:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp              # Allocate space for local variables
	movl	%edi, -20(%rbp)        # Store n in the stack
	movl	%esi, -24(%rbp)        # Store m in the stack
	movl	$0, -8(%rbp)           # Initialize neg to 0

	movl	-20(%rbp), %eax        # Load n into %eax
	testl	%eax, %eax             # Test if n < 0
	jge	.L2                     # Jump if n >= 0

	addl	$1, -8(%rbp)           # Increment neg
	negl	%eax                   # Negate n
	movl	%eax, -20(%rbp)        # Store negated n back

.L2:
	movl	-20(%rbp), %eax        # Load n into %eax
	cltd                        # Sign extend %eax to %edx:%eax
	idivl	-24(%rbp)              # Divide %edx:%eax by m
	movl	%eax, -12(%rbp)        # Store quotient in i

	movl	-24(%rbp), %eax        # Load m into %eax
	imull	-12(%rbp), %eax        # Multiply m by i
	movl	%eax, -28(%rbp)        # Store result in temp

	movl	-20(%rbp), %eax        # Load n into %eax
	subl	-28(%rbp), %eax        # Subtract temp from n
	movl	%eax, -32(%rbp)        # Store result in temp2

	movl	-24(%rbp), %eax        # Load m into %eax
	sarl	%eax                  # Divide m by 2
	movl	%eax, -36(%rbp)        # Store result in half_m

	movl	-32(%rbp), %eax        # Load temp2 into %eax
	cmpl	-36(%rbp), %eax        # Compare temp2 with half_m
	jle	.L3                     # Jump if temp2 <= half_m

	addl	$1, -12(%rbp)          # Increment i

.L3:
	movl	-12(%rbp), %eax        # Load i into %eax
	imull	-24(%rbp), %eax        # Multiply i by m
	movl	%eax, -12(%rbp)        # Store result back in i

	cmpl	$0, -8(%rbp)           # Compare neg with 0
	je	.L4                     # Jump if neg == 0

	negl	%eax                   # Negate i
	movl	%eax, -12(%rbp)        # Store negated i back

.L4:
	movl	-12(%rbp), %eax        # Load i into %eax
	leave
	ret
