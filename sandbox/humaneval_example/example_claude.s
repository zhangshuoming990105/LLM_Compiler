    .arch armv8-a
    .text
    .p2align    2
    .globl    _has_close_elements
_has_close_elements:
    stp    x29, x30, [sp, -48]!    // Save frame pointer and link register
    mov    x29, sp
    str    x0, [sp, 24]            // Store numbers[] address
    str    w1, [sp, 20]            // Store size
    str    s0, [sp, 16]            // Store threshold
    str    wzr, [sp, 44]           // i = 0
    b    .L2
.L6:
    str    wzr, [sp, 40]           // j = 0
    b    .L3
.L5:
    ldr    w0, [sp, 44]            // Load i
    ldr    w1, [sp, 40]            // Load j
    cmp    w0, w1
    beq    .L4                     // if (i == j) skip
    ldrsw    x0, [sp, 44]
    lsl    x0, x0, 2
    ldr    x1, [sp, 24]
    add    x0, x1, x0
    ldr    s0, [x0]                // Load numbers[i]
    ldrsw    x0, [sp, 40]
    lsl    x0, x0, 2
    ldr    x1, [sp, 24]
    add    x0, x1, x0
    ldr    s1, [x0]                // Load numbers[j]
    fsub    s0, s0, s1             // numbers[i] - numbers[j]
    fabs    s0, s0                 // fabs(numbers[i] - numbers[j])
    ldr    s1, [sp, 16]            // Load threshold
    fcmp    s0, s1
    bge    .L4                     // if (distance >= threshold) skip
    mov    w0, 1
    b    .L7                       // return true
.L4:
    ldr    w0, [sp, 40]
    add    w0, w0, 1
    str    w0, [sp, 40]            // j++
.L3:
    ldr    w1, [sp, 40]
    ldr    w0, [sp, 20]
    cmp    w1, w0
    blt    .L5                     // if (j < size) continue inner loop
    ldr    w0, [sp, 44]
    add    w0, w0, 1
    str    w0, [sp, 44]            // i++
.L2:
    ldr    w1, [sp, 44]
    ldr    w0, [sp, 20]
    cmp    w1, w0
    blt    .L6                     // if (i < size) continue outer loop
    mov    w0, 0                   // return false
.L7:
    ldp    x29, x30, [sp], 48      // Restore frame pointer and link register
    ret
