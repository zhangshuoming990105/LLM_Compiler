    .arch armv8-a
    .text
    .p2align    2
    .globl _quant
_quant:
    stp    x29, x30, [sp, -32]!    ; enter function, save frame pointer and return address
    stp    x19, x20, [sp, 16]      ; save callee-saved registers
    mov    x29, sp

    mov    w19, w0                 ; w19 = n
    mov    w20, w1                 ; w20 = m
    
    cmp    w19, #0                 ; compare n with 0
    cneg   w19, w19, lt            ; if n < 0, w19 = -w19
    cset   w2, lt                  ; w2 (neg) = 1 if n < 0, else 0

    sdiv   w0, w19, w20            ; i = n / m
    msub   w1, w0, w20, w19        ; w1 = n - m * i (remainder)
    
    asr    w3, w20, 1              ; w3 = m / 2
    cmp    w1, w3                  ; compare remainder with m/2
    cinc   w0, w0, gt              ; increment i if remainder > m/2

    mul    w0, w0, w20             ; i *= m
    neg    w1, w0                  ; w1 = -i
    cmp    w2, #0                  ; check if neg flag is set
    csel   w0, w1, w0, ne          ; select -i if neg flag is set, i otherwise

    ldp    x19, x20, [sp, 16]      ; restore callee-saved registers
    ldp    x29, x30, [sp], 32      ; exit function
    ret