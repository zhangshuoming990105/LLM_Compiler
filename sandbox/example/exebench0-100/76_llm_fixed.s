    .text
    .globl  isspec
isspec:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movb    %dil, -1(%rbp)      # c_0

    movb    -1(%rbp), %al
    cmpb    $'!', %al
    jl      .L1
    cmpb    $'/', %al
    jle     .L2
.L1:
    movb    -1(%rbp), %al
    cmpb    $':', %al
    jl      .L3
    cmpb    $'@', %al
    jle     .L2
.L3:
    movb    -1(%rbp), %al
    cmpb    $'[', %al
    jl      .L4
    cmpb    $'`', %al
    jle     .L2
.L4:
    movb    -1(%rbp), %al
    cmpb    $'{', %al
    jl      .L5
    cmpb    $127, %al          # ASCII value for 'DEL'
    jle     .L2
.L5:
    movl    $0, %eax
    jmp     .L6
.L2:
    movl    $1, %eax
.L6:
    leave
    ret
    