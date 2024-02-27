.intel_syntax noprefix
.globl main
.section .rodata
.section .rodata
  .int 32
.L.str0:
  .asciz "An escaped character example is "
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
	mov rax, 34
	mov rdi, rax
	call _printc
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
