.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	# Stack pointer unchanged, no stack allocated variables
	mov r9, 1
	mov r10, 2
	mov eax, r9
	add r9, r10
	mov r9, eax
	mov r8 r9
 # Stack pointer unchanged, no stack allocated variables
	ret