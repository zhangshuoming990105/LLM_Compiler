.arch armv8-a
    .text
    .p2align    2
    .globl _quant
_quant:
    mov    w2, #0                  ; neg = 0
    cmp    w0, #0                  ; compare n with 0
    cneg   w0, w0, lt              ; if n < 0, w0 = -w0
    cset   w2, lt                  ; w2 (neg) = 1 if n < 0, else 0
    sdiv   w3, w0, w1              ; i = n / m
    msub   w4, w3, w1, w0          ; w4 = n - m * i (remainder)
    asr    w5, w1, #1              ; w5 = m / 2
    cmp    w4, w5                  ; compare remainder with m/2
    cinc   w3, w3, gt              ; increment i if remainder > m/2
    mul    w0, w3, w1              ; i *= m
    neg    w3, w0                  ; w3 = -i
    cmp    w2, #0                  ; check if original n was negative
    csel   w0, w3, w0, ne          ; select -i if original n was negative, i otherwise
    ret