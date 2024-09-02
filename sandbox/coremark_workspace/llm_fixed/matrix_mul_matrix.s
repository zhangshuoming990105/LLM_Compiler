    .text
    .globl    matrix_mul_matrix
    .type    matrix_mul_matrix, @function
matrix_mul_matrix:
.LFB0:
    endbr64                      # End branch 64-bit instruction (security feature)
    pushq    %rbp                # Save old base pointer
    movq    %rsp, %rbp           # Set new base pointer
    subq    $48, %rsp            # Allocate 48 bytes on stack

    # Store function parameters
    movq    %rdi, -40(%rbp)      # Store N (1st argument)
    movq    %rsi, -48(%rbp)      # Store C (2nd argument)
    movq    %rdx, -56(%rbp)      # Store A (3rd argument)
    movq    %rcx, -64(%rbp)      # Store B (4th argument)

    movl    $0, -4(%rbp)         # i = 0
    jmp    .L2                   # Jump to outer loop condition

.L3:    # Outer loop body
    movl    $0, -8(%rbp)         # j = 0
    jmp    .L4                   # Jump to middle loop condition

.L5:    # Middle loop body
    movq    -48(%rbp), %rax      # Load C into %rax
    movl    -4(%rbp), %edx       # Load i into %edx
    movslq  %edx, %rdx           # Sign-extend %edx to 64-bit (CORRECTION)
    imulq    -40(%rbp), %rdx     # Multiply i * N
    movl    -8(%rbp), %ecx       # Load j into %ecx
    addl    %ecx, %edx           # Add j to (i * N)
    movl    $0, (%rax,%rdx,4)    # C[i * N + j] = 0

    movl    $0, -12(%rbp)        # k = 0
    jmp    .L6                   # Jump to inner loop condition

.L7:    # Inner loop body
    movq    -56(%rbp), %rax      # Load A into %rax
    movl    -4(%rbp), %edx       # Load i into %edx
    movslq  %edx, %rdx           # Sign-extend %edx to 64-bit (CORRECTION)
    imulq   -40(%rbp), %rdx      # Multiply i * N
    movl    -12(%rbp), %ecx      # Load k into %ecx
    addl    %ecx, %edx           # Add k to (i * N)
    movzwl  (%rax,%rdx,2), %edx  # Load A[i * N + k] and zero-extend to 32-bit

    movq    -64(%rbp), %rax      # Load B into %rax
    movl    -12(%rbp), %ecx      # Load k into %ecx
    movslq  %ecx, %rcx           # Sign-extend %ecx to 64-bit (CORRECTION)
    imulq   -40(%rbp), %rcx      # Multiply k * N
    movl    -8(%rbp), %esi       # Load j into %esi
    addl    %esi, %ecx           # Add j to (k * N)
    movzwl  (%rax,%rcx,2), %ecx  # Load B[k * N + j] and zero-extend to 32-bit

    imull   %ecx, %edx           # Multiply A[i * N + k] * B[k * N + j]

    movq    -48(%rbp), %rax      # Load C into %rax
    movl    -4(%rbp), %ecx       # Load i into %ecx
    movslq  %ecx, %rcx           # Sign-extend %ecx to 64-bit (CORRECTION)
    imulq   -40(%rbp), %rcx      # Multiply i * N
    movl    -8(%rbp), %esi       # Load j into %esi
    addl    %esi, %ecx           # Add j to (i * N)
    addl    %edx, (%rax,%rcx,4)  # Add result to C[i * N + j]

    addl    $1, -12(%rbp)        # k++

.L6:    # Inner loop condition
    movl    -12(%rbp), %eax      # Load k into %eax
    cmpq    -40(%rbp), %rax      # Compare k with N
    jb    .L7                    # If k < N, continue inner loop

    addl    $1, -8(%rbp)         # j++

.L4:    # Middle loop condition
    movl    -8(%rbp), %eax       # Load j into %eax
    cmpq    -40(%rbp), %rax      # Compare j with N
    jb    .L5                    # If j < N, continue middle loop

    addl    $1, -4(%rbp)         # i++

.L2:    # Outer loop condition
    movl    -4(%rbp), %eax       # Load i into %eax
    cmpq    -40(%rbp), %rax      # Compare i with N
    jb    .L3                    # If i < N, continue outer loop

    leave                        # Restore stack and base pointer
    ret                          # Return from function