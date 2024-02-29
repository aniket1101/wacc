.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 24
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov rbp, rsp
	mov rax, 69
	mov r12, rax
	mov rax, 2
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, r13
	mov rdi, rax
	call _printb
	call _println
	mov rax, 69
	mov r12, rax
	mov rax, r12
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
	.int 5
.L._printb_str0:
	.asciz "false"
	.int 4
.L._printb_str1:
	.asciz "true"
	.int 4
.L._printb_str2:
	.asciz "%.*s"
.text
_printb:
	push rbp
	mov rbp, rsp
	and rsp, -16
	cmp dil, 0
	jne .L_printb0
	lea rdx, [rip + .L._printb_str0]
	jmp .L_printb1

.text
.L_printb0:
	lea rdx, [rip + .L._printb_str1]

.text
.L_printb1:
	mov esi, dword ptr [rdx - 4]
	lea rdi, [rip + .L._printb_str2]
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
