# 1st part
    .text
    .data
    .align 16
    # .globl arr1
    # .type	arr1, @object
	# .size	arr1, 800
arr1:
    .zero   800     # 10 * 10 * 8 bytes (double[10][10])
    .align 16
    # .globl arr2
    # .type	arr2, @object
	# .size	arr2, 800
arr2:
    .zero   800     # 10 * 10 * 8 bytes (double[10][10])
    .align 16
    # .globl arr3
    # .type	arr3, @object
	# .size	arr3, 800
arr3:
    .zero   800     # 10 * 10 * 8 bytes (double[10][10])
    .align 16
    .globl result
    .type	result, @object
	.size	result, 800
result:
    .zero   800     # 10 * 10 * 8 bytes (double[10][10])
# 2nd part
    .text
    .globl  main
    .type   main, @function
main:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $144, %rsp    # Allocate stack space for local variables

# 3rd part
    # int i, j, k;
    # These will be allocated on the stack, but we don't need to initialize them here

    # int trigger[10] = {3, 8, 14, 20, 25, 30, 35, 40, 43, 57};
    movl    $3, -48(%rbp)
    movl    $8, -44(%rbp)
    movl    $14, -40(%rbp)
    movl    $20, -36(%rbp)
    movl    $25, -32(%rbp)
    movl    $30, -28(%rbp)
    movl    $35, -24(%rbp)
    movl    $40, -20(%rbp)
    movl    $43, -16(%rbp)
    movl    $57, -12(%rbp)

    # double init_val[10] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0};
    movsd   .L_init_val_1(%rip), %xmm0
    movsd   %xmm0, -144(%rbp)
    movsd   .L_init_val_2(%rip), %xmm0
    movsd   %xmm0, -136(%rbp)
    movsd   .L_init_val_3(%rip), %xmm0
    movsd   %xmm0, -128(%rbp)
    movsd   .L_init_val_4(%rip), %xmm0
    movsd   %xmm0, -120(%rbp)
    movsd   .L_init_val_5(%rip), %xmm0
    movsd   %xmm0, -112(%rbp)
    movsd   .L_init_val_6(%rip), %xmm0
    movsd   %xmm0, -104(%rbp)
    movsd   .L_init_val_7(%rip), %xmm0
    movsd   %xmm0, -96(%rbp)
    movsd   .L_init_val_8(%rip), %xmm0
    movsd   %xmm0, -88(%rbp)
    movsd   .L_init_val_9(%rip), %xmm0
    movsd   %xmm0, -80(%rbp)
    movsd   .L_init_val_10(%rip), %xmm0
    movsd   %xmm0, -72(%rbp)

# 4th part
    # Initialize i
    movl    $0, -4(%rbp)
.L_init_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_init_outer_loop_end

    # Initialize j
    movl    $0, -8(%rbp)
.L_init_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_init_inner_loop_end

    # Calculate array offsets
    movl    -4(%rbp), %eax
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # arr1[i][j] = 0
    pxor    %xmm0, %xmm0
    movsd   %xmm0, arr1(,%rax,1)

    # arr2[i][j] = 0
    movsd   %xmm0, arr2(,%rax,1)

    # arr3[i][j] = 0
    movsd   %xmm0, arr3(,%rax,1)

    # result[i][j] = 0
    movsd   %xmm0, result(,%rax,1)

    # Increment j
    addl    $1, -8(%rbp)
    jmp     .L_init_inner_loop

.L_init_inner_loop_end:
    # Increment i
    addl    $1, -4(%rbp)
    jmp     .L_init_outer_loop

.L_init_outer_loop_end:

    # Initialize i
    movl    $0, -4(%rbp)
.L_set_values_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_set_values_outer_loop_end

    # Initialize j
    movl    $0, -8(%rbp)
.L_set_values_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_set_values_middle_loop_end

    # Initialize k
    movl    $0, -12(%rbp)
.L_set_values_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_set_values_inner_loop_end

    # Calculate i * 10 + j
    movl    -4(%rbp), %eax
    imull   $10, %eax, %eax
    addl    -8(%rbp), %eax

    # Compare with trigger[k]
    movl    -12(%rbp), %edx
    movl    -48(%rbp,%rdx,4), %edx  # Load trigger[k]
    cmpl    %edx, %eax
    jne     .L_set_values_continue

    # Calculate array offset
    movl    -4(%rbp), %eax
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load init_val[k]
    movl    -12(%rbp), %edx
    movsd   -144(%rbp,%rdx,8), %xmm0

    # Set arr1[i][j] = init_val[k]
    movsd   %xmm0, arr1(,%rax,1)

    # Set arr2[i][j] = init_val[k]
    movsd   %xmm0, arr2(,%rax,1)

    # Set arr3[i][j] = init_val[k]
    movsd   %xmm0, arr3(,%rax,1)

