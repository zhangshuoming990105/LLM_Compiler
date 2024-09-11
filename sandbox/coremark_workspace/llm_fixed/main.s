#--------------  DATA PART1 Struct definitions:
    .text
# CORE_PORTABLE_S {
#     u8 portable_id;        // offset 0, size 1
# }; // total size 1, aligned to 1 byte
# list_data_s {
#     short data16;          // offset 0, size 2
#     short idx;             // offset 2, size 2
# }; // total size 4, aligned to 2 bytes
# list_head_s {
#     struct list_head_s *next; // offset 0, size 8
#     struct list_data_s *info; // offset 8, size 8
# }; // total size 16, aligned to 8 bytes
# MAT_PARAMS_S {
#     int N;                 // offset 0, size 4
#     short *A;              // offset 8, size 8
#     short *B;              // offset 16, size 8
#     int *C;                // offset 24, size 8
# }; // total size 32, aligned to 8 bytes
# RESULTS_S {
#     short seed1;           // offset 0, size 2
#     short seed2;           // offset 2, size 2
#     short seed3;           // offset 4, size 2
#     void *memblock[4];     // offset 8, size 32
#     unsigned size;         // offset 40, size 4
#     unsigned iterations;   // offset 44, size 4
#     unsigned execs;        // offset 48, size 4
#     struct list_head_s *list; // offset 56, size 8
#     mat_params mat;        // offset 64, size 32
#     u16 crc;               // offset 96, size 2
#     u16 crclist;           // offset 98, size 2
#     u16 crcmatrix;         // offset 100, size 2
#     u16 crcstate;          // offset 102, size 2
#     short err;             // offset 104, size 2
#     core_portable port;    // offset 106, size 1
# }; // total size 112, aligned to 8 bytes
 
#-------------- DATA PART2 Global variables
    .data
    .globl	start_time_val
    .type	start_time_val, @object
	.size	start_time_val, 16
start_time_val:
    .zero 16    # struct timespec (8 bytes for tv_sec, 8 bytes for tv_nsec)
    .globl	stop_time_val
    .type	stop_time_val, @object
	.size	stop_time_val, 16
stop_time_val:
    .zero 16    # struct timespec (8 bytes for tv_sec, 8 bytes for tv_nsec)

#-------------- DATA PART3 Static variables
list_known_crc:
    .word 0xd4b0, 0x3340, 0x6a79, 0xe714, 0xe3c1

matrix_known_crc:
    .word 0xbe52, 0x1199, 0x5608, 0x1fd7, 0x0747

state_known_crc:
    .word 0x5e47, 0x39bf, 0xe5a4, 0x8e3a, 0x8d84

    .section    .rodata
#-------------- DATA PART4 String literals
.LC_2K_performance:
    .string "2K performance run parameters for coremark.\n"
.LC_error_list:
    .string "[%u]ERROR! list crc 0x%04x - should be 0x%04x\n"
.LC_error_matrix:
    .string "[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n"
.LC_error_state:
    .string "[%u]ERROR! state crc 0x%04x - should be 0x%04x\n"
.LC_coremark_size:
    .string "CoreMark Size    : %lu\n"
.LC_total_ticks:
    .string "Total ticks      : %lu\n"
.LC_total_time:
    .string "Total time (secs): %f\n"
.LC_iterations_per_sec:
    .string "Iterations/Sec   : %f\n"
.LC_error_execution_time:
    .string "ERROR! Must execute for at least 10 secs for a valid result!\n"
.LC_iterations:
    .string "Iterations       : %lu\n"
.LC_compiler_version:
    .string "Compiler version : AICC 1.0\n"
.LC_seedcrc:
    .string "seedcrc          : 0x%04x\n"
.LC_crclist:
    .string "[%d]crclist       : 0x%04x\n"
.LC_crcmatrix:
    .string "[%d]crcmatrix     : 0x%04x\n"
.LC_crcstate:
    .string "[%d]crcstate      : 0x%04x\n"
.LC_crcfinal:
    .string "[%d]crcfinal      : 0x%04x\n"
