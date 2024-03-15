.intel_syntax noprefix
.globl main
.section .rodata
	.int 5
.L.str0:
	.asciz "y is "
	.int 11
.L.str1:
	.asciz "y is still "
	.int 5
.L.str2:
	.asciz "x is "
	.int 9
.L.str3:
	.asciz "x is now "
.text
main:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp - 0], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	mov rax, 1
	mov r12, rax
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	lea rax, [rip + .L.str0]
	mov rdi, rax
	call _prints
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, r12
	mov rdi, rax
	call wacc_f
	mov r13, rax
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	lea rax, [rip + .L.str1]
	mov rdi, rax
	call _prints
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, 0
	mov rbp, rsp
	mov rbx, qword ptr [rsp - 0]
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

wacc_f:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp - 0], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	lea rax, [rip + .L.str2]
	mov rdi, rax
	call _prints
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rax, rdi
	mov rdi, rax
	call _printi
	call _println
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, 5
	mov r12, rax
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	lea rax, [rip + .L.str3]
	mov rdi, rax
	call _prints
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	mov rax, r12
	mov rbp, rsp
	mov rbx, qword ptr [rsp - 0]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
