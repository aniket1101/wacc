.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 16
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], scratchReg2
	mov rbp, rsp
	mov rax, 5
	push rdi
	mov rdi, rax
	mov rax, 7
	push rsi
	mov rsi, rax
	call wacc_foo
	mov scratchReg2, rax
	pop rsi
	pop rdi
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov scratchReg2, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret

wacc_wacc_foo:
	push rbp
	push rbx
	mov rbp, rsp
	mov rax, rdi
	mov scratchReg1, rsi
	add scratchReg1, rax
	pop rbx
	pop rbp
	ret