.LC_correct_operation:
    .string "Correct operation validated. See README.md for run and reporting rules.\n"
.LC_function_level:
    .string "Function Level CoreMark 1.0 : %f by AICC 1.0"
.LC_heap:
    .string " / Heap"
.LC_newline:
    .string "\n"
.LC_errors_detected:
    .string "Errors detected\n"
.LC_cannot_validate:
    .string "Cannot validate operation for these seed values, please compare with results on a known platform.\n"

#-------------- DATA PART5 Numeric constants
.LC_zero:
    .long 0
.LC_one:
    .long 1
.LC_ten:
    .long 10
.LC_0x66:
    .word 0x66
.LC_2000:
    .long 2000
.LC_7:
    .long 7
.LC_3:
    .long 3
.LC_0xe9f5:
    .word 0xe9f5
.LC_minus_one:
    .long -1
.LC_ten_float:
    .float 10.0

#-------------- PART1 Function begin and prologue
    .text
    .globl    main
    .type    main, @function
main:
.L_main_entry:
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $176, %rsp    # Adjust stack for local variables

#-------------- PART2 Initialize variables
    movw    $0, -10(%rbp)     # j = 0
    movw    $3, -12(%rbp)     # num_algorithms = 3
    movw    $-1, -16(%rbp)    # known_id = -1
    movl    $0, -20(%rbp)     # total_errors = 0
    movw    $0, -24(%rbp)     # seedcrc = 0

    # Initialize results array
    leaq    -144(%rbp), %rdi
    call    portable_init@PLT

    # Set initial values for results[0]
    movw    $0, -144(%rbp)
    movw    $0, -142(%rbp)
    movw    $0x66, -140(%rbp)
    movl    $0, -100(%rbp)
    movl    $7, -96(%rbp)
    movl    $2000, -104(%rbp)

    # Allocate memory for results[0].memblock[0]
    movl    -104(%rbp), %edi    # Load original results[0].size (2000)
    call    portable_malloc@PLT
    movq    %rax, -136(%rbp)    # Store pointer in results[0].memblock[0]

    # Divide size by num_algorithms
    movl    -104(%rbp), %eax    # Load results[0].size (2000)
    movzwl  -12(%rbp), %ecx     # Load num_algorithms (3)
    xorl    %edx, %edx          # Clear edx for division
    divl    %ecx                # Divide eax by ecx
    movl    %eax, -104(%rbp)    # Store result back to results[0].size (666)

#-------------- PART3 Loop to assign addresses for results[0].memblock[1], [2], and [3]
    movl    $0, -8(%rbp)        # i = 0
.L_memblock_loop:
    cmpl    $3, -8(%rbp)
    jge     .L_memblock_loop_end

    movq    -136(%rbp), %rax    # Load results[0].memblock[0]
    movl    -104(%rbp), %ecx    # Load results[0].size (666)
    movl    -8(%rbp), %edx      # Load i
    imull   %edx, %ecx          # results[0].size * i
    addq    %rcx, %rax          # (char *)(results[0].memblock[0]) + results[0].size * i
    
    movl    -8(%rbp), %edx
    addl    $1, %edx
    movslq  %edx, %rdx
    movq    %rax, -136(%rbp, %rdx, 8)  # Store in results[0].memblock[i + 1]

    incl    -8(%rbp)            # i++
    jmp     .L_memblock_loop
.L_memblock_loop_end:
#-------------- PART4 Call functions to initialize list, matrix, and state
    movl    -104(%rbp), %edi      # Load results[0].size (666)
    movq    -128(%rbp), %rsi      # Load results[0].memblock[1]
    movzwl  -144(%rbp), %edx      # Load results[0].seed1
    call    core_list_init@PLT
    movq    %rax, -88(%rbp)       # Store result in results[0].list

    movl    -104(%rbp), %edi      # Load results[0].size
    movq    -120(%rbp), %rsi      # Load results[0].memblock[2]
    movzwl  -144(%rbp), %edx      # Load results[0].seed1
    movzwl  -142(%rbp), %ecx      # Load results[0].seed2
    sall    $16, %ecx
    orl     %ecx, %edx            # Combine seed1 and seed2
    leaq    -80(%rbp), %rcx       # Address of results[0].mat
    call    core_init_matrix@PLT

    movl    -104(%rbp), %edi      # Load results[0].size
    movzwl  -144(%rbp), %esi      # Load results[0].seed1
    movq    -112(%rbp), %rdx      # Load results[0].memblock[3]
    call    core_init_state@PLT

    # Set iterations to 60000
    movl    $60000, -100(%rbp)

