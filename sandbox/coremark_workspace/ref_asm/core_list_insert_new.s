core_list_insert_new:
.LFB0:
    .cfi_startproc
    endbr64
    pushq   %rbp                    # Save the old base pointer
    .cfi_def_cfa_offset 16
    .cfi_offset 6, -16
    movq    %rsp, %rbp              # Set up new base pointer
    .cfi_def_cfa_register 6
    subq    $64, %rsp               # Allocate 64 bytes on the stack

    # Save function parameters to stack
    movq    %rdi, -24(%rbp)         # insert_point
    movq    %rsi, -32(%rbp)         # info
    movq    %rdx, -40(%rbp)         # memblock
    movq    %rcx, -48(%rbp)         # datablock
    movq    %r8, -56(%rbp)          # memblock_end
    movq    %r9, -64(%rbp)          # datablock_end

    # First if condition: if ((*memblock + 1) >= memblock_end)
    movq    -40(%rbp), %rax         # Load memblock
    movq    (%rax), %rax            # Dereference memblock
    addq    $16, %rax               # Add size of list_head (16 bytes)
    cmpq    -56(%rbp), %rax         # Compare with memblock_end
    jb      .L2                     # Jump if below (unsigned)
    movl    $0, %eax                # Return NULL
    jmp     .L3                     # Jump to return

.L2:
    # Second if condition: if ((*datablock + 1) >= datablock_end)
    movq    -48(%rbp), %rax         # Load datablock
    movq    (%rax), %rax            # Dereference datablock
    addq    $4, %rax                # Add size of list_data (4 bytes)
    cmpq    -64(%rbp), %rax         # Compare with datablock_end
    jb      .L4                     # Jump if below (unsigned)
    movl    $0, %eax                # Return NULL
    jmp     .L3                     # Jump to return

.L4:
    # newitem = *memblock;
    movq    -40(%rbp), %rax         # Load memblock
    movq    (%rax), %rax            # Dereference memblock
    movq    %rax, -8(%rbp)          # Store in newitem (local variable)

    # (*memblock)++;
    movq    -40(%rbp), %rax         # Load memblock
    movq    (%rax), %rax            # Dereference memblock
    leaq    16(%rax), %rdx          # Add size of list_head (16 bytes)
    movq    -40(%rbp), %rax         # Load memblock again
    movq    %rdx, (%rax)            # Store incremented value back

    # newitem->next = insert_point->next;
    movq    -24(%rbp), %rax         # Load insert_point
    movq    (%rax), %rdx            # Get insert_point->next
    movq    -8(%rbp), %rax          # Load newitem
    movq    %rdx, (%rax)            # Set newitem->next

    # insert_point->next = newitem;
    movq    -24(%rbp), %rax         # Load insert_point
    movq    -8(%rbp), %rdx          # Load newitem
    movq    %rdx, (%rax)            # Set insert_point->next

    # newitem->info = *datablock;
    movq    -48(%rbp), %rax         # Load datablock
    movq    (%rax), %rdx            # Dereference datablock
    movq    -8(%rbp), %rax          # Load newitem
    movq    %rdx, 8(%rax)           # Set newitem->info (offset 8)

    # (*datablock)++;
    movq    -48(%rbp), %rax         # Load datablock
    movq    (%rax), %rax            # Dereference datablock
    leaq    4(%rax), %rdx           # Add size of list_data (4 bytes)
    movq    -48(%rbp), %rax         # Load datablock again
    movq    %rdx, (%rax)            # Store incremented value back

    # copy_info(newitem->info, info);
    movq    -8(%rbp), %rax          # Load newitem
    movq    8(%rax), %rax           # Get newitem->info
    movq    -32(%rbp), %rdx         # Load info
    movq    %rdx, %rsi              # Set second argument (info)
    movq    %rax, %rdi              # Set first argument (newitem->info)
    call    copy_info@PLT           # Call copy_info function

    # return newitem;
    movq    -8(%rbp), %rax          # Load newitem into return register

.L3:
    leave                           # Restore stack and base pointer
    .cfi_def_cfa 7, 8
    ret                             # Return from function