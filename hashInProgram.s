.intel_syntax noprefix
.globl main
.section .rodata
	.int 33
.L.str0:
	.asciz "We can print the hash character: "
	.int 41
.L.str1:
	.asciz "We can also print # when its in a string."
.text
main:
	push rbp
	sub rsp, 16
	mov dword ptr [rsp], rbx
	mov dword ptr [rsp + 8], varReg15
	mov rbp, rsp
	mov rax, 0
	mov rbx, rax
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	mov rax, 35
	mov rdi, rax
	call _printc
	call _println
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	mov rax, 0
	mov rbx, dword ptr [rsp]
	mov rbx, dword ptr [rsp + 8]
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
.L._printc_str0:
	.asciz "%c"
.text
_printc:
	push rbp
	mov rbp, rsp
	and rsp, -16
	mov sil, dil
	lea rdi, [rip + .L._printc_str0]
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