#-------------- PART5 Check if iterations is 0
    # Check if iterations is 0
    
    cmpl    $0, -100(%rbp)
    jne     .L_iterations_set

    # Determine number of iterations
    movsd   .LC_zero(%rip), %xmm0
    movsd   %xmm0, -160(%rbp)    # secs_passed = 0
    movl    $1, -100(%rbp)       # results[0].iterations = 1

.L_iteration_loop:
    movsd   -160(%rbp), %xmm0
    ucomisd .LC_one(%rip), %xmm0
    jae     .L_iteration_loop_end

    # Multiply iterations by 10
    movl    -100(%rbp), %eax
    imull   $10, %eax
    movl    %eax, -100(%rbp)

    # Perform iteration and measure time
    call    start_time@PLT
    leaq    -144(%rbp), %rdi
    call	iterate@PLT
	call	stop_time@PLT
	call	get_time@PLT
	movq	%rax, %rdi
	call	time_in_secs@PLT
    movsd   %xmm0, -160(%rbp)    # Update secs_passed
    jmp     .L_iteration_loop

.L_iteration_loop_end:
    # Calculate final number of iterations
    call    get_time@PLT
    movq    %rax, %rdi
    call    time_in_secs@PLT
    cvttsd2si %xmm0, %eax
    movl    %eax, -164(%rbp)     # divisor = (unsigned)secs_passed

    cmpl    $0, -164(%rbp)
    jne     .L_divisor_not_zero
    movl    $1, -164(%rbp)       # if (divisor == 0) divisor = 1

.L_divisor_not_zero:
    movl    $10, %eax
    cltd
    idivl   -164(%rbp)
    addl    $1, %eax
    imull   -100(%rbp), %eax
    movl    %eax, -100(%rbp)     # results[0].iterations *= 1 + 10 / divisor

.L_iterations_set:
#-------------- PART6 Perform iterations and calculate seedcrc
    call    start_time@PLT
    leaq    -144(%rbp), %rdi
    call    iterate@PLT
    call    stop_time@PLT
    call    get_time@PLT
    movq    %rax, -32(%rbp)    # total_time = get_time()
    # Calculate seedcrc
    movzwl  -144(%rbp), %edi    # Load results[0].seed1
    movzwl  -24(%rbp), %esi     # Load seedcrc
    call    crc16@PLT
    movw    %ax, -24(%rbp)      # Store result in seedcrc

    movzwl  -142(%rbp), %edi    # Load results[0].seed2
    movzwl  -24(%rbp), %esi     # Load seedcrc
    call    crc16@PLT
    movw    %ax, -24(%rbp)      # Store result in seedcrc

    movzwl  -140(%rbp), %edi    # Load results[0].seed3
    movzwl  -24(%rbp), %esi     # Load seedcrc
    call    crc16@PLT
    movw    %ax, -24(%rbp)      # Store result in seedcrc

    movl    -104(%rbp), %edi    # Load results[0].size
    movzwl  -24(%rbp), %esi     # Load seedcrc
    call    crc16@PLT
    movw    %ax, -24(%rbp)      # Store result in seedcrc

#-------------- PART7 Switch based on seedcrc
    cmpw    $0xe9f5, -24(%rbp)
    je      .L_known_seed
    jmp     .L_unknown_seed

.L_known_seed:
    movw    $3, -16(%rbp)       # known_id = 3
    leaq    .LC_2K_performance(%rip), %rdi
    call    printf@PLT
    jmp     .L_seed_check_end

