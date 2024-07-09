	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0
	.globl	_quant                          ; -- Begin function quant
	.p2align	2
_quant:                                 ; @quant
; %bb.0:
	sub	sp, sp, #16
	str	w0, [sp, #12]
	str	w1, [sp, #8]
	str	wzr, [sp]
	ldr	w8, [sp, #12]
	tbz	w8, #31, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	w8, [sp]
	add	w8, w8, #1
	str	w8, [sp]
	ldr	w9, [sp, #12]
	mov	w8, #0                          ; =0x0
	subs	w8, w8, w9
	str	w8, [sp, #12]
	b	LBB0_2
LBB0_2:
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #8]
	sdiv	w8, w8, w9
	str	w8, [sp, #4]
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #8]
	ldr	w10, [sp, #4]
	mul	w9, w9, w10
	subs	w8, w8, w9
	ldr	w9, [sp, #8]
	mov	w10, #2                         ; =0x2
	sdiv	w9, w9, w10
	subs	w8, w8, w9
	b.le	LBB0_4
	b	LBB0_3
LBB0_3:
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB0_4
LBB0_4:
	ldr	w9, [sp, #8]
	ldr	w8, [sp, #4]
	mul	w8, w8, w9
	str	w8, [sp, #4]
	ldr	w8, [sp]
	cbz	w8, LBB0_6
	b	LBB0_5
LBB0_5:
	ldr	w9, [sp, #4]
	mov	w8, #0                          ; =0x0
	subs	w8, w8, w9
	str	w8, [sp, #4]
	b	LBB0_6
LBB0_6:
	ldr	w0, [sp, #4]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
