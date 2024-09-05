    .text
    .globl  core_state_transition
    .type   core_state_transition, @function
core_state_transition:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp
    
    # Save parameters
    movq    %rdi, -24(%rbp)  # instr
    movq    %rsi, -32(%rbp)  # transition_count

    # u8 *str = *instr;
    movq    -24(%rbp), %rax
    movq    (%rax), %rax
    movq    %rax, -8(%rbp)   # str

    # enum CORE_STATE state = CORE_START;
    movl    $0, -12(%rbp)    # state

.LFOR_LOOP:
    # for (; *str && state != CORE_INVALID; str++)
    movq    -8(%rbp), %rax
    movzbl  (%rax), %eax
    movb    %al, -13(%rbp)   # NEXT_SYMBOL = *str
    
    # if (NEXT_SYMBOL == ',')
    cmpb    $44, -13(%rbp)
    jne     .LSWITCH_START
    addq    $1, -8(%rbp)     # str++
    jmp     .LEND_LOOP

.LSWITCH_START:
    # switch (state)
    cmpl    $7, -12(%rbp)
    je      .LCASE_CORE_SCIENTIFIC
    cmpl    $7, -12(%rbp)
    ja      .LDEFAULT
    cmpl    $6, -12(%rbp)
    je      .LCASE_CORE_EXPONENT
    cmpl    $6, -12(%rbp)
    ja      .LDEFAULT
    cmpl    $5, -12(%rbp)
    je      .LCASE_CORE_FLOAT
    cmpl    $5, -12(%rbp)
    ja      .LDEFAULT
    cmpl    $4, -12(%rbp)
    je      .LCASE_CORE_INT
    cmpl    $4, -12(%rbp)
    ja      .LDEFAULT
    cmpl    $3, -12(%rbp)
    je      .LCASE_CORE_S2
    cmpl    $3, -12(%rbp)
    ja      .LDEFAULT
    cmpl    $0, -12(%rbp)
    je      .LCASE_CORE_START
    cmpl    $2, -12(%rbp)
    je      .LCASE_CORE_S1
    jmp     .LDEFAULT

.LCASE_CORE_START:
    # if (ee_isdigit(NEXT_SYMBOL))
    movzbl  -13(%rbp), %eax
    movl    %eax, %edi
    call    ee_isdigit@PLT
    testb   %al, %al
    je      .LCORE_START_NOT_DIGIT
    movl    $4, -12(%rbp)    # state = CORE_INT
    jmp     .LCORE_START_END

.LCORE_START_NOT_DIGIT:
    # else if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
    cmpb    $43, -13(%rbp)
    je      .LCORE_START_SIGN
    cmpb    $45, -13(%rbp)
    jne     .LCORE_START_NOT_SIGN
.LCORE_START_SIGN:
    movl    $2, -12(%rbp)    # state = CORE_S1
    jmp     .LCORE_START_END

.LCORE_START_NOT_SIGN:
    # else if (NEXT_SYMBOL == '.')
    cmpb    $46, -13(%rbp)
    jne     .LCORE_START_INVALID
    movl    $5, -12(%rbp)    # state = CORE_FLOAT
    jmp     .LCORE_START_END

.LCORE_START_INVALID:
    # else
    movl    $1, -12(%rbp)    # state = CORE_INVALID
    movq    -32(%rbp), %rax
    addq    $4, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_INVALID]++

.LCORE_START_END:
    movq    -32(%rbp), %rax
    movl    (%rax), %eax
    leal    1(%rax), %edx
    movq    -32(%rbp), %rax
    movl    %edx, (%rax)     # transition_count[CORE_START]++
    jmp     .LSWITCH_END

.LCASE_CORE_S1:
    # if (ee_isdigit(NEXT_SYMBOL))
    movzbl  -13(%rbp), %eax
    movl    %eax, %edi
    call    ee_isdigit@PLT
    testb   %al, %al
    je      .LCORE_S1_NOT_DIGIT
    movl    $4, -12(%rbp)    # state = CORE_INT
    jmp     .LCORE_S1_END

.LCORE_S1_NOT_DIGIT:
    # else if (NEXT_SYMBOL == '.')
    cmpb    $46, -13(%rbp)
    jne     .LCORE_S1_INVALID
    movl    $5, -12(%rbp)    # state = CORE_FLOAT
    jmp     .LCORE_S1_END

.LCORE_S1_INVALID:
    # else
    movl    $1, -12(%rbp)    # state = CORE_INVALID

.LCORE_S1_END:
    movq    -32(%rbp), %rax
    addq    $8, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_S1]++
    jmp     .LSWITCH_END

