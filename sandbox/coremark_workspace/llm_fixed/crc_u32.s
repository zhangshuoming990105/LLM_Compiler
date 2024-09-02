    .text
    .globl  crcu32
    .type   crcu32, @function
crcu32:
.LFB0:
    endbr64                     # Enable Intel Control-flow Enforcement Technology
    pushq   %rbp                # Save the old base pointer
    movq    %rsp, %rbp          # Set up new base pointer
    subq    $16, %rsp           # Allocate 16 bytes on the stack

    # Error: The order of parameters is reversed. Should be crc first, then newval
    movl    %edi, -4(%rbp)      # Store newval (32-bit) at -4(%rbp)
    movw    %si, -6(%rbp)       # Store crc (16-bit) at -6(%rbp)

    # First call to crc16
    movzwl  -6(%rbp), %esi      # Load crc into %si (zero-extended)
    movl    -4(%rbp), %edi      # Load lower 16 bits of newval into %di
    call    crc16               # Call crc16(newval & 0xFFFF, crc)
    movw    %ax, -8(%rbp)       # Store result of first crc16 call

    # Second call to crc16
    movw    -8(%rbp), %si       # Load result of first call as new crc
    movl    -4(%rbp), %eax      # Load newval into %eax
    shrl    $16, %eax           # Shift right by 16 to get upper 16 bits
    movw    %ax, %di            # Move upper 16 bits of newval to %di
    call    crc16               # Call crc16(newval >> 16, crc)
    movw    %ax, -10(%rbp)      # Store final result

    movzwl  -10(%rbp), %eax     # Load final result into %eax (zero-extended)

    leave                       # Restore the stack pointer and pop base pointer
    ret                         # Return from the function

    .size   crcu32, .-crcu32