.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	mov rax, 0
	mov rdi, rax
	call wacc_assertions.True
	mov r12, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret

wacc_assertions.True:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov rbp, rsp
	mov rax, rdi
	cmp rax, 1
	je .L0
	mov rax, -1
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	jmp .L1

_exit:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call exit@plt
	mov rsp, rbp
	pop rbp
	ret

.L0:
	jmp .L1

.L1:
	mov rax, rdi
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
