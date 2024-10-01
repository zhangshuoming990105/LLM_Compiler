
    .text
    .globl  isoperator
    .type   isoperator, @function
isoperator:
.LFB0:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    movb    %dil, -1(%rbp)    # Store char c argument

    # Function body
    movzbl  -1(%rbp), %eax    # Load c into eax
    cmpb    $44, %al          # Compare with ','
    je      .L_return_true
    cmpb    $124, %al         # Compare with '|'
    je      .L_return_true
    cmpb    $54, %al          # Compare with '6'
    je      .L_return_true
    cmpb    $94, %al          # Compare with '^'
    je      .L_return_true
    cmpb    $61, %al          # Compare with '='
    je      .L_return_true
    cmpb    $33, %al          # Compare with '!'
    je      .L_return_true
    cmpb    $60, %al          # Compare with '<'
    je      .L_return_true
    cmpb    $62, %al          # Compare with '>'
    je      .L_return_true
    cmpb    $43, %al          # Compare with '+'
    je      .L_return_true
    cmpb    $45, %al          # Compare with '-'
    je      .L_return_true
    cmpb    $37, %al          # Compare with '%'
    je      .L_return_true
    cmpb    $47, %al          # Compare with '/'
    je      .L_return_true
    cmpb    $42, %al          # Compare with '*'
    je      .L_return_true
    cmpb    $126, %al         # Compare with '~'
    je      .L_return_true
    cmpb    $40, %al          # Compare with '('
    je      .L_return_true
    cmpb    $41, %al          # Compare with ')'
    je      .L_return_true
    cmpb    $91, %al          # Compare with '['
    je      .L_return_true
    cmpb    $93, %al          # Compare with ']'
    je      .L_return_true
    cmpb    $46, %al          # Compare with '.'
    je      .L_return_true
    cmpb    $59, %al          # Compare with ';'
    je      .L_return_true
    cmpb    $39, %al          # Compare with '\''
    je      .L_return_true
    cmpb    $34, %al          # Compare with '"'
    je      .L_return_true

    # If none of the above conditions are met, return false
    movl    $0, %eax
    jmp     .L_return

.L_return_true:
    movl    $1, %eax

.L_return:
    # Epilogue
    popq    %rbp
    ret

.LFE0:
    .size   isoperator, .-isoperator
