	.arch armv8-a
	.text
	.p2align	2
	.globl _main
_main:
LFB0:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x0, lC0@PAGE
	add	x0, x0, lC0@PAGEOFF;momd
	bl	_printf
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.text
	.cstring
	.align	3
lC0:
	.ascii "Hello, World!\0"
