.intel_syntax noprefix
.globl main
.section .rodata
	.int 22
.L.str0:
	.asciz "An example integer is "
.text
main:
	push rbp
	sub rsp, 24
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov rbp, rsp
	lea rax, [rip + .L.str0]
	mov rdi, rax
	call _prints
	mov rax, 3
	mov rdi, rax
	call wacc_time.sleep
	mov r12, rax
	call wacc_time.time
	mov r13, rax
	mov rax, r13
	mov rdi, rax
	call _printi
	call _println
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	add rsp, 24
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
