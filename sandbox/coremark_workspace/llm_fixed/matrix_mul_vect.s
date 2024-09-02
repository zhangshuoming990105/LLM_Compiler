    .text
    .globl    matrix_mul_vect
    .type    matrix_mul_vect, @function
matrix_mul_vect:
.LFB0:
    endbr64
    pushq    %rbp
    movq    %rsp, %rbp
    pushq    %rbx            # Save callee-saved register
    subq    $40, %rsp        # Allocate 40 bytes on stack (aligned to 16 bytes)

    movl    %edi, -36(%rbp)  # Store N (1st argument)
    movq    %rsi, -48(%rbp)  # Store C (2nd argument)
    movq    %rdx, -56(%rbp)  # Store A (3rd argument)
    movq    %rcx, -64(%rbp)  # Store B (4th argument)

    movl    $0, -20(%rbp)    # Initialize i = 0
    jmp    .L2               # Jump to outer loop condition

.L3:    # Start of outer loop body
    movl    -20(%rbp), %eax  # Load i
    cltq                     # Convert i to 64-bit for array indexing
    leaq    0(,%rax,4), %rdx # Calculate i * 4
    movq    -48(%rbp), %rax  # Load C
    addq    %rdx, %rax       # Calculate address of C[i]
    movl    $0, (%rax)       # Set C[i] = 0

    movl    $0, -24(%rbp)    # Initialize j = 0
    jmp    .L4               # Jump to inner loop condition

.L5:    # Start of inner loop body
    movl    -20(%rbp), %eax  # Load i
    imull   -36(%rbp), %eax  # Multiply i * N
    movl    %eax, %edx
    movl    -24(%rbp), %eax  # Load j
    addl    %edx, %eax       # Calculate i * N + j
    cltq                     # Convert to 64-bit for array indexing
    leaq    0(,%rax,2), %rdx # Calculate (i * N + j) * 2
    movq    -56(%rbp), %rax  # Load A
    addq    %rdx, %rax       # Calculate address of A[i * N + j]
    movswl  (%rax), %ebx     # Load A[i * N + j] and sign-extend to 32-bit

    movl    -24(%rbp), %eax  # Load j
    cltq                     # Convert j to 64-bit for array indexing
    leaq    0(,%rax,2), %rdx # Calculate j * 2
    movq    -64(%rbp), %rax  # Load B
    addq    %rdx, %rax       # Calculate address of B[j]
    movswl  (%rax), %eax     # Load B[j] and sign-extend to 32-bit

    imull   %ebx, %eax       # Multiply A[i * N + j] * B[j]

    movl    -20(%rbp), %edx  # Load i
    movslq  %edx, %rdx       # Convert i to 64-bit for array indexing
    leaq    0(,%rdx,4), %rdx # Calculate i * 4
    movq    -48(%rbp), %rcx  # Load C
    addq    %rcx, %rdx       # Calculate address of C[i]
    addl    %eax, (%rdx)     # Add result to C[i]

    addl    $1, -24(%rbp)    # j++

.L4:    # Inner loop condition
    movl    -24(%rbp), %eax  # Load j
    cmpl    -36(%rbp), %eax  # Compare j with N
    jl    .L5                # If j < N, continue inner loop

    addl    $1, -20(%rbp)    # i++

.L2:    # Outer loop condition
    movl    -20(%rbp), %eax  # Load i
    cmpl    -36(%rbp), %eax  # Compare i with N
    jl    .L3                # If i < N, continue outer loop

    addq    $40, %rsp        # Deallocate stack space
    popq    %rbx             # Restore callee-saved register
    popq    %rbp             # Restore base pointer
    ret                      # Return from function