.L_unknown_seed:
    movl    $-1, -20(%rbp)      # total_errors = -1

.L_seed_check_end:
#-------------- PART8 Check for errors
    cmpw    $0, -16(%rbp)
    jl      .L_skip_error_check

    # Check list crc
    movl    -96(%rbp), %eax     # Load results[0].execs
    andl    $1, %eax
    testl   %eax, %eax
    je      .L_check_matrix_crc

    movzwl  -46(%rbp), %edx     # Load results[0].crclist
    movzwl  -16(%rbp), %eax     # Load known_id
    cltq
    leaq    0(,%rax,2), %rcx
    leaq    list_known_crc(%rip), %rax
    movzwl  (%rcx,%rax), %eax
    cmpw    %ax, %dx
    je      .L_check_matrix_crc

    # Print list crc error message
    movl    $0, %ecx
    movzwl  -46(%rbp), %edx
    movl    $0, %esi
    leaq    .LC_error_list(%rip), %rdi
    movl    $0, %eax
    call    printf@PLT
    addl    $1, -40(%rbp)       # results[0].err++

.L_check_matrix_crc:
    # Check matrix crc
    movl    -96(%rbp), %eax     # Load results[0].execs
    andl    $2, %eax
    testl   %eax, %eax
    je      .L_check_state_crc

    movzwl  -44(%rbp), %edx     # Load results[0].crcmatrix
    movzwl  -16(%rbp), %eax     # Load known_id
    cltq
    leaq    0(,%rax,2), %rcx
    leaq    matrix_known_crc(%rip), %rax
    movzwl  (%rcx,%rax), %eax
    cmpw    %ax, %dx
    je      .L_check_state_crc

    # Print matrix crc error message
    movl    $0, %ecx
    movzwl  -44(%rbp), %edx
    movl    $0, %esi
    leaq    .LC_error_matrix(%rip), %rdi
    movl    $0, %eax
    call    printf@PLT
    addl    $1, -40(%rbp)       # results[0].err++

.L_check_state_crc:
    # Check state crc
    movl    -96(%rbp), %eax     # Load results[0].execs
    andl    $4, %eax
    testl   %eax, %eax
    je      .L_error_check_done

    movzwl  -42(%rbp), %edx     # Load results[0].crcstate
    movzwl  -16(%rbp), %eax     # Load known_id
    cltq
    leaq    0(,%rax,2), %rcx
    leaq    state_known_crc(%rip), %rax
    movzwl  (%rcx,%rax), %eax
    cmpw    %ax, %dx
    je      .L_error_check_done

    # Print state crc error message
    movl    $0, %ecx
    movzwl  -42(%rbp), %edx
    movl    $0, %esi
    leaq    .LC_error_state(%rip), %rdi
    movl    $0, %eax
    call    printf@PLT
    addl    $1, -40(%rbp)       # results[0].err++

.L_error_check_done:
    movzwl  -40(%rbp), %eax     # Load results[0].err
    movswl  %ax, %edx           # Sign-extend to 32-bit
    addl    %edx, -20(%rbp)     # total_errors += results[0].err

.L_skip_error_check:
#-------------- PART9 Print results1
    # Add data type check errors
    call    check_data_types@PLT
    addl    %eax, -20(%rbp)

    # Print results
    leaq    .LC_coremark_size(%rip), %rdi
    movl    -104(%rbp), %esi
    movl    $0, %eax
    call    printf@PLT

    leaq    .LC_total_ticks(%rip), %rdi
    movq    -32(%rbp), %rsi
    movl    $0, %eax
    call    printf@PLT

    # Print total time
    movq    -32(%rbp), %rdi
    call    time_in_secs@PLT
    movsd   %xmm0, -40(%rbp)   # Store result of time_in_secs
    leaq    .LC_total_time(%rip), %rdi
    movq    -40(%rbp), %rax
    movq    %rax, %xmm0
    movl    $1, %eax
    call    printf@PLT

    # Calculate and print iterations per second
    movsd   -40(%rbp), %xmm1
    xorpd   %xmm0, %xmm0
    ucomisd %xmm0, %xmm1
    jbe     .L_skip_iterations_per_sec

    movl    -100(%rbp), %eax   # Load iterations
    cvtsi2sd %eax, %xmm0
    divsd   -40(%rbp), %xmm0   # iterations / time
    leaq    .LC_iterations_per_sec(%rip), %rdi
    movl    $1, %eax
    call    printf@PLT