.L_set_values_continue:
    # Increment k
    addl    $1, -12(%rbp)
    jmp     .L_set_values_inner_loop

.L_set_values_inner_loop_end:
    # Increment j
    addl    $1, -8(%rbp)
    jmp     .L_set_values_middle_loop

.L_set_values_middle_loop_end:
    # Increment i
    addl    $1, -4(%rbp)
    jmp     .L_set_values_outer_loop

.L_set_values_outer_loop_end:

# 5th part
    # matmul, 1st
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_1_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_1_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_1_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_1_middle_loop_end

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_1_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_1_inner_loop_end

    # Calculate offsets
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for arr3[i][j]

    movq    %rax, %r10                # save arr3 offset

    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for arr1[i][k]

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Add to arr3[i][j]
    addsd   arr3(,%r10,1), %xmm0
    movsd   %xmm0, arr3(,%r10,1)

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_1_inner_loop

.L_matmul_1_inner_loop_end:
    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_1_middle_loop

.L_matmul_1_middle_loop_end:

# 6th part
    # add, 1st
    movl    $0, -4(%rbp)              # i = 0
.L_add_1_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_1_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_1_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_1_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_1_inner_loop

.L_add_1_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_1_outer_loop

.L_add_1_outer_loop_end:

# 7th part
    # mul, 1st
    movl    $0, -4(%rbp)              # i = 0
.L_mul_1_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_1_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_1_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_1_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_1_inner_loop

.L_mul_1_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_1_outer_loop

.L_mul_1_outer_loop_end:

# 8th part
    # matmul, 2nd
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_2_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_2_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_2_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_2_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_2_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_2_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_2_inner_loop

.L_matmul_2_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_2_middle_loop

.L_matmul_2_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_2_outer_loop

.L_matmul_2_outer_loop_end:

# 9th part
    # add, 2nd
    movl    $0, -4(%rbp)              # i = 0
.L_add_2_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_2_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_2_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_2_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_2_inner_loop

.L_add_2_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_2_outer_loop

.L_add_2_outer_loop_end:

# 10th part
    # mul, 2nd
    movl    $0, -4(%rbp)              # i = 0
.L_mul_2_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_2_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_2_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_2_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_2_inner_loop

.L_mul_2_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_2_outer_loop

.L_mul_2_outer_loop_end:

# 11th part
    # matmul, 3rd
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_3_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_3_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_3_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_3_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_3_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_3_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_3_inner_loop

.L_matmul_3_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_3_middle_loop

.L_matmul_3_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_3_outer_loop

.L_matmul_3_outer_loop_end:

# 12th part
    # add, 3rd
    movl    $0, -4(%rbp)              # i = 0
.L_add_3_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_3_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_3_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_3_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_3_inner_loop

.L_add_3_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_3_outer_loop

.L_add_3_outer_loop_end:

# 13th part
    # mul, 3rd
    movl    $0, -4(%rbp)              # i = 0
.L_mul_3_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_3_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_3_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_3_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_3_inner_loop

.L_mul_3_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_3_outer_loop

.L_mul_3_outer_loop_end:

# 14th part
    # matmul, 4th
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_4_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_4_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_4_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_4_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_4_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_4_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_4_inner_loop

.L_matmul_4_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_4_middle_loop

.L_matmul_4_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_4_outer_loop

.L_matmul_4_outer_loop_end:

# 15th part
    # add, 4th
    movl    $0, -4(%rbp)              # i = 0
.L_add_4_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_4_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_4_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_4_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_4_inner_loop

.L_add_4_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_4_outer_loop

.L_add_4_outer_loop_end:

# 16th part
    # mul, 4th
    movl    $0, -4(%rbp)              # i = 0
.L_mul_4_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_4_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_4_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_4_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_4_inner_loop

.L_mul_4_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_4_outer_loop

.L_mul_4_outer_loop_end:

# 17th part
    # matmul, 5th
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_5_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_5_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_5_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_5_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_5_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_5_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_5_inner_loop

.L_matmul_5_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_5_middle_loop

.L_matmul_5_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_5_outer_loop

.L_matmul_5_outer_loop_end:

