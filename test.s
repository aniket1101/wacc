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
	mov rax, 1
	mov r14, 2
	sub rax, r14
	add rax, 3
	mov r14, 4
	sub rax, r14
	add rax, 5
	mov r14, 6
	sub rax, r14
	add rax, 7
	mov r14, 8
	sub rax, r14
	add rax, 9
	mov r14, 10
	sub rax, r14
	add rax, 11
	mov r14, 12
	sub rax, r14
	add rax, 13
	mov r13, 14
	sub rax, r13
	add rax, 15
	mov r12, 16
	sub rax, r12
	add rax, 17
	mov r12, rax
	mov rax, r12
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret

_exit:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call exit@plt
	mov rsp, rbp
	pop rbp
	ret
