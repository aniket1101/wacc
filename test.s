.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 32
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov rbp, rsp
	mov rax, 1
	mov rdi, rax
	call wacc_assertions.True
	mov r12, rax
	mov rax, 1
	mov rdi, rax
	call wacc_assertions.True
	mov r13, rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	add rsp, 32
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

.L0:
	mov rax, -1
	push rdi
	mov rdi, rax
	call _exit
	pop rdi
	jmp .L1

.L1:
	mov rax, rdi

wacc_assertions.True:
	push rbp
	push rbx
	mov rbp, rsp
	mov rax, rdi
	cmp rax, 1
	setne al
	movsx rax, al
	cmp rax, 1
	je .L0
	jmp .L1
	pop rbx
	pop rbp
	ret
