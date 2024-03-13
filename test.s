.intel_syntax noprefix
.globl main
.section .rodata
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
	sub rsp, 96
	mov rax, 1
	mov r12, rax
	mov rax, 2
	mov r13, rax
	mov rax, 3
	mov r14, rax
	mov rax, 4
	mov r15, rax
	mov rax, 5
	mov qword ptr [rbp - 96], rax
	mov rax, 6
	mov qword ptr [rbp - 88], rax
	mov rax, 7
	mov qword ptr [rbp - 80], rax
	mov rax, 8
	mov qword ptr [rbp - 72], rax
	mov rax, 1
	mov qword ptr [rbp - 64], rax
	mov rax, 2
	mov qword ptr [rbp - 56], rax
	mov rax, 3
	mov qword ptr [rbp - 48], rax
	mov rax, 4
	mov qword ptr [rbp - 40], rax
	mov rax, 5
	mov qword ptr [rbp - 32], rax
	mov rax, 6
	mov qword ptr [rbp - 24], rax
	mov rax, 7
	mov qword ptr [rbp - 16], rax
	mov rax, 8
	mov qword ptr [rbp - 8], rax
	mov rax, 0
	add rsp, 96
	mov rbp, rsp
	mov rbx, qword ptr [rsp - 0]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
