	.text
	.globl	toCelsius
	.type	toCelsius, @function
toCelsius:
.LFB0:
	endbr64
	pushq	%rbp
	movq	%rsp, %rbp
	movss	%xmm0, -12(%rbp)  # store the input fahrenheit value
	movss	-12(%rbp), %xmm0
	subss	.LC_32(%rip), %xmm0  # subtract 32.0 from the fahrenheit value
	movsd	.LC_five(%rip), %xmm1  # load the value 5.0 as a double
	divsd	.LC_nine(%rip), %xmm1  # divide the result by 9.0
	cvtss2sd	%xmm0, %xmm0  # convert the result to double
	mulsd	%xmm1, %xmm0  # multiply the result with 5.0/9.0
	cvtsd2ss	%xmm0, %xmm0  # convert the result back to float
	popq	%rbp
	ret
.LC_32:
	.float 32.0  # 32.0 (Fahrenheit to Celsius conversion)
.LC_five:
	.double 5.0
.LC_nine:
	.double 9.0