.LCASE_CORE_INT:
    # if (NEXT_SYMBOL == '.')
    cmpb    $46, -13(%rbp)
    jne     .LCORE_INT_NOT_DOT
    movl    $5, -12(%rbp)    # state = CORE_FLOAT
    jmp     .LCORE_INT_END

.LCORE_INT_NOT_DOT:
    # else if (!ee_isdigit(NEXT_SYMBOL))
    movzbl  -13(%rbp), %eax
    movl    %eax, %edi
    call    ee_isdigit@PLT
    testb   %al, %al
    jne     .LCORE_INT_END
    movl    $1, -12(%rbp)    # state = CORE_INVALID

.LCORE_INT_END:
    movq    -32(%rbp), %rax
    addq    $16, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_INT]++
    jmp     .LSWITCH_END

.LCASE_CORE_FLOAT:
    # if (NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e')
    cmpb    $69, -13(%rbp)
    je      .LCORE_FLOAT_EXP
    cmpb    $101, -13(%rbp)
    jne     .LCORE_FLOAT_NOT_EXP
.LCORE_FLOAT_EXP:
    movl    $3, -12(%rbp)    # state = CORE_S2
    jmp     .LCORE_FLOAT_END

.LCORE_FLOAT_NOT_EXP:
    # else if (!ee_isdigit(NEXT_SYMBOL))
    movzbl  -13(%rbp), %eax
    movl    %eax, %edi
    call    ee_isdigit@PLT
    testb   %al, %al
    jne     .LCORE_FLOAT_END
    movl    $1, -12(%rbp)    # state = CORE_INVALID

.LCORE_FLOAT_END:
    movq    -32(%rbp), %rax
    addq    $20, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_FLOAT]++
    jmp     .LSWITCH_END

.LCASE_CORE_S2:
    # if (NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-')
    cmpb    $43, -13(%rbp)
    je      .LCORE_S2_SIGN
    cmpb    $45, -13(%rbp)
    jne     .LCORE_S2_INVALID
.LCORE_S2_SIGN:
    movl    $6, -12(%rbp)    # state = CORE_EXPONENT
    jmp     .LCORE_S2_END

.LCORE_S2_INVALID:
    # else
    movl    $1, -12(%rbp)    # state = CORE_INVALID

.LCORE_S2_END:
    movq    -32(%rbp), %rax
    addq    $12, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_S2]++
    jmp     .LSWITCH_END

.LCASE_CORE_EXPONENT:
    # if (ee_isdigit(NEXT_SYMBOL))
    movzbl  -13(%rbp), %eax
    movl    %eax, %edi
    call    ee_isdigit@PLT
    testb   %al, %al
    je      .LCORE_EXPONENT_INVALID
    movl    $7, -12(%rbp)    # state = CORE_SCIENTIFIC
    jmp     .LCORE_EXPONENT_END

.LCORE_EXPONENT_INVALID:
    # else
    movl    $1, -12(%rbp)    # state = CORE_INVALID

.LCORE_EXPONENT_END:
    movq    -32(%rbp), %rax
    addq    $24, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_EXPONENT]++
    jmp     .LSWITCH_END

.LCASE_CORE_SCIENTIFIC:
    # if (!ee_isdigit(NEXT_SYMBOL))
    movzbl  -13(%rbp), %eax
    movl    %eax, %edi
    call    ee_isdigit@PLT
    testb   %al, %al
    jne     .LCORE_SCIENTIFIC_END
    movl    $1, -12(%rbp)    # state = CORE_INVALID
    movq    -32(%rbp), %rax
    addq    $4, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_INVALID]++

.LCORE_SCIENTIFIC_END:
    movq    -32(%rbp), %rax
    addq    $28, %rax
    movl    (%rax), %edx
    addl    $1, %edx
    movl    %edx, (%rax)     # transition_count[CORE_SCIENTIFIC]++
    jmp     .LSWITCH_END

.LDEFAULT:
    nop

.LSWITCH_END:
    addq    $1, -8(%rbp)     # str++

    # Loop condition
    movq    -8(%rbp), %rax
    movzbl  (%rax), %eax
    testb   %al, %al
    je      .LEND_LOOP
    cmpl    $1, -12(%rbp)
    jne     .LFOR_LOOP

.LEND_LOOP:
    # *instr = str;
    movq    -24(%rbp), %rax
    movq    -8(%rbp), %rdx
    movq    %rdx, (%rax)

    # return state;
    movl    -12(%rbp), %eax

    leave
    ret
    .size   core_state_transition, .-core_state_transition
