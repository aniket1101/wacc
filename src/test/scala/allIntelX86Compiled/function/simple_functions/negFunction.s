.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
 push rbp
 # push {rbx, r12}
 sub rsp, 16
 mov qword ptr [rsp], rbx
 mov qword ptr [rsp + 8], r12
 mov rbp, rsp
 # Stack pointer unchanged, no stack allocated variables
 sub rsp, 8
 mov rax, 0
 mov rdi, rax
 mov rax, 0
 mov rsi, rax
 mov rax, 1
 mov rdx, rax
 mov rax, 4
 mov rcx, rax
 mov rax, 2
 mov r8, rax
 mov rax, 3
 mov r9, rax
 mov rax, 7
 mov dword ptr [rsp + 4], eax
 mov rax, 4
 mov dword ptr [rsp], eax
 call wacc_f
 mov r11, rax
 add rsp, 8
 mov rax, r11
 mov r12, rax
 # Stack pointer unchanged, no stack allocated arguments
 mov rax, r12
 mov rdi, rax
 # statement primitives do not return results (but will clobber r0/rax)
 call _printi
 call _println
 # Stack pointer unchanged, no stack allocated variables
 mov rax, 0
 # pop {rbx, r12}
 mov rbx, qword ptr [rsp]
 mov r12, qword ptr [rsp + 8]
 add rsp, 16
 pop rbp
 ret

wacc_f:
 push rbp
 # push {r12, r13, r14}
 sub rsp, 24
 mov qword ptr [rsp], r12
 mov qword ptr [rsp + 8], r13
 mov qword ptr [rsp + 16], r14
 mov rbp, rsp
 # Stack pointer unchanged, no stack allocated variables
 mov eax, edx
 add eax, ecx
 jo _errOverflow
 movsx rax, eax
 push rax
 pop rax
 mov rax, rax
 mov r12, rax
 mov eax, r8d
 imul eax, r9d
 jo _errOverflow
 movsx rax, eax
 push rax
 pop rax
 mov rax, rax
 mov r13, rax
 movsx rbx, dword ptr [rbp + 40]
 movsx rax, dword ptr [rbp + 44]
 mov eax, eax
 sub eax, ebx
 jo _errOverflow
 movsx rax, eax
 push rax
 pop rax
 mov rax, rax
 mov r14, rax
 mov eax, r13d
 imul eax, r14d
 jo _errOverflow
 movsx rax, eax
 push rax
 pop rbx
 mov eax, r12d
 add eax, ebx
 jo _errOverflow
 movsx rax, eax
 push rax
 pop rax
 mov rax, rax
 # reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
 mov rsp, rbp
 # pop {r12, r13, r14}
 mov r12, qword ptr [rsp]
 mov r13, qword ptr [rsp + 8]
 mov r14, qword ptr [rsp + 16]
 add rsp, 24
 pop rbp
 ret
 # Stack pointer unchanged, no stack allocated variables
 # 'ere be dragons: this is 100% dead code, functions always end in returns!

.section .rodata
# length of .L._prints_str0
 .int 4
.L._prints_str0:
 .asciz "%.*s"
.text
_prints:
 push rbp
 mov rbp, rsp
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 mov rdx, rdi
 mov esi, dword ptr [rdi - 4]
 lea rdi, [rip + .L._prints_str0]
 # on x86, al represents the number of SIMD registers used as variadic arguments
 mov al, 0
 call printf@plt
 mov rdi, 0
 call fflush@plt
 mov rsp, rbp
 pop rbp
 ret

.section .rodata
# length of .L._printi_str0
 .int 2
.L._printi_str0:
 .asciz "%d"
.text
_printi:
 push rbp
 mov rbp, rsp
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 mov esi, edi
 lea rdi, [rip + .L._printi_str0]
 # on x86, al represents the number of SIMD registers used as variadic arguments
 mov al, 0
 call printf@plt
 mov rdi, 0
 call fflush@plt
 mov rsp, rbp
 pop rbp
 ret

.section .rodata
# length of .L._println_str0
 .int 0
.L._println_str0:
 .asciz ""
.text
_println:
 push rbp
 mov rbp, rsp
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 lea rdi, [rip + .L._println_str0]
 call puts@plt
 mov rdi, 0
 call fflush@plt
 mov rsp, rbp
 pop rbp
 ret

.section .rodata
# length of .L._errOverflow_str0
 .int 52
.L._errOverflow_str0:
 .asciz "fatal error: integer overflow or underflow occurred\n"
.text
_errOverflow:
 # external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
 and rsp, -16
 lea rdi, [rip + .L._errOverflow_str0]
 call _prints
 mov dil, -1
 call exit@plt
