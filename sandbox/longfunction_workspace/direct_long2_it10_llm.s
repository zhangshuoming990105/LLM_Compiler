    .text
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
trigger: 
    .long 3, 8, 14, 20, 25, 30, 35, 40, 43, 57
init_val: 
    .double 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0
fmt_str: 
    .string "[%.3f, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f]\n"

.text
.globl main
main:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp    # Allocate stack space for local variables

    # Initialize arrays
    movl $0, -4(%rbp)     # i = 0
.init_i_loop:
    cmpl $10, -4(%rbp)
    jge .init_done
    movl $0, -8(%rbp)     # j = 0
.init_j_loop:
    cmpl $10, -8(%rbp)
    jge .init_i_next
    
    # Calculate array index
    movl -4(%rbp), %eax
    imull $80, %eax
    addl -8(%rbp), %eax
    imull $8, %eax
    
    # Set arr1[i][j] = arr2[i][j] = arr3[i][j] = result[i][j] = 0
    movsd .LC0(%rip), %xmm0
    movsd %xmm0, arr1(,%rax,1)
    movsd %xmm0, arr2(,%rax,1)
    movsd %xmm0, arr3(,%rax,1)
    movsd %xmm0, result(,%rax,1)
    
    incl -8(%rbp)
    jmp .init_j_loop
.init_i_next:
    incl -4(%rbp)
    jmp .init_i_loop
.init_done:

    # Set values
    movl $0, -4(%rbp)     # i = 0
.set_i_loop:
    cmpl $10, -4(%rbp)
    jge .set_done
    movl $0, -8(%rbp)     # j = 0
.set_j_loop:
    cmpl $10, -8(%rbp)
    jge .set_i_next
    movl $0, -12(%rbp)    # k = 0
.set_k_loop:
    cmpl $10, -12(%rbp)
    jge .set_j_next
    
    # Calculate i * 10 + j
    movl -4(%rbp), %eax
    imull $10, %eax
    addl -8(%rbp), %eax
    
    # Compare with trigger[k]
    cmpl trigger(,%r12,4), %eax
    jne .set_continue
    
    # Calculate array index
    movl -4(%rbp), %eax
    imull $80, %eax
    addl -8(%rbp), %eax
    imull $8, %eax
    
    # Set arr1[i][j] = arr2[i][j] = arr3[i][j] = init_val[k]
    movsd init_val(,%r12,8), %xmm0
    movsd %xmm0, arr1(,%rax,1)
    movsd %xmm0, arr2(,%rax,1)
    movsd %xmm0, arr3(,%rax,1)
    
.set_continue:
    incl -12(%rbp)
    jmp .set_k_loop
.set_j_next:
    incl -8(%rbp)
    jmp .set_j_loop
.set_i_next:
    incl -4(%rbp)
    jmp .set_i_loop
.set_done:

    # Matrix operations (repeated 10 times)
    movl $0, -16(%rbp)    # Counter for repetitions
.repeat_ops:
    cmpl $10, -16(%rbp)
    jge .repeat_done

    # matmul
    movl $0, -4(%rbp)     # i = 0
.matmul_i_loop:
    cmpl $10, -4(%rbp)
    jge .matmul_done
    movl $0, -8(%rbp)     # j = 0
.matmul_j_loop:
    cmpl $10, -8(%rbp)
    jge .matmul_i_next
    movl $0, -12(%rbp)    # k = 0
.matmul_k_loop:
    cmpl $10, -12(%rbp)
    jge .matmul_j_next
    
    # Calculate indices
    movl -4(%rbp), %eax
    imull $80, %eax
    addl -8(%rbp), %eax
    movl %eax, %r13d
    
    movl -4(%rbp), %eax
    imull $80, %eax
    addl -12(%rbp), %eax
    movl %eax, %r14d
    
    movl -12(%rbp), %eax
    imull $80, %eax
    addl -8(%rbp), %eax
    movl %eax, %r15d
    
    # arr3[i][j] += arr1[i][k] * arr2[k][j]
    movsd arr1(,%r14,8), %xmm0
    mulsd arr2(,%r15,8), %xmm0
    addsd arr3(,%r13,8), %xmm0
    movsd %xmm0, arr3(,%r13,8)
    
    incl -12(%rbp)
    jmp .matmul_k_loop
