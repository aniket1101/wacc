.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	mov edi, 16
	call _malloc
	mov rbx, rax
	add rbx, 4
	mov eax, 3
	mov dword ptr [rbx - 4], eax
	mov eax, 2
	mov dword ptr [rbx], eax
	mov eax, 0
	mov dword ptr [rbx + 4], eax
	mov eax, 1
	mov dword ptr [rbx + 8], eax
	mov r12, rbx
	mov edi, 16
	call _malloc
	mov rbx, rax
	add rbx, 4
	mov eax, 3
	mov dword ptr [rbx - 4], eax
	mov eax, 1
	mov dword ptr [rbx], eax
	mov eax, 2
	mov dword ptr [rbx + 4], eax
	mov eax, 0
	mov dword ptr [rbx + 8], eax
	mov r13, rbx
	mov edi, 16
	call _malloc
	mov rbx, rax
	add rbx, 4
	mov eax, 3
	mov dword ptr [rbx - 4], eax
	mov eax, 5
	mov dword ptr [rbx], eax
	mov eax, 6
	mov dword ptr [rbx + 4], eax
	mov eax, 7
	mov dword ptr [rbx + 8], eax
	mov r14, rbx
	mov rax, 0
	mov r15, rax
	jmp .L0

.text
_malloc:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call malloc@plt
	cmp rax, 0
	je _errOutOfMemory
	mov rsp, rbp
	pop rbp
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
	.int 52
.L._errOverflow_str0:
	.asciz "fatal error: integer overflow or underflow occurred\n"
.text
_errOverflow:
	and rsp, -16
	lea rdi, [rip + .L._errOverflow_str0]
	call _prints
	mov dil, -1
	call exit@plt

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

.section .rodata
	.int 42
.L._errOutOfBounds_str0:
	.asciz "fatal error: array index %d out of bounds\n"
.text
_errOutOfBounds:
	and rsp, -16
	lea rdi, [rip + .L._errOutOfBounds_str0]
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov dil, -1
	call exit@plt

.text
_arrLoad4:
	push rbx
	cmp r10d, 0
	cmovl rsi, r10
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rsi, r10
	jge _errOutOfBounds
	mov r9d, dword ptr [r9 + r10 * 4]
	pop rbx
	ret

.text
_arrStore4:
	push rbx
	cmp r10d, 0
	cmovl rsi, r10
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rsi, r10
	jge _errOutOfBounds
	mov dword ptr [r9 + r10 * 4], eax
	pop rbx
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

.L0:
	mov rax, r15
	mov rbx, 3
	cmp rax, rbx
	setne al
	movsx rax, al
	cmp rax, 1
	je .L1
	jmp .L2

.L1:
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov r10, r9
	mov r9, r12
	call _arrLoad4
	mov r10, r9
	mov r9, r14
	push r9
	push r10
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov r10, r9
	mov r9, r12
	call _arrLoad4
	mov r10, r9
	mov r9, r14
	call _arrLoad4
	mov rax, r9
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	pop r10
	pop r9
	call _arrStore4
	mov r10d, r15d
	mov r9, r13
	call _arrLoad4
	mov r10, r9
	mov r9, r12
	call _arrLoad4
	mov r10, r9
	mov r9, r14
	call _arrLoad4
	mov rax, r9
	mov rdi, rax
	call _printi
	call _println
	mov rax, r15
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	mov r15, rax
	jmp .L0

.L2:
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
