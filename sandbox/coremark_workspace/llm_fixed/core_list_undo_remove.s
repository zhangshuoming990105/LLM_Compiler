    .text
    .globl    core_list_undo_remove
    .type    core_list_undo_remove, @function
core_list_undo_remove:
.LFB0:
    endbr64                      # Enable Intel Control-flow Enforcement Technology
    pushq    %rbp                # Save the old base pointer
    movq    %rsp, %rbp           # Set up new base pointer
    subq    $32, %rsp            # Allocate 32 bytes on the stack (corrected from 16 to 32)

    movq    %rdi, -8(%rbp)       # Store item_removed in local variable at rbp-8
    movq    %rsi, -16(%rbp)      # Store item_modified in local variable at rbp-16

    # tmp = item_removed->info;
    movq    -8(%rbp), %rax       # Load item_removed into rax
    movq    8(%rax), %rax        # Load item_removed->info into rax (corrected offset from 0 to 8)
    movq    %rax, -24(%rbp)      # Store tmp (item_removed->info) at rbp-24

    # item_removed->info = item_modified->info;
    movq    -8(%rbp), %rax       # Load item_removed into rax
    movq    -16(%rbp), %rdx      # Load item_modified into rdx
    movq    8(%rdx), %rdx        # Load item_modified->info into rdx (corrected offset from 0 to 8)
    movq    %rdx, 8(%rax)        # Store item_modified->info in item_removed->info (corrected offset from 0 to 8)

    # item_modified->info = tmp;
    movq    -16(%rbp), %rax      # Load item_modified into rax
    movq    -24(%rbp), %rdx      # Load tmp into rdx
    movq    %rdx, 8(%rax)        # Store tmp in item_modified->info (corrected offset from 0 to 8)

    # item_removed->next = item_modified->next;
    movq    -8(%rbp), %rax       # Load item_removed into rax
    movq    -16(%rbp), %rdx      # Load item_modified into rdx
    movq    (%rdx), %rdx         # Load item_modified->next into rdx (corrected offset from 8 to 0)
    movq    %rdx, (%rax)         # Store item_modified->next in item_removed->next (corrected offset from 8 to 0)

    # item_modified->next = item_removed;
    movq    -16(%rbp), %rax      # Load item_modified into rax
    movq    -8(%rbp), %rdx       # Load item_removed into rdx
    movq    %rdx, (%rax)         # Store item_removed in item_modified->next (corrected offset from 8 to 0)

    # return item_removed;
    movq    -8(%rbp), %rax       # Load item_removed into rax (return value)

    leave                        # Restore the stack pointer and pop the base pointer
    ret                          # Return from the function

    .size    core_list_undo_remove, .-core_list_undo_remove
