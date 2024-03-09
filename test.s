.intel_syntax noprefix
.globl main
.section .rodata
	.int 22
.L.str0:
	.asciz "An example integer is "
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	lea rax, [rip + .L.str0]
	mov rdi, rax
	call _prints
	call wacc_time.currentDay
	mov r12, rax
	mov rax, r12
	mov rdi, rax
	call _printi
	call _println
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
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

wacc_time.time:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov rdx, rdi
	call time@plt
	mov qword ptr [rbp - 8], rax
	mov rax, qword ptr [rbp - 8]
	mov rsp, rbp
	pop rbp
	ret

wacc_time.sleep:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov rdx, rdi
	call sleep@plt
	mov rsp, rbp
	pop rbp
	ret

wacc_time.currentYear:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call time@PLT
	mov qword ptr [rbp - 88], rax
	lea rax, qword ptr [rbp - 88]
	mov rdi, rax
	call localtime@PLT
	mov rcx, qword ptr [rax]
	mov rbx, qword ptr [rax + 8]
	mov qword ptr [rbp - 80], rcx
	mov qword ptr [rbp - 72], rbx
	mov rcx, qword ptr [rax + 16]
	mov rbx, qword ptr [rax + 24]
	mov qword ptr [rbp - 64], rcx
	mov qword ptr [rbp - 56], rbx
	mov rcx, qword ptr [rax + 32]
	mov rbx, qword ptr [rax + 40]
	mov qword ptr [rbp - 48], rcx
	mov qword ptr [rbp - 40], rbx
	mov rax, qword ptr [rax + 48]
	mov qword ptr [rbp - 32], rax
	mov eax, dword ptr [rbp - 60]
	add eax, 1900
	jo _errOverflow
	movsx rax, eax
	mov rsp, rbp
	pop rbp
	ret

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

wacc_time.currentMonth:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call time@PLT
	mov qword ptr [rbp - 88], rax
	lea rax, qword ptr [rbp - 88]
	mov rdi, rax
	call localtime@PLT
	mov rcx, qword ptr [rax]
	mov rbx, qword ptr [rax + 8]
	mov qword ptr [rbp - 80], rcx
	mov qword ptr [rbp - 72], rbx
	mov rcx, qword ptr [rax + 16]
	mov rbx, qword ptr [rax + 24]
	mov qword ptr [rbp - 64], rcx
	mov qword ptr [rbp - 56], rbx
	mov rcx, qword ptr [rax + 32]
	mov rbx, qword ptr [rax + 40]
	mov qword ptr [rbp - 48], rcx
	mov qword ptr [rbp - 40], rbx
	mov rax, qword ptr [rax + 48]
	mov qword ptr [rbp - 32], rax
	mov eax, dword ptr [rbp - 64]
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	mov rsp, rbp
	pop rbp
	ret

wacc_time.currentDay:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov edi, 0
	call time@PLT
	mov qword ptr [rbp - 24], rax
	lea rax, qword ptr [rbp - 24]
	mov rdi, rax
	call localtime@PLT
	mov qword ptr [rbp - 16], rax
	mov rax, qword ptr [rbp - 16]
	mov eax, dword ptr [rax + 12]
	mov rsp, rbp
	pop rbp
	ret
