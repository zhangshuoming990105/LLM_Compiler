    .text
    .globl  matrix_mul_const
    .type   matrix_mul_const, @function
matrix_mul_const:
.LFB0:
    endbr64                     # Enable Intel CET protection
    pushq   %rbp                # Save old base pointer
    movq    %rsp, %rbp          # Set up new base pointer
    subq    $32, %rsp           # Allocate 32 bytes on stack

    # Function parameters:
    movl    %edi, -20(%rbp)     # Store N (1st argument) on stack
    movq    %rsi, -32(%rbp)     # Store C (2nd argument) on stack
    movq    %rdx, -40(%rbp)     # Store A (3rd argument) on stack
    movswl  %cx, %ecx           # Sign-extend val (4th argument) from 16 to 32 bits
    movl    %ecx, -44(%rbp)     # Store val on stack

    movl    $0, -8(%rbp)        # Initialize i = 0
    jmp     .L2                 # Jump to outer loop condition

.L3:                            # Start of outer loop body
    movl    $0, -12(%rbp)       # Initialize j = 0
    jmp     .L4                 # Jump to inner loop condition

.L5:                            # Start of inner loop body
    # Calculate index: i * N + j
    movl    -8(%rbp), %eax      # Load i into eax
    imull   -20(%rbp), %eax     # Multiply by N
    movl    -12(%rbp), %edx     # Load j into edx
    leal    (%rax,%rdx), %eax   # Calculate i * N + j (use LEA for efficiency)

    # Load A[i * N + j], sign-extend to 32 bits, and multiply by val
    cltq                        # Sign-extend eax to rax
    movq    -40(%rbp), %rdx     # Load address of A
    movswl  (%rdx,%rax,2), %eax # Load A[i * N + j] and sign-extend to 32 bits
    imull   -44(%rbp), %eax     # Multiply by val

    # Store result in C[i * N + j]
    movl    -8(%rbp), %edx      # Load i into edx
    imull   -20(%rbp), %edx     # Multiply by N
    addl    -12(%rbp), %edx     # Add j to get i * N + j
    cltq                        # Sign-extend eax to rax (result of multiplication)
    movq    -32(%rbp), %rcx     # Load address of C
    movl    %eax, (%rcx,%rdx,4) # Store result in C[i * N + j]

    addl    $1, -12(%rbp)       # Increment j

.L4:                            # Inner loop condition
    movl    -12(%rbp), %eax     # Load j
    cmpl    -20(%rbp), %eax     # Compare j with N
    jl      .L5                 # If j < N, continue inner loop

    addl    $1, -8(%rbp)        # Increment i

.L2:                            # Outer loop condition
    movl    -8(%rbp), %eax      # Load i
    cmpl    -20(%rbp), %eax     # Compare i with N
    jl      .L3                 # If i < N, continue outer loop

    leave                       # Restore stack and base pointer
    ret                         # Return from function
