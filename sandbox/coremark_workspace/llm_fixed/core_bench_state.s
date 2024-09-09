    .text
# Struct definitions:
# enum CORE_STATE {
#   CORE_START = 0,
#   CORE_INVALID = 1,
#   CORE_S1 = 2,
#   CORE_S2 = 3,
#   CORE_INT = 4,
#   CORE_FLOAT = 5,
#   CORE_EXPONENT = 6,
#   CORE_SCIENTIFIC = 7,
#   NUM_CORE_STATES = 8
# }

    .globl    core_bench_state
    .type    core_bench_state, @function
core_bench_state:
.L_core_bench_state_entry:
    # Function prologue
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $144, %rsp        # Allocate space for local variables and arrays

    # Save parameters
    movl    %edi, -100(%rbp)  # blksize
    movq    %rsi, -108(%rbp)  # memblock
    movw    %dx, -110(%rbp)   # seed1
    movw    %cx, -112(%rbp)   # seed2
    movw    %r8w, -114(%rbp)  # step
    movw    %r9w, -116(%rbp)  # crc

    # Initialize final_counts and track_counts arrays
    movl    $0, -4(%rbp)      # i = 0
.L_init_loop:
    cmpl    $8, -4(%rbp)      # Compare i with NUM_CORE_STATES (8)
    jge     .L_end_init_loop

    movl    -4(%rbp), %eax
    movl    $0, -48(%rbp,%rax,4)  # final_counts[i] = 0
    movl    $0, -80(%rbp,%rax,4)  # track_counts[i] = 0

    addl    $1, -4(%rbp)      # i++
    jmp     .L_init_loop

.L_end_init_loop:
    # Rest of the function will be implemented in subsequent steps
    # Initialize p with memblock
    movq    -108(%rbp), %rax  # Load memblock address
    movq    %rax, -88(%rbp)   # p = memblock

.L_while_loop1:
    # while (*p != 0)
    movq    -88(%rbp), %rax   # Load p
    movzbl  (%rax), %eax      # Load *p
    testb   %al, %al
    je      .L_end_while1

    # Prepare arguments for core_state_transition
    leaq    -88(%rbp), %rax   # &p
    leaq    -80(%rbp), %rdx   # track_counts
    movq    %rax, %rdi        # First argument: &p
    movq    %rdx, %rsi        # Second argument: track_counts
    call    core_state_transition

    # fstate is now in %eax
    movl    %eax, %eax        # Zero-extend to use as index
    addl    $1, -48(%rbp,%rax,4)  # final_counts[fstate]++

    jmp     .L_while_loop1

.L_end_while1:
    # Next part of the function will be implemented in subsequent steps
    # Reset p to memblock
    movq    -108(%rbp), %rax  # Load memblock address
    movq    %rax, -88(%rbp)   # p = memblock

.L_while_loop2:
    # Calculate memblock + blksize
    movq    -108(%rbp), %rax  # Load memblock address
    movl    -100(%rbp), %edx  # Load blksize
    addq    %rdx, %rax        # memblock + blksize

    # Compare p with (memblock + blksize)
    cmpq    %rax, -88(%rbp)
    jge     .L_end_while2

    # if (*p != ',')
    movq    -88(%rbp), %rax
    movzbl  (%rax), %eax
    cmpb    $44, %al          # Compare with ','
    je      .L_skip_xor1

    # *p ^= (u8)seed1
    movq    -88(%rbp), %rax
    movzbl  (%rax), %edx
    movzwl  -110(%rbp), %eax  # Load seed1
    xorb    %al, %dl
    movq    -88(%rbp), %rax
    movb    %dl, (%rax)

.L_skip_xor1:
    # p += step
    movzwl  -114(%rbp), %eax  # Load step
    movswl  %ax, %eax
    cltq
    addq    %rax, -88(%rbp)

    jmp     .L_while_loop2

.L_end_while2:
    # Next part of the function will be implemented in subsequent steps
    # Reset p to memblock
    movq    -108(%rbp), %rax  # Load memblock address
    movq    %rax, -88(%rbp)   # p = memblock

.L_while_loop3:
    # while (*p != 0)
    movq    -88(%rbp), %rax   # Load p
    movzbl  (%rax), %eax      # Load *p
    testb   %al, %al
    je      .L_end_while3

    # Prepare arguments for core_state_transition
    leaq    -88(%rbp), %rax   # &p
    leaq    -80(%rbp), %rdx   # track_counts
    movq    %rax, %rdi        # First argument: &p
    movq    %rdx, %rsi        # Second argument: track_counts
    call    core_state_transition

    # fstate is now in %eax
    movl    %eax, %eax        # Zero-extend to use as index
    addl    $1, -48(%rbp,%rax,4)  # final_counts[fstate]++

    jmp     .L_while_loop3

.L_end_while3:
    # Next part of the function will be implemented in subsequent steps
    # Reset p to memblock
    movq    -108(%rbp), %rax  # Load memblock address
    movq    %rax, -88(%rbp)   # p = memblock

.L_while_loop4:
    # Calculate memblock + blksize
    movq    -108(%rbp), %rax  # Load memblock address
    movl    -100(%rbp), %edx  # Load blksize
    addq    %rdx, %rax        # memblock + blksize

    # Compare p with (memblock + blksize)
    cmpq    %rax, -88(%rbp)
    jge     .L_end_while4

    # if (*p != ',')
    movq    -88(%rbp), %rax
    movzbl  (%rax), %eax
    cmpb    $44, %al          # Compare with ','
    je      .L_skip_xor2

    # *p ^= (u8)seed2
    movq    -88(%rbp), %rax
    movzbl  (%rax), %edx
    movzwl  -112(%rbp), %eax  # Load seed2
    xorb    %al, %dl
    movq    -88(%rbp), %rax
    movb    %dl, (%rax)

.L_skip_xor2:
    # p += step
    movzwl  -114(%rbp), %eax  # Load step
    movswl  %ax, %eax         # Sign-extend to 32 bits
    cltq                      # Sign-extend to 64 bits
    addq    %rax, -88(%rbp)

    jmp     .L_while_loop4

.L_end_while4:
    # Next part of the function will be implemented in subsequent steps

    # Initialize loop counter
    movl    $0, -4(%rbp)      # i = 0

.L_for_loop:
    cmpl    $8, -4(%rbp)      # Compare i with NUM_CORE_STATES (8)
    jge     .L_end_for

    # Load final_counts[i]
    movl    -4(%rbp), %eax
    movl    -48(%rbp,%rax,4), %eax
    movl    %eax, %edi        # First argument for crcu32

    # Load current crc
    movzwl  -116(%rbp), %esi  # Second argument for crcu32

    call    crcu32
    movw    %ax, -116(%rbp)   # Store result back to crc

    # Load track_counts[i]
    movl    -4(%rbp), %eax
    movl    -80(%rbp,%rax,4), %eax
    movl    %eax, %edi        # First argument for crcu32

    # Load current crc
    movzwl  -116(%rbp), %esi  # Second argument for crcu32

    call    crcu32
    movw    %ax, -116(%rbp)   # Store result back to crc

    addl    $1, -4(%rbp)      # i++
    jmp     .L_for_loop

.L_end_for:
    # Return crc
    movzwl  -116(%rbp), %eax

    # Function epilogue
    addq    $144, %rsp
    popq    %rbp
    ret