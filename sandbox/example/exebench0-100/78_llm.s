    .text
    .globl  cat_nums
cat_nums:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $24, %rsp              # Allocate space for local variables
    movq    %rdi, -8(%rbp)         # str_out
    movq    %rsi, -16(%rbp)        # str
    movl    $0, -20(%rbp)          # i = 0
    movl    $0, -24(%rbp)          # j = 0

.L1:
    movl    -20(%rbp), %eax        # i
    movq    -16(%rbp), %rdx        # str
    movzbl  (%rdx,%rax,1), %eax    # str[i]
    testb   %al, %al
    je      .L2                    # if (str[i] == '\0') break

    cmpb    $'0', %al
    jl      .L3                    # if (str[i] < '0') continue
    cmpb    $'9', %al
    jg      .L3                    # if (str[i] > '9') continue

    movl    -24(%rbp), %edx        # j
    movq    -8(%rbp), %rcx         # str_out
    movb    %al, (%rcx,%rdx,1)     # str_out[j] = str[i]
    addl    $1, -24(%rbp)          # j++

.L3:
    addl    $1, -20(%rbp)          # i++
    jmp     .L1

.L2:
    movl    -24(%rbp), %eax        # j
    movq    -8(%rbp), %rdx         # str_out
    movb    $'\0', (%rdx,%rax,1)   # str_out[j] = '\0'
    movl    -24(%rbp), %eax        # return j

    leave
    ret