.matmul_j_next:
    incl -8(%rbp)
    jmp .matmul_j_loop
.matmul_i_next:
    incl -4(%rbp)
    jmp .matmul_i_loop
.matmul_done:

    # add
    movl $0, -4(%rbp)     # i = 0
.add_i_loop:
    cmpl $10, -4(%rbp)
    jge .add_done
    movl $0, -8(%rbp)     # j = 0
.add_j_loop:
    cmpl $10, -8(%rbp)
    jge .add_i_next
    
    # Calculate index
    movl -4(%rbp), %eax
    imull $80, %eax
    addl -8(%rbp), %eax
    imull $8, %eax
    movl %eax, %r13d
    
    # result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j]
    movsd arr1(,%r13,1), %xmm0
    addsd arr2(,%r13,1), %xmm0
    addsd arr3(,%r13,1), %xmm0
    addsd result(,%r13,1), %xmm0
    movsd %xmm0, result(,%r13,1)
    
    incl -8(%rbp)
    jmp .add_j_loop
.add_i_next:
    incl -4(%rbp)
    jmp .add_i_loop
.add_done:

    # mul
    movl $0, -4(%rbp)     # i = 0
.mul_i_loop:
    cmpl $10, -4(%rbp)
    jge .mul_done
    movl $0, -8(%rbp)     # j = 0
.mul_j_loop:
    cmpl $10, -8(%rbp)
    jge .mul_i_next
    
    # Calculate index
    movl -4(%rbp), %eax
    imull $80, %eax
    addl -8(%rbp), %eax
    imull $8, %eax
    movl %eax, %r13d
    
    # result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j]
    movsd arr1(,%r13,1), %xmm0
    mulsd arr2(,%r13,1), %xmm0
    mulsd arr3(,%r13,1), %xmm0
    addsd result(,%r13,1), %xmm0
    movsd %xmm0, result(,%r13,1)
    
    incl -8(%rbp)
    jmp .mul_j_loop
.mul_i_next:
    incl -4(%rbp)
    jmp .mul_i_loop
.mul_done:

    incl -16(%rbp)
    jmp .repeat_ops
.repeat_done:

    # Special case: set arr3 to 0 (needle)
    movl $0, -4(%rbp)     # i = 0
.needle_i_loop:
    cmpl $10, -4(%rbp)
    jge .needle_done
    movl $0, -8(%rbp)     # j = 0
.needle_j_loop:
    cmpl $10, -8(%rbp)
    jge .needle_i_next
    
    # Calculate index
    movl -4(%rbp), %eax
    imull $80, %eax
    addl -8(%rbp), %eax
    imull $8, %eax
    
    # arr3[i][j] = 0
    movsd .LC0(%rip), %xmm0
    movsd %xmm0, arr3(,%rax,1)
    
    incl -8(%rbp)
    jmp .needle_j_loop
.needle_i_next:
    incl -4(%rbp)
    jmp .needle_i_loop
.needle_done:

    # Final add and mul operations
    jmp .add_i_loop
    jmp .mul_i_loop

    # Print results
    movl $0, -4(%rbp)     # i = 0
.print_i_loop:
    cmpl $10, -4(%rbp)
    jge .print_done
    
    # Load array values into XMM registers
    movl -4(%rbp), %eax
    imull $80, %eax
    leaq result(,%rax,8), %rax
    movsd (%rax), %xmm0
    movsd 8(%rax), %xmm1
    movsd 16(%rax), %xmm2
    movsd 24(%rax), %xmm3
    movsd 32(%rax), %xmm4
    movsd 40(%rax), %xmm5
    movsd 48(%rax), %xmm6
    movsd 56(%rax), %xmm7
    movsd 64(%rax), %xmm8
    movsd 72(%rax), %xmm9
    
    # Call printf
    movl $fmt_str, %edi
    movl $10, %eax    # number of vector registers used
    call printf
    
    incl -4(%rbp)
    jmp .print_i_loop
.print_done:

    movl $0, %eax     # Return 0
    leave
    ret

.LC0:
    .double 0.0
