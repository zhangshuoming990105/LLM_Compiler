	.arch armv8-a
	.text
	.p2align	2
	.globl _quant
_quant:
LFB0:
	stp	x29, x30, [sp, -32]!    ; enter function
	mov	x29, sp
	stp	w19, w20, [sp, 16]    ; save callee-saved registers

	mov	w19, w0    ; w19 = n
	mov	w20, w1    ; w20 = m
	mov	w2, 0    ; neg = 0

	cmp	w19, 0    ; compare n with 0
	bge	L2    ; if n >= 0, skip to L2
	add	w2, w2, 1    ; neg++
	neg	w19, w19    ; n = -n

L2:
	sdiv	w0, w19, w20    ; i = n / m
	mul	w1, w0, w20    ; w1 = m * i
	sub	w1, w19, w1    ; w1 = n - m * i
	asr	w3, w20, 1    ; w3 = m / 2
	cmp	w1, w3    ; compare (n - m * i) with (m / 2)
	ble	L3    ; if (n - m * i) <= (m / 2), skip to L3
	add	w0, w0, 1    ; i += 1

L3:
	mul	w0, w0, w20    ; i *= m
	cmp	w2, 0    ; compare neg with 0
	beq	L4    ; if neg == 0, skip to L4
	neg	w0, w0    ; i = -i

L4:
	ldp	w19, w20, [sp, 16]    ; restore callee-saved registers
	ldp	x29, x30, [sp], 32    ; exit function
	ret
