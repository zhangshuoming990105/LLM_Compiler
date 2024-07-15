	.arch armv8-a
	.text
	.p2align	2
	.globl _has_close_elements
_has_close_elements:
LFB0:
	stp	x29, x30, [sp, -32]!    ; enter function
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0    ; numbers
	mov	w20, w1    ; size
	ldr	s2, [sp, 40]    ; load threshold

	mov	w0, wzr    ; i = 0
	b	.L2

.L3:    ; outer loop
	mov	w1, wzr    ; j = 0
	b	.L4

.L5:    ; inner loop
	cmp	w0, w1
	beq	.L6    ; if (i == j) continue

	ldr	s3, [x19, w0, sxtw #2]    ; load numbers[i]
	ldr	s4, [x19, w1, sxtw #2]    ; load numbers[j]
	fsub	s3, s3, s4    ; numbers[i] - numbers[j]
	fabs	s3, s3    ; fabs(numbers[i] - numbers[j])
	fcmp	s3, s2    ; compare distance with threshold
	bge	.L6    ; if (distance >= threshold) continue

	mov	w0, 1    ; return true
	b	.L1

.L6:
	add	w1, w1, 1    ; j++
.L4:
	cmp	w1, w20
	blt	.L5

	add	w0, w0, 1    ; i++
.L2:
	cmp	w0, w20
	blt	.L3

	mov	w0, 0    ; return false
.L1:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32    ; exit function
	ret