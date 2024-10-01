
    .text
    .globl  isoperator
    .type   isoperator, @function
isoperator:
.LF_isoperator_entry:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    movb    %dil, -1(%rbp)  # Store char c

    # Compare c with each operator
    cmpb    $',', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'|', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'6', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'^', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'=', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'!', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'<', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'>', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'+', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'-', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'%', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'/', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'*', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'~', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'(', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $')', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'[', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $']', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'.', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $';', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'\'', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $'"', -1(%rbp)
    je      .L_isoperator_true
    cmpb    $0xC, -1(%rbp)  # Corrected comparison for character 12 (form feed)
    je      .L_isoperator_true
    cmpb    $25, -1(%rbp)  # Added comparison for character 25
    je      .L_isoperator_true

    # If none of the conditions are met, return 0
    movl    $0, %eax
    jmp     .L_isoperator_end

.L_isoperator_true:
    # If any condition is met, return 1
    movl    $1, %eax

.L_isoperator_end:
    # Epilogue
    popq    %rbp
    ret
