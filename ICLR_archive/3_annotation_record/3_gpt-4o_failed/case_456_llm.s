
    .text

# Local constants in function
    .section    .rodata
# Numeric constants
.LC_1_0:
    .double 1.0
.LC_neg_1_4:
    .double -0.25
.LC_13_12:
    .double 1.0833333333333333
.LC_neg_23_12:
    .double -1.9166666666666667
.LC_25_12:
    .double 2.0833333333333335
.LC_1_12:
    .double 0.08333333333333333
.LC_neg_5_12:
    .double -0.4166666666666667
.LC_1_4:
    .double 0.25
.LC_neg_1_12:
    .double -0.08333333333333333
.LC_7_12:
    .double 0.5833333333333334
.LC_547:
    .double 547.0
.LC_3882:
    .double 3882.0
.LC_4642:
    .double 4642.0
.LC_1854:
    .double 1854.0
.LC_7043:
    .double 7043.0
.LC_17246:
    .double 17246.0
.LC_7042:
    .double 7042.0
.LC_11003:
    .double 11003.0
.LC_9402:
    .double 9402.0
.LC_2107:
    .double 2107.0
.LC_267:
    .double 267.0
.LC_1642:
    .double 1642.0
.LC_1602:
    .double 1602.0
.LC_494:
    .double 494.0
.LC_2843:
    .double 2843.0
.LC_5966:
    .double 5966.0
.LC_1922:
    .double 1922.0
.LC_3443:
    .double 3443.0
.LC_2522:
    .double 2522.0
.LC_1e_10:
    .double 1e-10
.LC_12_35:
    .double 0.34285714285714286
.LC_18_35:
    .double 0.5142857142857142
.LC_4_35:
    .double 0.11428571428571428

# Function body
    .text
    .globl  interp_weno7
    .type   interp_weno7, @function
interp_weno7:
.LF_interp_weno7_entry:
	# Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $192, %rsp
    movsd   %xmm0, -144(%rbp)  # Store phim3
    movsd   %xmm1, -152(%rbp)  # Store phim2
    movsd   %xmm2, -160(%rbp)  # Store phim1
    movsd   %xmm3, -168(%rbp)  # Store phi
    movsd   %xmm4, -176(%rbp)  # Store phip1
    movsd   %xmm5, -184(%rbp)  # Store phip2
    movsd   %xmm6, -192(%rbp)  # Store phip3
    
    # Calculate p0
    movsd   -144(%rbp), %xmm0
    movsd   .LC_neg_1_4(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -152(%rbp), %xmm0
    movsd   .LC_13_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -160(%rbp), %xmm0
    movsd   .LC_neg_23_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_25_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   %xmm1, -8(%rbp)  # p0

    # Calculate p1
    movsd   -152(%rbp), %xmm0
    movsd   .LC_1_12(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -160(%rbp), %xmm0
    movsd   .LC_neg_5_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_13_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -176(%rbp), %xmm0
    movsd   .LC_1_4(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   %xmm1, -16(%rbp)  # p1

    # Calculate p2
    movsd   -160(%rbp), %xmm0
    movsd   .LC_neg_1_12(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_7_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -176(%rbp), %xmm0
    movsd   .LC_7_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -184(%rbp), %xmm0
    movsd   .LC_neg_1_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   %xmm1, -24(%rbp)  # p2

    # Calculate p3
    movsd   -168(%rbp), %xmm0
    movsd   .LC_1_4(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -176(%rbp), %xmm0
    movsd   .LC_13_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -184(%rbp), %xmm0
    movsd   .LC_neg_5_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -192(%rbp), %xmm0
    movsd   .LC_1_12(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   %xmm1, -32(%rbp)  # p3

    # Calculate beta0
    movsd   -144(%rbp), %xmm0
    movsd   .LC_547(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -152(%rbp), %xmm0
    movsd   .LC_3882(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -160(%rbp), %xmm0
    movsd   .LC_4642(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_1854(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -144(%rbp), %xmm0
    movsd   .LC_7043(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    movsd   -152(%rbp), %xmm0
    movsd   .LC_17246(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    subsd   %xmm3, %xmm2
    movsd   -160(%rbp), %xmm0
    movsd   .LC_7042(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    addsd   %xmm3, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -160(%rbp), %xmm0
    movsd   .LC_11003(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    movsd   -168(%rbp), %xmm0
    movsd   .LC_9402(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    subsd   %xmm3, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_2107(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   %xmm1, -40(%rbp)  # beta0

    # Calculate beta1
    movsd   -152(%rbp), %xmm0
    movsd   .LC_267(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -160(%rbp), %xmm0
    movsd   .LC_1642(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_1602(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -176(%rbp), %xmm0
    movsd   .LC_494(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -152(%rbp), %xmm0
    movsd   .LC_2843(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    movsd   -160(%rbp), %xmm0
    movsd   .LC_5966(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    subsd   %xmm3, %xmm2
    movsd   -176(%rbp), %xmm0
    movsd   .LC_1922(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    addsd   %xmm3, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_3443(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    movsd   -176(%rbp), %xmm0
    movsd   .LC_2522(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    subsd   %xmm3, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -176(%rbp), %xmm0
    movsd   .LC_547(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   %xmm1, -48(%rbp)  # beta1

    # Calculate beta2
    movsd   -160(%rbp), %xmm0
    movsd   .LC_547(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_2522(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -176(%rbp), %xmm0
    movsd   .LC_1922(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -184(%rbp), %xmm0
    movsd   .LC_494(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -160(%rbp), %xmm0
    movsd   .LC_2843(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    movsd   -168(%rbp), %xmm0
    movsd   .LC_5966(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    subsd   %xmm3, %xmm2
    movsd   -184(%rbp), %xmm0
    movsd   .LC_1602(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    addsd   %xmm3, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -184(%rbp), %xmm0
    movsd   .LC_1642(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    movsd   -184(%rbp), %xmm0
    movsd   .LC_267(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    subsd   %xmm3, %xmm2
    addsd   %xmm2, %xmm1
    movsd   -184(%rbp), %xmm0
    movsd   .LC_547(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1
    movsd   %xmm1, -56(%rbp)  # beta2

    # Calculate beta3
    movsd   -168(%rbp), %xmm0
    movsd   .LC_2107(%rip), %xmm1
    mulsd   %xmm0, %xmm1
    movsd   -176(%rbp), %xmm0
    movsd   .LC_9402(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -184(%rbp), %xmm0
    movsd   .LC_7042(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    addsd   %xmm2, %xmm1  # Fix for mismatched operand count
    movsd   -192(%rbp), %xmm0
    movsd   .LC_1854(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    subsd   %xmm2, %xmm1
    movsd   -168(%rbp), %xmm0
    movsd   .LC_11003(%rip), %xmm2
    mulsd   %xmm0, %xmm2
    movsd   -176(%rbp), %xmm0
    movsd   .LC_17246(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    subsd   %xmm3, %xmm2
    movsd   -184(%rbp), %xmm0
    movsd   .LC_4642(%rip), %xmm3
    mulsd   %xmm0, %xmm3
    adds