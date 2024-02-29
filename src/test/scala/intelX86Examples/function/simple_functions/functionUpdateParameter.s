.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
	.int 5
.L.str0:
	.asciz "x is "
# length of .L.str1
	.int 9
.L.str1:
	.asciz "x is now "
# length of .L.str2
	.int 5
.L.str2:
	.asciz "y is "
# length of .L.str3
	.int 11
.L.str3:
	.asciz "y is still "
.text
main:
	push rbp
	# push {rbx, r12, r13}
	sub rsp, 24
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 1
	mov r12, rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	call wacc_f
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r11
	mov r13, rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str3]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	# pop {rbx, r12, r13}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	add rsp, 24
	pop rbp
	ret

wacc_f:
	push rbp
	mov rbp, rsp
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	pop rdi
	mov rax, 5
	mov rdi, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	pop rdi
	mov rax, rdi
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

.section .rodata
# length of .L._prints_str0
	.int 4
.L._prints_str0:
	.asciz "%.*s"
.text
_prints:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	mov rdx, rdi
	mov esi, dword ptr [rdi - 4]
	lea rdi, [rip + .L._prints_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
# length of .L._printi_str0
	.int 2
.L._printi_str0:
	.asciz "%d"
.text
_printi:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	mov esi, edi
	lea rdi, [rip + .L._printi_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
# length of .L._println_str0
	.int 0
.L._println_str0:
	.asciz ""
.text
_println:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._println_str0]
	call puts@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret
