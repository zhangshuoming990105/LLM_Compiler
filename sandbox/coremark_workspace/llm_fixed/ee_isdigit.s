    .text
    .globl  ee_isdigit
    .type   ee_isdigit, @function
ee_isdigit:
.LFB0:
    endbr64                     # Enable Intel Control-flow Enforcement Technology
    pushq   %rbp                # Save the old base pointer
    movq    %rsp, %rbp          # Set up new base pointer
    subq    $16, %rsp           # Allocate 16 bytes on the stack

    # Error: The function parameter should be in %dil (8-bit part of %rdi), not %rdi
    # Fix: Change movb %rdi, -1(%rbp) to movb %dil, -1(%rbp)
    movb    %dil, -1(%rbp)      # Store the input character 'c' on the stack

    movzbl  -1(%rbp), %eax      # Load 'c' into %eax, zero-extended
    cmpb    $48, %al            # Compare 'c' with '0' (ASCII 48)
    setge   %dl                 # Set %dl to 1 if 'c' >= '0', 0 otherwise

    movzbl  -1(%rbp), %eax      # Load 'c' into %eax again (unnecessary, can be optimized)
    cmpb    $57, %al            # Compare 'c' with '9' (ASCII 57)
    setle   %al                 # Set %al to 1 if 'c' <= '9', 0 otherwise

    andb    %dl, %al            # Combine results: %al = ('c' >= '0') & ('c' <= '9')

    # Error: Unnecessary moves, can directly return %al
    # Fix: Remove the following three instructions
    # movzbl  %al, %eax         # Zero-extend %al to %eax (unnecessary)
    # movb    %al, -2(%rbp)     # Store result on stack (unnecessary)
    # movzbl  -2(%rbp), %eax    # Load result back to %eax (unnecessary)

    # No need for 'leave' instruction, can directly adjust %rsp
    addq    $16, %rsp           # Deallocate stack space
    popq    %rbp                # Restore old base pointer
    ret                         # Return, result is already in %al