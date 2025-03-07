#
# Copyright (C) 2021 by Intel Corporation
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#

	.intel_syntax noprefix

	.globl _median_avx_overlap
	.globl median_avx_overlap

	# void median_avx_overlap(float *x, float *y, uint64_t len);
	# On entry:
	#     rdi = x
	#     rsi = y
	#     rdx = len

	.text

_median_avx_overlap:
median_avx_overlap:

	push rbx

	xor ebx, ebx
	mov rcx, rdx   # mov rcx, len

	# rdi and rsi already point to x and y the inputs and outputs
	# mov rdi, inPtr
	# mov rsi, outPtr

	vmovaps ymm0, [rdi]
loop_start:
	vshufps ymm2, ymm0, [rdi+16], 0x4E
	vshufps ymm1, ymm0, ymm2, 0x99
	add rbx, 8
	add rdi, 32
	vminps ymm4, ymm0, ymm1
	vmaxps ymm0, ymm0, ymm1
	vminps ymm3, ymm0, ymm2
	vmaxps ymm5, ymm3, ymm4
	vmovaps [rsi], ymm5
	add rsi, 32
	vmovaps ymm0, [rdi]
	cmp rbx, rcx
	jl loop_start

	vzeroupper
	pop rbx
	ret
