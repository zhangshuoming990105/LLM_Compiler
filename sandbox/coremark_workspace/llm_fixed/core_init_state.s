    .text
# String constants
    .section    .rodata
.LC_5012_str:
    .string "5012"
.LC_1234_str:
    .string "1234"
.LC_minus_874_str:
    .string "-874"
.LC_plus_122_str:
    .string "+122"
.LC_35_54400_str:
    .string "35.54400"
.LC_0_1234500_str:
    .string ".1234500"
.LC_minus_110_700_str:
    .string "-110.700"
.LC_plus_0_64400_str:
    .string "+0.64400"
.LC_5_500e_plus_3_str:
    .string "5.500e+3"
.LC_minus_123e_minus_2_str:
    .string "-.123e-2"
.LC_minus_87e_plus_832_str:
    .string "-87e+832"
.LC_plus_0_6e_minus_12_str:
    .string "+0.6e-12"
.LC_T0_3e_minus_1F_str:
    .string "T0.3e-1F"
.LC_minus_T_T_plus_plus_Tq_str:
    .string "-T.T++Tq"
.LC_1T3_4e4z_str:
    .string "1T3.4e4z"
.LC_34_0e_minus_T_caret_str:
    .string "34.0e-T^"

    .section    .data.rel.local,"aw"
    .align 32
    .type   intpat, @object
    .size   intpat, 32
intpat:
    .quad   .LC_5012_str
    .quad   .LC_1234_str
    .quad   .LC_minus_874_str
    .quad   .LC_plus_122_str

    .align 32
    .type   floatpat, @object
    .size   floatpat, 32
floatpat:
    .quad   .LC_35_54400_str
    .quad   .LC_0_1234500_str
    .quad   .LC_minus_110_700_str
    .quad   .LC_plus_0_64400_str

    .align 32
    .type   scipat, @object
    .size   scipat, 32
scipat:
    .quad   .LC_5_500e_plus_3_str
    .quad   .LC_minus_123e_minus_2_str
    .quad   .LC_minus_87e_plus_832_str
    .quad   .LC_plus_0_6e_minus_12_str

    .align 32
    .type   errpat, @object
    .size   errpat, 32
errpat:
    .quad   .LC_T0_3e_minus_1F_str
    .quad   .LC_minus_T_T_plus_plus_Tq_str
    .quad   .LC_1T3_4e4z_str
    .quad   .LC_34_0e_minus_T_caret_str

    .text
    .globl  core_init_state
    .type   core_init_state, @function
core_init_state:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $48, %rsp
    movl    %edi, -36(%rbp)        # size
    movw    %si, -38(%rbp)         # seed
    movq    %rdx, -48(%rbp)        # p

    movl    $0, -4(%rbp)           # total = 0
    movl    $0, -8(%rbp)           # next = 0
    movq    $0, -16(%rbp)          # buf = 0
    subl    $1, -36(%rbp)          # size--

.L_main_loop:
    movl    -4(%rbp), %eax         # total
    addl    -8(%rbp), %eax         # total + next
    addl    $1, %eax               # total + next + 1
    cmpl    -36(%rbp), %eax        # compare with size
    jge     .L_fill_rest

    cmpl    $0, -8(%rbp)           # if (next > 0)
    jle     .L_increment_seed

    movl    $0, -20(%rbp)          # i = 0
.L_copy_loop:
    movl    -20(%rbp), %eax        # i
    cmpl    -8(%rbp), %eax         # compare i with next
    jge     .L_add_comma

    movl    -20(%rbp), %eax        # i
    movq    -16(%rbp), %rdx        # buf
    movzbl  (%rdx,%rax), %edx      # buf[i]
    movl    -4(%rbp), %ecx         # total
    addl    -20(%rbp), %ecx        # total + i
    movq    -48(%rbp), %rax        # p
    movb    %dl, (%rax,%rcx)       # p[total + i] = buf[i]

    addl    $1, -20(%rbp)          # i++
    jmp     .L_copy_loop

.L_add_comma:
    movl    -4(%rbp), %edx         # total
    movl    -8(%rbp), %eax         # next
    addl    %eax, %edx
    movq    -48(%rbp), %rax        # p
    movb    $44, (%rax,%rdx)       # p[total + next] = ','
    movl    -8(%rbp), %eax         # next
    addl    %eax, -4(%rbp)         # total += next
    addl    $1, -4(%rbp)           # total++

.L_increment_seed:
    movzwl  -38(%rbp), %eax
    addl    $1, %eax
    movw    %ax, -38(%rbp)         # seed++

    movzwl  -38(%rbp), %eax
    andl    $7, %eax               # seed & 0x7
    
    cmpl    $7, %eax
    je      .L_case_err
    cmpl    $5, %eax
    jge     .L_case_sci
    cmpl    $3, %eax
    jge     .L_case_float
    jmp     .L_case_int

.L_case_int:
    movzwl  -38(%rbp), %eax
    shrl    $3, %eax
    andl    $3, %eax
    leaq    intpat(%rip), %rdx
    movq    (%rdx,%rax,8), %rax
    movq    %rax, -16(%rbp)        # buf = intpat[...]
    movl    $4, -8(%rbp)           # next = 4
    jmp     .L_main_loop

.L_case_float:
    movzwl  -38(%rbp), %eax
    shrl    $3, %eax
    andl    $3, %eax
    leaq    floatpat(%rip), %rdx
    movq    (%rdx,%rax,8), %rax
    movq    %rax, -16(%rbp)        # buf = floatpat[...]
    movl    $8, -8(%rbp)           # next = 8
    jmp     .L_main_loop

.L_case_sci:
    movzwl  -38(%rbp), %eax
    shrl    $3, %eax
    andl    $3, %eax
    leaq    scipat(%rip), %rdx
    movq    (%rdx,%rax,8), %rax
    movq    %rax, -16(%rbp)        # buf = scipat[...]
    movl    $8, -8(%rbp)           # next = 8
    jmp     .L_main_loop

.L_case_err:
    movzwl  -38(%rbp), %eax
    shrl    $3, %eax
    andl    $3, %eax
    leaq    errpat(%rip), %rdx
    movq    (%rdx,%rax,8), %rax
    movq    %rax, -16(%rbp)        # buf = errpat[...]
    movl    $8, -8(%rbp)           # next = 8
    jmp     .L_main_loop

.L_fill_rest:
    addl    $1, -36(%rbp)          # size++

.L_fill_loop:
    movl    -4(%rbp), %eax         # total
    cmpl    -36(%rbp), %eax        # compare with size
    jge     .L_end

    movl    -4(%rbp), %eax
    movq    -48(%rbp), %rdx        # p
    movb    $0, (%rdx,%rax)        # p[total] = 0
    addl    $1, -4(%rbp)           # total++
    jmp     .L_fill_loop

.L_end:
    leave
    ret