.L_skip_iterations_per_sec:
    movq    -32(%rbp), %rdi
    call    time_in_secs@PLT
    movsd   .LC_ten(%rip), %xmm1
    ucomisd %xmm1, %xmm0
    jae     .L_skip_execution_time_error

    leaq    .LC_error_execution_time(%rip), %rdi
    call    printf@PLT
    addl    $1, -20(%rbp)

.L_skip_execution_time_error:
    leaq    .LC_iterations(%rip), %rdi
    movl    -100(%rbp), %esi
    movl    $0, %eax
    call    printf@PLT

    leaq    .LC_compiler_version(%rip), %rdi
    call    printf@PLT

    leaq    .LC_seedcrc(%rip), %rdi
    movzwl  -24(%rbp), %esi
    movl    $0, %eax
    call    printf@PLT

#-------------- PART10 Print results2
    movl    -96(%rbp), %eax
    andl    $1, %eax
    testl   %eax, %eax
    je      .L_skip_crclist_print

    leaq    .LC_crclist(%rip), %rdi
    movl    $0, %esi
    movzwl  -46(%rbp), %edx
    movl    $0, %eax
    call    printf@PLT

.L_skip_crclist_print:
    movl    -96(%rbp), %eax
    andl    $2, %eax
    testl   %eax, %eax
    je      .L_skip_crcmatrix_print

    leaq    .LC_crcmatrix(%rip), %rdi
    movl    $0, %esi
    movzwl  -44(%rbp), %edx
    movl    $0, %eax
    call    printf@PLT

.L_skip_crcmatrix_print:
    movl    -96(%rbp), %eax
    andl    $4, %eax
    testl   %eax, %eax
    je      .L_skip_crcstate_print

    leaq    .LC_crcstate(%rip), %rdi
    movl    $0, %esi
    movzwl  -42(%rbp), %edx
    movl    $0, %eax
    call    printf@PLT

.L_skip_crcstate_print:
    leaq    .LC_crcfinal(%rip), %rdi
    movl    $0, %esi
    movzwl  -48(%rbp), %edx
    movl    $0, %eax
    call    printf@PLT

    cmpl    $0, -20(%rbp)
    jne     .L_errors_detected

    leaq    .LC_correct_operation(%rip), %rdi
    call    printf@PLT

    cmpw    $3, -16(%rbp)
    jne     .L_skip_known_id_3

    movq    -32(%rbp), %rdi
    call    time_in_secs@PLT
    movsd   %xmm0, -168(%rbp)
    movl    -100(%rbp), %eax
    cvtsi2sd %eax, %xmm0
    divsd   -168(%rbp), %xmm0
    leaq    .LC_function_level(%rip), %rdi
    movl    $1, %eax
    call    printf@PLT

    leaq    .LC_heap(%rip), %rdi
    call    printf@PLT

    leaq    .LC_newline(%rip), %rdi
    call    printf@PLT

.L_skip_known_id_3:
    jmp     .L_end_error_check

.L_errors_detected:
    cmpl    $0, -20(%rbp)
    jle     .L_invalid_seed_values

    leaq    .LC_errors_detected(%rip), %rdi
    call    printf@PLT
    jmp     .L_end_error_check

.L_invalid_seed_values:
    leaq    .LC_cannot_validate(%rip), %rdi
    call    printf@PLT

.L_end_error_check:
    # Clean up and return
    movq    -136(%rbp), %rdi
    call    portable_free@PLT

    leaq    -38(%rbp), %rdi
    call    portable_fini@PLT

#-------------- PART11 Function end and epilogue
    movl    $0, %eax
    leave
    ret
