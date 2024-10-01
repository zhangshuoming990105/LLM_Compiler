
    .text
# Function body
    .globl  isoperator
    .type   isoperator, @function
isoperator:
.LF_isoperator_entry:
	# Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movb    %dil, -4(%rbp)  # Store char c

    # Check if c matches any operator characters
    movzbl  -4(%rbp), %eax
    cmpb    $',', %al
    je      .L_return_true
    cmpb    $'|', %al
    je      .L_return_true
    cmpb    $'6', %al
    je      .L_return_true
    cmpb    $'^', %al
    je      .L_return_true
    cmpb    $'=', %al
    je      .L_return_true
    cmpb    $'!', %al
    je      .L_return_true
    cmpb    $'<', %al
    je      .L_return_true
    cmpb    $'>', %al
    je      .L_return_true
    cmpb    $'+', %al
    je      .L_return_true
    cmpb    $'-', %al
    je      .L_return_true
    cmpb    $'%', %al
    je      .L_return_true
    cmpb    $'/', %al
    je      .L_return_true
    cmpb    $'*', %al
    je      .L_return_true
    cmpb    $'~', %al
    je      .L_return_true
    cmpb    $'(', %al
    je      .L_return_true
    cmpb    $')', %al
    je      .L_return_true
    cmpb    $'[', %al
    je      .L_return_true
    cmpb    $']', %al
    je      .L_return_true
    cmpb    $'.', %al
    je      .L_return_true
    cmpb    $';', %al  # Corrected this line
    je      .L_return_true
    cmpb    $'\'', %al
    je      .L_return_true
    cmpb    $'"', %al
    je      .L_return_true

    # Default return false
    movl    $0, %eax
    jmp     .L_return

.L_return_true:
    movl    $1, %eax

.L_return:
    # Epilogue
    leave
    ret
