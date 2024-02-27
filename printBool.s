.intel_syntax noprefix
.globl main
.section .rodata
.section .rodata
  .int 8
.L.str0:
  .asciz "True is "
.section .rodata
  .int 9
.L.str1:
  .asciz "False is "
.text
main:
	push rbp
	push rbx
	mov rbp, rsp
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	mov rax, 1
	mov rdi, rax
	call _printb
	call _println
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	mov rax, 0
	mov rdi, rax
	call _printb
	call _println
	mov rax, 0
	pop rbx
	pop rbp
	ret

.section .rodata
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
.section .rodata
  .int 5
.L._printb_str0:
  .asciz "false"
.section .rodata
  .int 4
.L._printb_str1:
  .asciz "true"
.section .rodata
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
