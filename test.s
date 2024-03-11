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
	mov rax, 1
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 0
	mov r14, rax
	mov rax, 1
	mov r15, rax
	mov rax, r12
	mov rbx, r13
	mov rbx, r14
	cmp rbx, rbx
	setne bl
	movsx rbx, bl
	and al, bl
	mov rbx, r15
	or al, bl
	mov rdi, rax
	call _printb
	call _println
	mov rax, r12
	mov r11, r13
	and al, r11b
	mov r10, r14
	mov r11, r15
	or r10b, r11b
	cmp rax, r10
	setne al
	movsx rax, al
	mov rdi, rax
	call _printb
	call _println
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
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
