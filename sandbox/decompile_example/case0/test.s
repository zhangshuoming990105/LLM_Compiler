	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 4
	.globl	_quant                          ; -- Begin function quant
	.p2align	2
_quant:                                 ; @quant
	.cfi_startproc
; %bb.0:
	cmp	w0, #0
	cneg	w8, w0, mi
	sdiv	w9, w8, w1
	msub	w8, w9, w1, w8
	cmp	w1, #0
	cinc	w10, w1, lt
	cmp	w8, w10, asr #1
	cinc	w8, w9, gt
	cmp	w0, #0
	mul	w8, w8, w1
	cneg	w0, w8, lt
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