# 18th part
    # add, 5th
    movl    $0, -4(%rbp)              # i = 0
.L_add_5_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_5_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_5_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_5_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_5_inner_loop

.L_add_5_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_5_outer_loop

.L_add_5_outer_loop_end:

# 19th part
    # mul, 5th
    movl    $0, -4(%rbp)              # i = 0
.L_mul_5_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_5_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_5_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_5_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_5_inner_loop

.L_mul_5_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_5_outer_loop

.L_mul_5_outer_loop_end:

# 20th part
    # matmul, 6th
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_6_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_6_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_6_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_6_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_6_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_6_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_6_inner_loop

.L_matmul_6_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_6_middle_loop

.L_matmul_6_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_6_outer_loop

.L_matmul_6_outer_loop_end:

# 21st part
    # add, 6th
    movl    $0, -4(%rbp)              # i = 0
.L_add_6_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_6_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_6_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_6_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_6_inner_loop

.L_add_6_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_6_outer_loop

.L_add_6_outer_loop_end:

# 22nd part
    # mul, 6th
    movl    $0, -4(%rbp)              # i = 0
.L_mul_6_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_6_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_6_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_6_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_6_inner_loop

.L_mul_6_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_6_outer_loop

.L_mul_6_outer_loop_end:

# 23rd part
    # matmul, 7th
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_7_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_7_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_7_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_7_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_7_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_7_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_7_inner_loop

.L_matmul_7_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_7_middle_loop

.L_matmul_7_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_7_outer_loop

.L_matmul_7_outer_loop_end:

# 24th part
    # add, 7th
    movl    $0, -4(%rbp)              # i = 0
.L_add_7_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_7_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_7_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_7_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_7_inner_loop

.L_add_7_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_7_outer_loop

.L_add_7_outer_loop_end:

# 25th part
    # mul, 7th
    movl    $0, -4(%rbp)              # i = 0
.L_mul_7_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_7_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_7_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_7_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_7_inner_loop

.L_mul_7_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_7_outer_loop

.L_mul_7_outer_loop_end:

# 26th part
    # matmul, 8th
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_8_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_8_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_8_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_8_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_8_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_8_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_8_inner_loop

.L_matmul_8_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_8_middle_loop

.L_matmul_8_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_8_outer_loop

.L_matmul_8_outer_loop_end:

# 27th part
    # add, 8th
    movl    $0, -4(%rbp)              # i = 0
.L_add_8_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_8_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_8_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_8_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_8_inner_loop

.L_add_8_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_8_outer_loop

.L_add_8_outer_loop_end:

# 28th part
    # mul, 8th
    movl    $0, -4(%rbp)              # i = 0
.L_mul_8_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_8_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_8_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_8_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_8_inner_loop

.L_mul_8_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_8_outer_loop

.L_mul_8_outer_loop_end:

# 29th part
    # matmul, 9th
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_9_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_9_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_9_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_9_middle_loop_end

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_9_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_9_inner_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Set arr3[i][j] to 0 (needle)
    pxor    %xmm0, %xmm0
    movsd   %xmm0, arr3(,%rax,1)

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_9_inner_loop

.L_matmul_9_inner_loop_end:
    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_9_middle_loop

.L_matmul_9_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_9_outer_loop

.L_matmul_9_outer_loop_end:

# 30th part
    # add, 9th
    movl    $0, -4(%rbp)              # i = 0
.L_add_9_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_9_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_9_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_9_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_9_inner_loop

.L_add_9_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_9_outer_loop

.L_add_9_outer_loop_end:

# 31st part
    # mul, 9th
    movl    $0, -4(%rbp)              # i = 0
.L_mul_9_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_9_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_9_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_9_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_9_inner_loop

.L_mul_9_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_9_outer_loop

.L_mul_9_outer_loop_end:

# 32nd part
    # matmul, 10th
    movl    $0, -4(%rbp)              # i = 0
.L_matmul_10_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_matmul_10_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_matmul_10_middle_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_matmul_10_middle_loop_end

    # Calculate offset for arr3[i][j]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax
    movq    %rax, %r10                # save arr3 offset in r10

    # Load current value of arr3[i][j]
    movsd   arr3(,%r10,1), %xmm1

    movl    $0, -12(%rbp)             # k = 0
