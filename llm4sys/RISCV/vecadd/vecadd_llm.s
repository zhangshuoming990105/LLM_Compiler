    .file   "vecadd.c"
    .option nopic
    .attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
    .attribute unaligned_access, 0
    .attribute stack_align, 16
    .text
    .align  1
    .globl  vecadd
    .type   vecadd, @function
vecadd:
    ble a3,zero,.L10        # If a3 (length) <= 0, jump to .L10 (return)
    addi    a5,a1,4         # a5 = a1 + 4 (address of second element of b)
    addi    a4,a0,4         # a4 = a0 + 4 (address of second element of a)
    sub a5,a2,a5            # a5 = a2 - a5 (difference between c and b)
    sub a4,a2,a4            # a4 = a2 - a4 (difference between c and a)
    bgtu    a5,a4,.L14      # If a5 > a4, jump to .L14
.L4:
    csrr    a4,vlenb        # Read vector register length in bytes
    addi    a4,a4,-8        # a4 = vlenb - 8
    bleu    a5,a4,.L3       # If a5 <= a4, jump to .L3 (scalar processing)
.L5:
    vsetvli a5,a3,e32,m1,ta,ma  # Set vector length based on a3, 32-bit elements
    vle32.v v1,0(a0)        # Load vector from a0 into v1
    vle32.v v2,0(a1)        # Load vector from a1 into v2
    slli    a4,a5,2         # a4 = a5 * 4 (byte offset for 32-bit elements)
    sub a3,a3,a5            # Decrement a3 by vector length
    add a0,a0,a4            # Increment a0 by byte offset
    add a1,a1,a4            # Increment a1 by byte offset
    vfadd.vv    v1,v1,v2    # Vector floating-point add v1 = v1 + v2
    vse32.v v1,0(a2)        # Store result vector v1 to address in a2
    add a2,a2,a4            # Increment a2 by byte offset
    bne a3,zero,.L5         # If a3 != 0, loop back to .L5
    ret                     # Return from function

.L3:
    slli    a3,a3,2         # a3 = a3 * 4 (total byte count)
    add a3,a0,a3            # a3 = a0 + a3 (end address of a)
.L7:
    flw fa5,0(a0)           # Load float from a0 into fa5
    flw fa4,0(a1)           # Load float from a1 into fa4
    addi    a0,a0,4         # Increment a0 by 4 bytes
    addi    a1,a1,4         # Increment a1 by 4 bytes
    fadd.s  fa5,fa5,fa4     # Floating-point add fa5 = fa5 + fa4
    addi    a2,a2,4         # Increment a2 by 4 bytes
    fsw fa5,-4(a2)          # Store float fa5 to address a2-4
    bne a0,a3,.L7           # If a0 != a3, loop back to .L7
.L10:
    ret                     # Return from function

.L14:
    mv  a5,a4               # Move a4 to a5
    j   .L4                 # Jump to .L4

    .size   vecadd, .-vecadd
    .section    .rodata.str1.8,"aMS",@progbits,1
    .align  3
.LC2:
    .string "%f\n"
    .section    .text.startup,"ax",@progbits
    .align  1
    .globl  main
    .type   main, @function
main:
    lui a5,%hi(.LC1)        # Load upper immediate of .LC1 address
    vsetivli    zero,4,e32,m1,ta,ma  # Set vector length to 4, 32-bit elements
    addi    a5,a5,%lo(.LC1) # Complete .LC1 address
    vle32.v v1,0(a5)        # Load vector from .LC1 into v1
    addi    sp,sp,-48       # Allocate 48 bytes on stack
    sd  s0,32(sp)           # Store s0 on stack
    sd  s1,24(sp)           # Store s1 on stack
    sd  ra,40(sp)           # Store return address on stack
    mv  s0,sp               # s0 = sp (frame pointer)
    vse32.v v1,0(sp)        # Store vector v1 to stack
    lui s1,%hi(.LC2)        # Load upper immediate of .LC2 address
.L16:
    flw fa5,0(s0)           # Load float from s0 into fa5
    addi    a0,s1,%lo(.LC2) # Complete .LC2 address in a0
    addi    s0,s0,4         # Increment s0 by 4 bytes
    fcvt.d.s    fa5,fa5     # Convert single to double precision
    fmv.x.d a1,fa5          # Move double to integer register for printf
    call    printf          # Call printf
    addi    a5,sp,16        # a5 = sp + 16
    bne s0,a5,.L16          # If s0 != a5, loop back to .L16
    ld  ra,40(sp)           # Restore return address
    ld  s0,32(sp)           # Restore s0
    ld  s1,24(sp)           # Restore s1
    li  a0,0                # Set return value to 0
    addi    sp,sp,48        # Deallocate stack space
    jr  ra                  # Return from main

    .size   main, .-main
    .section    .rodata.cst16,"aM",@progbits,16
    .align  4
.LC1:
    .float  2.0
    .float  4.0
    .float  6.0
    .float  8.0
    .ident  "GCC: (g04696df09) 14.2.0"
    .section    .note.GNU-stack,"",@progbits
