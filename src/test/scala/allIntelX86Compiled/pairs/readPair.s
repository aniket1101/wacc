.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
	.int 39
.L.str0:
	.asciz "Please enter the first element (char): "
# length of .L.str1
	.int 39
.L.str1:
	.asciz "Please enter the second element (int): "
# length of .L.str2
	.int 22
.L.str2:
	.asciz "The first element was "
# length of .L.str3
	.int 23
.L.str3:
	.asciz "The second element was "
.text
main:
	push rbp
	# push {rbx, r12, r13, r14}
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov edi, 16
	call _malloc
	mov r11, rax
	mov rax, 0
	mov qword ptr [r11], rax
	mov rax, 0
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	mov rax, 48
	mov r13, rax
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r13
	mov rdi, rax
	call _readc
	mov r11, rax
	mov rax, r11
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, r13
	mov qword ptr [r12], rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	mov rax, 0
	mov r14, rax
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r14
	mov rdi, rax
	call _readi
	mov r11, rax
	mov rax, r11
	mov r14, rax
	cmp r12, 0
	je _errNull
	mov rax, r14
	mov qword ptr [r12 + 8], rax
	mov rax, 0
	mov r13, rax
	mov rax, -1
	mov r14, rax
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str3]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r14, rax
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	# pop {rbx, r12, r13, r14}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret

.section .rodata
# length of .L._readc_str0
	.int 3
.L._readc_str0:
	.asciz " %c"
.text
_readc:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	# RDI contains the "original" value of the destination of the read
	# allocate space on the stack to store the read: preserve alignment!
	# the passed default argument should be stored in case of EOF
	sub rsp, 16
	mov byte ptr [rsp], dil
	lea rsi, qword ptr [rsp]
	lea rdi, [rip + .L._readc_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call scanf@plt
	movsx rax, byte ptr [rsp]
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

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
# length of .L._readi_str0
	.int 2
.L._readi_str0:
	.asciz "%d"
.text
_readi:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	# RDI contains the "original" value of the destination of the read
	# allocate space on the stack to store the read: preserve alignment!
	# the passed default argument should be stored in case of EOF
	sub rsp, 16
	mov dword ptr [rsp], edi
	lea rsi, qword ptr [rsp]
	lea rdi, [rip + .L._readi_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call scanf@plt
	movsx rax, dword ptr [rsp]
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

_malloc:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	call malloc@plt
	cmp rax, 0
	je _errOutOfMemory
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
# length of .L._printc_str0
	.int 2
.L._printc_str0:
	.asciz "%c"
.text
_printc:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	mov sil, dil
	lea rdi, [rip + .L._printc_str0]
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

.section .rodata
# length of .L._errOutOfMemory_str0
	.int 27
.L._errOutOfMemory_str0:
	.asciz "fatal error: out of memory\n"
.text
_errOutOfMemory:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errOutOfMemory_str0]
	call _prints
	mov dil, -1
	call exit@plt

.section .rodata
# length of .L._errNull_str0
	.int 45
.L._errNull_str0:
	.asciz "fatal error: null pair dereferenced or freed\n"
.text
_errNull:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errNull_str0]
	call _prints
	mov dil, -1
	call exit@plt