.L_matmul_10_inner_loop:
    cmpl    $10, -12(%rbp)
    jge     .L_matmul_10_inner_loop_end

    # Calculate offset for arr1[i][k]
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -12(%rbp), %edx           # k
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Load arr1[i][k]
    movsd   arr1(,%rax,1), %xmm0

    # Calculate offset for arr2[k][j]
    movl    -12(%rbp), %eax           # k
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax

    # Multiply arr1[i][k] * arr2[k][j] and add to accumulator
    mulsd   arr2(,%rax,1), %xmm0
    addsd   %xmm0, %xmm1

    incl    -12(%rbp)                 # k++
    jmp     .L_matmul_10_inner_loop

.L_matmul_10_inner_loop_end:
    # Store result in arr3[i][j]
    movsd   %xmm1, arr3(,%r10,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_matmul_10_middle_loop

.L_matmul_10_middle_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_matmul_10_outer_loop

.L_matmul_10_outer_loop_end:

# 33rd part
    # add, 10th
    movl    $0, -4(%rbp)              # i = 0
.L_add_10_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_add_10_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_add_10_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_add_10_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Add arr2[i][j]
    addsd   arr2(,%rax,1), %xmm0

    # Add arr3[i][j]
    addsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_add_10_inner_loop

.L_add_10_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_add_10_outer_loop

.L_add_10_outer_loop_end:

# 34th part
    # mul, 10th
    movl    $0, -4(%rbp)              # i = 0
.L_mul_10_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_mul_10_outer_loop_end

    movl    $0, -8(%rbp)              # j = 0
.L_mul_10_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_mul_10_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load arr1[i][j]
    movsd   arr1(,%rax,1), %xmm0

    # Multiply with arr2[i][j]
    mulsd   arr2(,%rax,1), %xmm0

    # Multiply with arr3[i][j]
    mulsd   arr3(,%rax,1), %xmm0

    # Add to result[i][j]
    addsd   result(,%rax,1), %xmm0
    movsd   %xmm0, result(,%rax,1)

    incl    -8(%rbp)                  # j++
    jmp     .L_mul_10_inner_loop

.L_mul_10_inner_loop_end:
    incl    -4(%rbp)                  # i++
    jmp     .L_mul_10_outer_loop

.L_mul_10_outer_loop_end:

# 35th part
    # print
    movl    $0, -4(%rbp)              # i = 0
.L_print_outer_loop:
    cmpl    $10, -4(%rbp)
    jge     .L_print_outer_loop_end

    # Print opening bracket
    movl    $.LC_open_bracket, %edi
    movl    $0, %eax
    call    printf@PLT

    movl    $0, -8(%rbp)              # j = 0
.L_print_inner_loop:
    cmpl    $10, -8(%rbp)
    jge     .L_print_inner_loop_end

    # Calculate offset
    movl    -4(%rbp), %eax            # i
    imull   $80, %eax, %eax
    movl    -8(%rbp), %edx            # j
    imull   $8, %edx, %edx
    addl    %edx, %eax                # offset for [i][j]

    # Load result[i][j]
    movsd   result(,%rax,1), %xmm0

    # Print result[i][j]
    movl    $.LC_float_format, %edi
    movl    $1, %eax
    call    printf@PLT

    # Check if j != 9
    cmpl    $9, -8(%rbp)
    je      .L_skip_comma

    # Print comma and space
    movl    $.LC_comma_space, %edi
    movl    $0, %eax
    call    printf@PLT

.L_skip_comma:
    incl    -8(%rbp)                  # j++
    jmp     .L_print_inner_loop

.L_print_inner_loop_end:
    # Print closing bracket and newline
    movl    $.LC_close_bracket_newline, %edi
    movl    $0, %eax
    call    printf@PLT

    incl    -4(%rbp)                  # i++
    jmp     .L_print_outer_loop

.L_print_outer_loop_end:
# 36th part
    # Function epilogue
    movl    $0, %eax        # Return value 0
    leave
    ret

    .size   main, .-main

# numeric values, generated from 3rd
    # Define the floating-point constants
.L_init_val_1:
    .double 1.0
.L_init_val_2:
    .double 2.0
.L_init_val_3:
    .double 3.0
.L_init_val_4:
    .double 4.0
.L_init_val_5:
    .double 5.0
.L_init_val_6:
    .double 6.0
.L_init_val_7:
    .double 7.0
.L_init_val_8:
    .double 8.0
.L_init_val_9:
    .double 9.0
.L_init_val_10:
    .double 10.0
# String constants, from 35th
.LC_open_bracket:
    .string "["
.LC_float_format:
    .string "%.3f"
.LC_comma_space:
    .string ", "
.LC_close_bracket_newline:
    .string "]\n"