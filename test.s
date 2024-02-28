.intel_syntax noprefix
.globl main
push rbp
	mov dword ptr [rsp + 8], rbx
	mov dword ptr [rsp + 8], varReg2
	mov rbp, rsp
	mov varReg2, rax
	mov rbx, dword ptr [rsp + 8]
	mov varReg2, dword ptr [rsp + 8]
	pop rbp
	ret
