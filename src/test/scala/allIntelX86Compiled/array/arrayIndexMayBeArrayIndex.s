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
	mov rax, 3
	mov dword ptr [r11 - 4], eax
	mov rax, 2
	mov dword ptr [r11], eax
	mov rax, 0
	mov dword ptr [r11 + 4], eax
	mov rax, 1
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
	mov rax, 3
	mov dword ptr [r11 - 4], eax
	mov rax, 1
	mov dword ptr [r11], eax
	mov rax, 2
	mov dword ptr [r11 + 4], eax
	mov rax, 0
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
	mov rax, 3
	mov dword ptr [r11 - 4], eax
	mov rax, 5
	mov dword ptr [r11], eax
	mov rax, 6
	mov dword ptr [r11 + 4], eax
	mov rax, 7
	mov dword ptr [r11 + 8], eax
	mov rax, r11
	mov r14, rax
	mov rax, 0
	mov r15, rax
	jmp .L0
.L1:
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov eax, r9d
	mov rax, rax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r12
	call _arrLoad4
	mov eax, r9d
	mov rax, rax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r14
	call _arrLoad4
	mov eax, r9d
	mov eax, eax
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov eax, r9d
	mov rax, rax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r12
	call _arrLoad4
	mov eax, r9d
	mov rax, rax
	push rax
	pop r10
	mov r10d, r10d
	pop rax
	mov rax, rax
	mov r9, r14
	call _arrStore4
	# Stack pointer unchanged, no stack allocated arguments
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov eax, r9d
	mov rax, rax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r12
	call _arrLoad4
	mov eax, r9d
	mov rax, rax
	push rax
	pop r10
	mov r10d, r10d
	mov r9, r14
	call _arrLoad4
	mov eax, r9d
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	mov eax, r15d
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov r15, rax
.L0:
	cmp r15, 3
	jne .L1
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

_arrStore4:
	# Special calling convention: array ptr passed in R9, index in R10, value to store in RAX
	push rbx
	cmp r10d, 0
	cmovl rsi, r10
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rsi, r10
	jge _errOutOfBounds
	mov dword ptr [r9 + 4*r10], eax
	pop rbx
	ret

_arrLoad4:
	# Special calling convention: array ptr passed in R9, index in R10, and return into R9
	push rbx
	cmp r10d, 0
	cmovl rsi, r10
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rsi, r10
	jge _errOutOfBounds
	movsx r9, dword ptr [r9 + 4*r10]
	pop rbx
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

.section .rodata
# length of .L._errOverflow_str0
	.int 52
.L._errOverflow_str0:
	.asciz "fatal error: integer overflow or underflow occurred\n"
.text
_errOverflow:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errOverflow_str0]
	call _prints
	mov dil, -1
	call exit@plt
