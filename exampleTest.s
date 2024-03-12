	.intel_syntax noprefix
	.globl main
	.section .rodata
	.text
main:
	push rbp
	# push {rbx, r12, r13, r14, r15}
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# 3 element array
	mov edi, 16
	call _malloc
	mov r11, rax
	# array pointers are shifted forwards by 4 bytes (to account for size)
	mov r11, r11
	add r11, 4
	mov eax, 3
	mov dword ptr [r11 - 4], eax
	mov eax, 2
	mov dword ptr [r11], eax
	mov eax, 0
	mov dword ptr [r11 + 4], eax
	mov eax, 1
	mov dword ptr [r11 + 8], eax
	mov rax, r11
	mov r12, rax
	# 3 element array
	mov edi, 16
	call _malloc
	mov r11, rax
	# array pointers are shifted forwards by 4 bytes (to account for size)
	mov r11, r11
	add r11, 4
	mov eax, 3
	mov dword ptr [r11 - 4], eax
	mov eax, 1
	mov dword ptr [r11], eax
	mov eax, 2
	mov dword ptr [r11 + 4], eax
	mov eax, 0
	mov dword ptr [r11 + 8], eax
	mov rax, r11
	mov r13, rax
	# 3 element array
	mov edi, 16
	call _malloc
	mov r11, rax
	# array pointers are shifted forwards by 4 bytes (to account for size)
	mov r11, r11
	add r11, 4
	mov eax, 3
	mov dword ptr [r11 - 4], eax
	mov eax, 5
	mov dword ptr [r11], eax
	mov eax, 6
	mov dword ptr [r11 + 4], eax
	mov eax, 7
	mov dword ptr [r11 + 8], eax
	mov rax, r11
	mov r14, rax
	mov eax, 0
	mov r15d, eax
	# Stack pointer unchanged, no stack allocated arguments
	mov eax, r15d
	mov edi, eax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov eax, r9d
	mov eax, eax
	mov edi, eax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov eax, r9d
	mov eax, eax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r12
	call _arrLoad4
	mov eax, r9d
	mov eax, eax
	mov edi, eax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov eax, r9d
	mov eax, eax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r12
	call _arrLoad4
	mov eax, r9d
	mov eax, eax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r14
	call _arrLoad4
	mov eax, r9d
	mov eax, eax
	mov edi, eax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	# pop {rbx, r12, r13, r14, r15}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
	
.section .rodata
	.int 4
.L._prints_str0:
	.asciz "%.*s"
.text
_prints:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov rdx, rdi
	mov esi, dword ptr [rdi - 4]
	lea rdi, [rip + .L._prints_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
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
	.int 2
.L._printi_str0:
	.asciz "%d"
.text
_printi:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov esi, edi
	lea rdi, [rip + .L._printi_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
	.int 0
.L._println_str0:
	.asciz ""
.text
_println:
	push rbp
	mov rbp, rsp
	and rsp, -16
	lea rdi, [rip + .L._println_str0]
	call puts@plt
	mov rdi, 0
	call fflush@plt
	mov rsp, rbp
	pop rbp
	ret


_arrLoad4:
	# Special calling convention: array ptr passed in R9, index in R10, and return into R9
	push rbx
	cmp r10d, 0
	cmovl rsi, r10 # this must be a 64-bit move so that it doesn't truncate if the move fails
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rsi, r10 # this must be a 64-bit move so that it doesn't truncate if the move fails
	jge _errOutOfBounds
	mov r9d, dword ptr [r9 + 4*r10]
	pop rbx
	ret

.text
_arrLoad4:
	push rbx
	cmp r10d, 0
	cmovl rdi, rsi
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rdi, r10
	jge _errOutOfBounds
	mov esi, dword ptr [r9 + r10 * 4]
	pop rbx
	ret

.section .rodata
	.int 27
.L._errOutOfMemory_str0:
	.asciz "fatal error: out of memory\n"
.text
_errOutOfMemory:
	and rsp, -16
	lea rdi, [rip + .L._errOutOfMemory_str0]
	call _prints
	mov dil, -1
	call exit@plt

.section .rodata
	# length of .L._errOutOfBounds_str0
	.int 42
.L._errOutOfBounds_str0:
	.asciz "fatal error: array index %d out of bounds\n"
.text
_errOutOfBounds:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errOutOfBounds_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov dil, -1
	call exit@plt
