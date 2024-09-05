    .text
    .section    .rodata
.LC_print_enter:
    .string    "enter foo"
.LC_print_exit:
    .string    "exit foo"
    .text
    .globl    foo
    .type    foo, @function
foo:
.L_foo_entry:
	# Function prologue
    endbr64
    pushq    %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rdi, -8(%rbp)     # Store person1 pointer
    movq    %rsi, -16(%rbp)    # Store person2 pointer

    # printf("enter foo\n");
    leaq    .LC_print_enter(%rip), %rax
    movq    %rax, %rdi
    call    printf@PLT

    # if(person1->person_age > person2->person_age)
    movq    -8(%rbp), %rax     # Load person1 pointer
    movl    (%rax), %edx       # Load person1->person_age
    movq    -16(%rbp), %rax    # Load person2 pointer
    movl    (%rax), %eax       # Load person2->person_age
    cmpl    %eax, %edx
    jle     .L_else_branch

.L_if_branch:
    # person1->person_age += 5;
    movq    -8(%rbp), %rax     # Load person1 pointer
    movl    (%rax), %eax       # Load person1->person_age
    leal    5(%rax), %edx      # Add 5 to person1->person_age
    movq    -8(%rbp), %rax     # Load person1 pointer
    movl    %edx, (%rax)       # Store updated person1->person_age
    jmp     .L_end_if

.L_else_branch:
    # person2->person_age += 5;
    movq    -16(%rbp), %rax    # Load person2 pointer
    movl    (%rax), %eax       # Load person2->person_age
    leal    5(%rax), %edx      # Add 5 to person2->person_age
    movq    -16(%rbp), %rax    # Load person2 pointer
    movl    %edx, (%rax)       # Store updated person2->person_age

.L_end_if:
    # printf("exit foo\n");
    leaq    .LC_print_exit(%rip), %rax
    movq    %rax, %rdi
    call    printf@PLT

    # Function epilogue
    nop
    leave
    ret