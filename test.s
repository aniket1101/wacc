.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
<<<<<<< Updated upstream
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	mov rax, 2
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	add eax, 3
	jo _errOverflow
	movsx rax, eax
	add eax, 4
	jo _errOverflow
	movsx rax, eax
	add eax, 5
	jo _errOverflow
	movsx rax, eax
	add eax, 6
	jo _errOverflow
	movsx rax, eax
	add eax, 7
	jo _errOverflow
	movsx rax, eax
	add eax, 8
	jo _errOverflow
	movsx rax, eax
	add eax, 9
	jo _errOverflow
	movsx rax, eax
	add eax, 10
	jo _errOverflow
	movsx rax, eax
	add eax, 11
	jo _errOverflow
	movsx rax, eax
	add eax, 12
	jo _errOverflow
	movsx rax, eax
	add eax, 13
	jo _errOverflow
	movsx rax, eax
	add eax, 14
	jo _errOverflow
	movsx rax, eax
	add eax, 15
	jo _errOverflow
	movsx rax, eax
	add eax, 16
	jo _errOverflow
	movsx rax, eax
	add eax, 17
	jo _errOverflow
	movsx rax, eax
	mov r12, rax
	mov rax, -1
	mov qword ptr [rbp + 8], 2
	sub eax, dword ptr [rbp + 8]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 16], 3
	sub eax, dword ptr [rbp + 16]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 24], 4
	sub eax, dword ptr [rbp + 24]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 32], 5
	sub eax, dword ptr [rbp + 32]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 40], 6
	sub eax, dword ptr [rbp + 40]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 48], 7
	sub eax, dword ptr [rbp + 48]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 56], 8
	sub eax, dword ptr [rbp + 56]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 64], 9
	sub eax, dword ptr [rbp + 64]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 72], 10
	sub eax, dword ptr [rbp + 72]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 80], 11
	sub eax, dword ptr [rbp + 80]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 88], 12
	sub eax, dword ptr [rbp + 88]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 96], 13
	sub eax, dword ptr [rbp + 96]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 104], 14
	sub eax, dword ptr [rbp + 104]
	jo _errOverflow
	movsx rax, eax
	mov r11, 15
	sub eax, r11d
	jo _errOverflow
	movsx rax, eax
	mov r10, 16
	sub eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov rbx, 17
	sub eax, ebx
	jo _errOverflow
	movsx rax, eax
	mov r13, rax
	mov rax, 1
	mov qword ptr [rbp + 112], 2
	imul eax, dword ptr [rbp + 112]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 120], 3
	imul eax, dword ptr [rbp + 120]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 128], 4
	imul eax, dword ptr [rbp + 128]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 136], 5
	imul eax, dword ptr [rbp + 136]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 144], 6
	imul eax, dword ptr [rbp + 144]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 152], 7
	imul eax, dword ptr [rbp + 152]
	jo _errOverflow
	movsx rax, eax
	mov qword ptr [rbp + 160], 8
	imul eax, dword ptr [rbp + 160]
	jo _errOverflow
	movsx rax, eax
	mov r11, 9
	imul eax, r11d
	jo _errOverflow
	movsx rax, eax
	mov r10, 10
	imul eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov r14, rax
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	mov rax, r13
	mov rdi, rax
	call _printi
	call _println
	mov rax, r14
	mov rdi, rax
	call _printi
	call _println
	mov rax, r12
	mov r10, r13
	add eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov rdi, rax
	call _printi
	call _println
	mov rax, 10
	mov r15, rax
	mov r10, rax
	mov eax, r14d
	mov r11d, r15d
	cmp r11d, 0
	je _errDivZero
	cdq
	idiv r11d
	mov rdi, rax
	call _printi
	call _println
	mov rax, r12
	mov r11, r13
	add eax, r11d
	jo _errOverflow
	movsx rax, eax
	mov r10, rax
	mov eax, r14d
	mov r11d, r15d
	cmp r11d, 0
	je _errDivZero
	cdq
	idiv r11d
	add eax, r10d
	jo _errOverflow
	movsx rax, eax
	mov rdi, rax
	call _printi
	call _println
	mov r10, rax
	mov eax, r12d
	mov dword ptr [rbp + 168], r13d
	add eax, dword ptr [rbp + 168]
	jo _errOverflow
	movsx rax, eax
	mov r10, rax
	mov eax, r14d
	mov r11d, r15d
	cmp r11d, 0
	je _errDivZero
	cdq
	idiv r11d
	add eax, dword ptr [rbp + 176]
	jo _errOverflow
	movsx rax, eax
	mov r11d, 256
	cmp r11d, 0
	je _errDivZero
	cdq
	idiv r11d
	mov eax, edx
	mov rdi, rax
	call _printi
	call _println
	mov rax, r12
	mov r11, r13
	add eax, r11d
	jo _errOverflow
	movsx rax, eax
	mov r10, rax
	mov eax, r14d
	mov r11d, r15d
	cmp r11d, 0
	je _errDivZero
	cdq
	idiv r11d
	add eax, r10d
	jo _errOverflow
	movsx rax, eax
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
=======
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	mov edi, 8
	call _malloc
	mov rbx, rax
	lea rbx, qword ptr [rbx + 4]
	mov rax, 1
	mov dword ptr [rbx - 4], eax
	mov rax, 0
	mov dword ptr [rbx - 0], eax
	mov rax, rbx
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret

.text
_malloc:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call malloc@plt
	cmp rax, 0
	je _errOutOfMemory
	mov rsp, rbp
>>>>>>> Stashed changes
	pop rbp
	ret

.section .rodata
<<<<<<< Updated upstream
=======
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream

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

.section .rodata
	.int 40
.L._errDivZero_str0:
	.asciz "fatal error: division or modulo by zero\n"
.text
_errDivZero:
	and rsp, -16
	lea rdi, [rip + .L._errDivZero_str0]
	call _prints
	mov dil, -1
	call exit@plt

_exit:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call exit@plt
	mov rsp, rbp
	pop rbp
	ret
=======
>>>>>>> Stashed changes
