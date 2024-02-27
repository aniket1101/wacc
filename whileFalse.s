.intel_syntax noprefix
.globl main
.section .rodata
.section .rodata
  .int 10
.L.str0:
  .asciz "looping..."
             .section .rodata
  .int 11
.L.str1:
  .asciz "end of loop"
             .text
main:
	push rbp
	push rbx
	mov rbp, rsp
	jmp .L0

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

.L0:
	mov rax, 0
	cmp rax, 1
	je .L1
	jmp .L2

.L1:
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	jmp .L2

.L2:
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	call _prints
	call _println
	mov rax, 0
	pop rbx
	pop rbp
	ret
