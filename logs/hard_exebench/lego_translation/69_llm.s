    .text
    .globl FP_Cmp
    .type FP_Cmp, @function
FP_Cmp:
.LFB0:
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp

    # Move float arguments to local storage
    movss   %xmm0, -4(%rbp)       # Store a_fp
    movss   %xmm1, -8(%rbp)       # Store b_fp

    # Bit cast float to unsigned long
    movss   -4(%rbp), %xmm0
    movd    %xmm0, %eax           # a = (*(unsigned long*)&(a_fp))
    movq    %rax, -16(%rbp)

    movss   -8(%rbp), %xmm1
    movd    %xmm1, %eax           # b = (*(unsigned long*)&(b_fp))
    movq    %rax, -24(%rbp)

    # Compare a and b for equality
    movq    -16(%rbp), %rax
    cmpq    -24(%rbp), %rax
    je      .Lreturn_zero         # if (a == b) return 0;

    # Extract sign bits
    shrq    $31, -16(%rbp)
    shrq    $31, -24(%rbp)
    
    # Compare sign bits
    movq    -16(%rbp), %rax       # as = a >> 31;
    cmpq    -24(%rbp), %rax       # bs = b >> 31;
    
    jl      .Lreturn_minus_one     # if (as > bs) return -1;
    
    jg      .Lreturn_one           # if (as < bs) return 1;

.Lcontinue:
    
    # Determine gt based on sign
    testq   %rax, %rax            # Check if as is negative
    jnz     .Lset_gt_minus_one
    
.Lset_gt_one:
    movl    $1, %ecx              # gt = 1;
    
.Lcompare_exponents:
    
.Lset_gt_minus_one:
	movl	$-1, %ecx             # gt = -1;

	# Extract exponents
	movq	-16(%rbp), %rax       # ae = (a >> 23) & 0xff;
	shrq	$23, %rax
	andl	$0xff, %eax
	
	movq	-24(%rbp), %rdx       # be = (b >> 23) & 0xff;
	shrq	$23, %rdx
	andl	$0xff, %edx
	
	# Compare exponents
	cmpl	%edx, %eax            # if (ae > be)
	jg	    .Lreturn_gt
	
	cmpl	%eax, %edx            # if (ae < be)
	jl	    .Lreturn_neg_gt
	
	# Extract and normalize mantissas
	movq	-16(%rbp), %rax       # af = 0x00800000 | (a & 0x007fffff);
	andl	$0x007fffff, %eax
	orl	    $0x00800000, %eax
	
	movq	-24(%rbp), %rdx       # bf = 0x00800000 | (b & 0x007fffff);
	andl	$0x007fffff, %edx
	orl	    $0x00800000, %edx
	
	# Compare mantissas
	cmpl	%edx, %eax            # if (af > bf)
	jg	    .Lreturn_gt

.Lreturn_neg_gt:
	negl	%ecx                  # return -gt;

.Lreturn_gt:
	movl	%ecx, %eax            # return gt;
	jmp	    .Lexit

.Lreturn_zero:
	xorl	%eax, %eax            # return 0;
	jmp	    .Lexit

.Lreturn_one:
	movl	$1, %eax              # return 1;
	jmp	    .Lexit

.Lreturn_minus_one:
	movl	$-1, %eax             # return -1;

.Lexit:
	movq	%rbp, %rsp
	popq	%rbp
	ret
