    .text
    .globl  big_endian
big_endian:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $8, %rsp              # Allocate space for union u

    movq    $1, -8(%rbp)          # u.l = 1

    movq    -8(%rbp), %rax
    cmpb    $1, %al               # Compare the least significant byte with 1
    #correct: movsbl    -1(%rbp), %eax        # Load u.l into %rax
    # cmpl    $1, %eax               # Compare the least significant byte with 1
    sete    %cl                   # Set %cl to 1 if comparison is true, otherwise 0
    andb    $1, %cl               # Mask %cl with 1
    movzbl  %cl, %eax             # Zero-extend %al to %eax
    leave
    ret