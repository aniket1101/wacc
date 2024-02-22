.intel_syntax noprefix
.globl main
.section .rodata
# length of .L.str0
	.int 38
.L.str0:
	.asciz "========= Tic Tac Toe ================"
# length of .L.str1
	.int 38
.L.str1:
	.asciz "=  Because we know you want to win   ="
# length of .L.str2
	.int 38
.L.str2:
	.asciz "======================================"
# length of .L.str3
	.int 38
.L.str3:
	.asciz "=                                    ="
# length of .L.str4
	.int 38
.L.str4:
	.asciz "= Who would you like to be?          ="
# length of .L.str5
	.int 38
.L.str5:
	.asciz "=   x  (play first)                  ="
# length of .L.str6
	.int 38
.L.str6:
	.asciz "=   o  (play second)                 ="
# length of .L.str7
	.int 38
.L.str7:
	.asciz "=   q  (quit)                        ="
# length of .L.str8
	.int 39
.L.str8:
	.asciz "Which symbol you would like to choose: "
# length of .L.str9
	.int 16
.L.str9:
	.asciz "Invalid symbol: "
# length of .L.str10
	.int 17
.L.str10:
	.asciz "Please try again."
# length of .L.str11
	.int 15
.L.str11:
	.asciz "Goodbye safety."
# length of .L.str12
	.int 17
.L.str12:
	.asciz "You have chosen: "
# length of .L.str13
	.int 6
.L.str13:
	.asciz " 1 2 3"
# length of .L.str14
	.int 1
.L.str14:
	.asciz "1"
# length of .L.str15
	.int 6
.L.str15:
	.asciz " -+-+-"
# length of .L.str16
	.int 1
.L.str16:
	.asciz "2"
# length of .L.str17
	.int 1
.L.str17:
	.asciz "3"
# length of .L.str18
	.int 0
.L.str18:
	.asciz ""
# length of .L.str19
	.int 23
.L.str19:
	.asciz "What is your next move?"
# length of .L.str20
	.int 12
.L.str20:
	.asciz " row (1-3): "
# length of .L.str21
	.int 15
.L.str21:
	.asciz " column (1-3): "
# length of .L.str22
	.int 39
.L.str22:
	.asciz "Your move is invalid. Please try again."
# length of .L.str23
	.int 21
.L.str23:
	.asciz "The AI played at row "
# length of .L.str24
	.int 8
.L.str24:
	.asciz " column "
# length of .L.str25
	.int 31
.L.str25:
	.asciz "AI is cleaning up its memory..."
# length of .L.str26
	.int 52
.L.str26:
	.asciz "Internal Error: cannot find the next move for the AI"
# length of .L.str27
	.int 50
.L.str27:
	.asciz "Internal Error: symbol given is neither 'x' or 'o'"
# length of .L.str28
	.int 58
.L.str28:
	.asciz "Initialising AI. Please wait, this may take a few minutes."
# length of .L.str29
	.int 10
.L.str29:
	.asciz "Stalemate!"
# length of .L.str30
	.int 9
.L.str30:
	.asciz " has won!"
.text
main:
	push rbp
	# push {rbx, r12, r13, r14, r15}
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_chooseSymbol
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r12, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	call wacc_oppositeSymbol
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r13, rax
	mov rax, 120
	mov r14, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_allocateNewBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r15, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str28]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_initAI
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rcx, rax
	mov rax, 0
	mov rdx, rax
	mov rax, 0
	mov rsi, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_printBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdi, rax
	jmp .L135
.L136:
	# Stack pointer unchanged, no stack allocated variables
	# 2 element array
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	mov edi, 12
	call _malloc
	mov r11, rax
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	# array pointers are shifted forwards by 4 bytes (to account for size)
	mov r11, r11
	add r11, 4
	mov rax, 2
	mov dword ptr [r11 - 4], eax
	mov rax, 0
	mov dword ptr [r11], eax
	mov rax, 0
	mov dword ptr [r11 + 4], eax
	mov rax, r11
	mov r8, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, r14
	mov rsi, rax
	mov rax, r12
	mov rdx, rax
	mov rax, rcx
	mov rcx, rax
	mov rax, r8
	mov r8, rax
	call wacc_askForAMove
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdi, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, r14
	mov rsi, rax
	mov r10d, 0
	push r9
	mov r9, r8
	call _arrLoad4
	mov eax, r9d
	pop r9
	mov rax, rax
	mov rdx, rax
	mov r10d, 1
	push r9
	mov r9, r8
	call _arrLoad4
	mov eax, r9d
	pop r9
	mov rax, rax
	mov rcx, rax
	call wacc_placeMove
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdi, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, r14
	mov rsi, rax
	mov rax, r12
	mov rdx, rax
	mov rax, rcx
	mov rcx, rax
	mov r10d, 0
	push r9
	mov r9, r8
	call _arrLoad4
	mov eax, r9d
	pop r9
	mov rax, rax
	mov r8, rax
	mov r10d, 1
	mov rax, qword ptr [r11 + 32]
	push r9
	mov r9, rax
	call _arrLoad4
	mov eax, r9d
	pop r9
	mov rax, rax
	mov r9, rax
	call wacc_notifyMove
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdi, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_printBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdi, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, r14
	mov rsi, rax
	call wacc_hasWon
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r9, rax
	cmp r9, 1
	je .L137
	jmp .L138
.L137:
	mov rax, r14
	mov rsi, rax
.L138:
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_oppositeSymbol
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r14, rax
	mov eax, edx
	add eax, 1
	jo _errOverflow
	movsx rax, eax
	push rax
	pop rax
	mov rax, rax
	mov rdx, rax
	# Stack pointer unchanged, no stack allocated variables
.L135:
	cmp rsi, 0
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L139
	cmp rdx, 9
	setl al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L139:
	je .L136
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_freeBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdi, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rcx
	mov rdi, rax
	call wacc_destroyAI
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdi, rax
	cmp rsi, 0
	jne .L140
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str29]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	jmp .L141
.L140:
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rsi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str30]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
.L141:
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	# pop {rbx, r12, r13, r14, r15}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret

wacc_chooseSymbol:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str0]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str1]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str3]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str4]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str5]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str6]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str7]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str3]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str2]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	mov rax, 0
	mov r12, rax
	jmp .L0
.L1:
	# Stack pointer unchanged, no stack allocated variables
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str8]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	mov rax, 0
	mov r13, rax
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r13
	mov rdi, rax
	call _readc
	mov r11, rax
	mov rax, r11
	mov r13, rax
	cmp r13, 120
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L4
	cmp r13, 88
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L4:
	je .L2
	cmp r13, 111
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L7
	cmp r13, 79
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L7:
	je .L5
	cmp r13, 113
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L10
	cmp r13, 81
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L10:
	je .L8
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str9]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str10]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	jmp .L9
.L8:
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str11]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 0
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _exit
.L9:
	jmp .L6
.L5:
	mov rax, 111
	mov r12, rax
.L6:
	jmp .L3
.L2:
	mov rax, 120
	mov r12, rax
.L3:
	# Stack pointer unchanged, no stack allocated variables
.L0:
	cmp r12, 0
	je .L1
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str12]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	call _println
	mov rax, r12
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printBoard:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str13]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str14]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_printRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str15]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str16]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_printRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str15]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str17]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_printRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str18]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_printCell
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 124
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_printCell
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 124
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_printCell
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str18]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printCell:
	push rbp
	mov rbp, rsp
	cmp rdi, 0
	je .L11
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	pop rdi
	jmp .L12
.L11:
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 32
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	pop rdi
.L12:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_askForAMoveHuman:
	push rbp
	# push {r12, r13, r14}
	sub rsp, 24
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	mov r12, rax
	mov rax, 0
	mov r13, rax
	mov rax, 0
	mov r14, rax
	jmp .L13
.L14:
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str19]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str20]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r13
	mov rdi, rax
	call _readi
	mov r11, rax
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov r13, rax
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str21]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	# load the current value in the destination of the read so it supports defaults
	mov rax, r14
	mov rdi, rax
	call _readi
	mov r11, rax
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov r14, rax
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r13
	mov rsi, rax
	mov rax, r14
	mov rdx, rax
	call wacc_validateMove
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov r12, rax
	cmp r12, 1
	je .L15
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str22]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	jmp .L16
.L15:
	# push {rsi, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str18]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rsi, rdi}
	mov rsi, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov r10d, 0
	mov rax, r13
	mov r9, rsi
	call _arrStore4
	mov r10d, 1
	mov rax, r14
	mov r9, rsi
	call _arrStore4
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	add rsp, 24
	pop rbp
	ret
.L16:
.L13:
	cmp r12, 1
	jne .L14
	mov rax, 1
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

wacc_validateMove:
	push rbp
	push r12
	mov rbp, rsp
	mov rax, 1
	cmp rax, rsi
	setle al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L19
	cmp rsi, 3
	setle al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L20
	mov rax, 1
	cmp rax, rdx
	setle al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L21
	cmp rdx, 3
	setle al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L21:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L20:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L19:
	je .L17
	mov rax, 0
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	jmp .L18
.L17:
	# Stack pointer unchanged, no stack allocated variables
	# push {rdx, rsi, rdi}
	sub rsp, 24
	mov qword ptr [rsp], rdx
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rdx, rsi, rdi}
	mov rdx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	add rsp, 24
	mov rax, r11
	mov r12, rax
	cmp r12, 0
	sete al
	movsx rax, al
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
.L18:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_notifyMoveHuman:
	push rbp
	mov rbp, rsp
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str23]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rcx
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str24]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r8
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_initAI:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rdi
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rdi
	mov rax, rdi
	mov qword ptr [r11], rax
	mov rax, 0
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r12, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	call wacc_generateAllPossibleStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r13, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, qword ptr [r11]
	mov rax, rax
	mov rsi, rax
	mov rax, 120
	mov rdx, rax
	call wacc_setValuesForAllStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r14, rax
	push rdi
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rdi
	mov rax, r12
	mov qword ptr [r11], rax
	mov rax, r13
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r15, rax
	mov rax, r15
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_generateAllPossibleStates:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_allocateNewBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r12, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	call wacc_convertFromBoardToState
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r13, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, 120
	mov rsi, rax
	call wacc_generateNextStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r13, rax
	mov rax, r13
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_convertFromBoardToState:
	push rbp
	# push {r12, r13, r14}
	sub rsp, 24
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_generateEmptyPointerBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r12, rax
	push rdi
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rdi
	mov rax, rdi
	mov qword ptr [r11], rax
	mov rax, r12
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r13, rax
	push rdi
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rdi
	mov rax, r13
	mov qword ptr [r11], rax
	mov rax, 0
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r14, rax
	mov rax, r14
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

wacc_generateEmptyPointerBoard:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rcx
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_generateEmptyPointerRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rcx
	mov rax, r11
	mov r12, rax
	push rcx
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_generateEmptyPointerRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rcx
	mov rax, r11
	mov r13, rax
	push rcx
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_generateEmptyPointerRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rcx
	mov rax, r11
	mov r14, rax
	push rcx
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rcx
	mov rax, r12
	mov qword ptr [r11], rax
	mov rax, r13
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r15, rax
	push rcx
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rcx
	mov rax, r15
	mov qword ptr [r11], rax
	mov rax, r14
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov rcx, rax
	mov rax, rcx
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_generateEmptyPointerRow:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov edi, 16
	call _malloc
	mov r11, rax
	mov rax, 0
	mov qword ptr [r11], rax
	mov rax, 0
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r12, rax
	mov edi, 16
	call _malloc
	mov r11, rax
	mov rax, r12
	mov qword ptr [r11], rax
	mov rax, 0
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r13, rax
	mov rax, r13
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_generateNextStates:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rsi
	mov rdi, rax
	call wacc_oppositeSymbol
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov r15, rax
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, r15
	mov rsi, rax
	call wacc_hasWon
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	cmp rcx, 1
	je .L22
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, r14
	mov rsi, rax
	mov rax, qword ptr [r11 + 16]
	mov rax, rax
	mov rdx, rax
	call wacc_generateNextStatesBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rdx, rax
	mov rax, rdi
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	jmp .L23
.L22:
	mov rax, rdi
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
.L23:
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_generateNextStatesBoard:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	sub rsp, 9
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	cmp rsi, 0
	je _errNull
	mov rax, qword ptr [rsi]
	mov rax, rax
	mov rcx, rax
	cmp rcx, 0
	je _errNull
	mov rax, qword ptr [rcx]
	mov rax, rax
	mov r8, rax
	cmp rcx, 0
	je _errNull
	mov rax, qword ptr [rcx + 8]
	mov rax, rax
	mov r9, rax
	cmp rsi, 0
	je _errNull
	mov rax, qword ptr [rsi + 8]
	mov rax, rax
	mov qword ptr [rbp - 9], rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r13
	mov rsi, rax
	mov rax, r8
	mov rdx, rax
	mov rax, qword ptr [r11 + 8]
	mov rax, rax
	mov rcx, rax
	mov rax, 1
	mov r8, rax
	call wacc_generateNextStatesRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r14
	mov rsi, rax
	mov rax, r9
	mov rdx, rax
	mov rax, qword ptr [r11 + 8]
	mov rax, rax
	mov rcx, rax
	mov rax, 2
	mov r8, rax
	call wacc_generateNextStatesRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r15
	mov rsi, rax
	mov rax, qword ptr [rbp - 9]
	mov rax, rax
	mov rdx, rax
	mov rax, qword ptr [r11 + 8]
	mov rax, rax
	mov rcx, rax
	mov rax, 3
	mov r8, rax
	call wacc_generateNextStatesRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	add rsp, 9
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_generateNextStatesRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rsi, 0
	je _errNull
	mov rax, qword ptr [rsi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rsi, 0
	je _errNull
	mov rax, qword ptr [rsi + 8]
	mov rax, rax
	mov r15, rax
	cmp rdx, 0
	je _errNull
	mov rax, qword ptr [rdx]
	mov rax, rax
	mov r9, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r13
	mov rsi, rax
	mov rax, rcx
	mov rdx, rax
	mov rax, r8
	mov rcx, rax
	mov rax, 1
	mov r8, rax
	call wacc_generateNextStatesCell
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	cmp r9, 0
	je _errNull
	mov rax, r11
	mov qword ptr [r9], rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r14
	mov rsi, rax
	mov rax, rcx
	mov rdx, rax
	mov rax, r8
	mov rcx, rax
	mov rax, 2
	mov r8, rax
	call wacc_generateNextStatesCell
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	cmp r9, 0
	je _errNull
	mov rax, r11
	mov qword ptr [r9 + 8], rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r15
	mov rsi, rax
	mov rax, rcx
	mov rdx, rax
	mov rax, r8
	mov rcx, rax
	mov rax, 3
	mov r8, rax
	call wacc_generateNextStatesCell
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	cmp rdx, 0
	je _errNull
	mov rax, r11
	mov qword ptr [rdx + 8], rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_generateNextStatesCell:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	cmp rsi, 0
	je .L24
	mov rax, 0
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	jmp .L25
.L24:
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	call wacc_cloneBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r12, rax
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	mov rax, rdx
	mov rsi, rax
	mov rax, rcx
	mov rdx, rax
	mov rax, r8
	mov rcx, rax
	call wacc_placeMove
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r13, rax
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	call wacc_convertFromBoardToState
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r14, rax
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdx
	mov rdi, rax
	call wacc_oppositeSymbol
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r15, rax
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, r15
	mov rsi, rax
	call wacc_generateNextStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r14, rax
	mov rax, r14
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
.L25:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_cloneBoard:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_allocateNewBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r12, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r12
	mov rsi, rax
	call wacc_copyBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r13, rax
	mov rax, r12
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_copyBoard:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	sub rsp, 1
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	cmp rsi, 0
	je _errNull
	mov rax, qword ptr [rsi]
	mov rax, rax
	mov rcx, rax
	cmp rcx, 0
	je _errNull
	mov rax, qword ptr [rcx]
	mov rax, rax
	mov rdx, rax
	cmp rcx, 0
	je _errNull
	mov rax, qword ptr [rcx + 8]
	mov rax, rax
	mov r8, rax
	cmp rsi, 0
	je _errNull
	mov rax, qword ptr [rsi + 8]
	mov rax, rax
	mov r9, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, rdx
	mov rsi, rax
	call wacc_copyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, r8
	mov rsi, rax
	call wacc_copyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, r9
	mov rsi, rax
	call wacc_copyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	add rsp, 1
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_copyRow:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp rsi, 0
	je _errNull
	mov rax, qword ptr [rsi]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	push rax
	cmp r13, 0
	je _errNull
	pop rax
	mov rax, rax
	mov qword ptr [r13], rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	push rax
	cmp r13, 0
	je _errNull
	pop rax
	mov rax, rax
	mov qword ptr [r13 + 8], rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	push rax
	cmp rsi, 0
	je _errNull
	pop rax
	mov rax, rax
	mov qword ptr [rsi + 8], rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_setValuesForAllStates:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	mov r12, rax
	cmp rdi, 0
	je .L26
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r13, rax
	cmp r13, 0
	je _errNull
	mov rax, qword ptr [r13]
	mov rax, rax
	mov r14, rax
	cmp r13, 0
	je _errNull
	mov rax, qword ptr [r13 + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdx
	mov rdi, rax
	call wacc_oppositeSymbol
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, rcx
	mov rsi, rax
	call wacc_hasWon
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r8, rax
	cmp r8, 1
	je .L28
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_containEmptyCell
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r9, rax
	cmp r9, 1
	je .L30
	mov rax, 0
	mov r12, rax
	jmp .L31
.L30:
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rcx
	mov rdx, rax
	call wacc_calculateValuesFromNextStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r12, rax
	cmp r12, 100
	je .L32
	jmp .L33
.L32:
	mov rax, 90
	mov r12, rax
.L33:
.L31:
	# Stack pointer unchanged, no stack allocated variables
	jmp .L29
.L28:
	cmp rcx, rsi
	je .L34
	mov rax, -100
	mov r12, rax
	jmp .L35
.L34:
	mov rax, 100
	mov r12, rax
.L35:
.L29:
	cmp rdi, 0
	je _errNull
	mov rax, r12
	mov qword ptr [rdi + 8], rax
	# Stack pointer unchanged, no stack allocated variables
	jmp .L27
.L26:
	cmp rdx, rsi
	je .L36
	mov rax, -101
	mov r12, rax
	jmp .L37
.L36:
	mov rax, 101
	mov r12, rax
.L37:
.L27:
	mov rax, r12
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_calculateValuesFromNextStates:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	sub rsp, 4
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_calculateValuesFromNextStatesRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_calculateValuesFromNextStatesRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r8, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_calculateValuesFromNextStatesRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r9, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rsi
	mov rdi, rax
	mov rax, rdx
	mov rsi, rax
	mov rax, rcx
	mov rdx, rax
	mov rax, r8
	mov rcx, rax
	mov rax, r9
	mov r8, rax
	call wacc_combineValue
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov dword ptr [rbp - 4], eax
	movsx rax, dword ptr [rbp - 4]
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	add rsp, 4
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_calculateValuesFromNextStatesRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	sub rsp, 4
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_setValuesForAllStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_setValuesForAllStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r8, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_setValuesForAllStates
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r9, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rsi
	mov rdi, rax
	mov rax, rdx
	mov rsi, rax
	mov rax, rcx
	mov rdx, rax
	mov rax, r8
	mov rcx, rax
	mov rax, r9
	mov r8, rax
	call wacc_combineValue
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov dword ptr [rbp - 4], eax
	movsx rax, dword ptr [rbp - 4]
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	add rsp, 4
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_combineValue:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	mov r12, rax
	cmp rdi, rsi
	je .L38
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdx
	mov rdi, rax
	mov rax, rcx
	mov rsi, rax
	mov rax, r8
	mov rdx, rax
	call wacc_max3
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r12, rax
	jmp .L39
.L38:
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdx
	mov rdi, rax
	mov rax, rcx
	mov rsi, rax
	mov rax, r8
	mov rdx, rax
	call wacc_min3
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r12, rax
.L39:
	mov rax, r12
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_min3:
	push rbp
	mov rbp, rsp
	cmp rdi, rsi
	jl .L40
	cmp rsi, rdx
	jl .L42
	mov rax, rdx
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	jmp .L43
.L42:
	mov rax, rsi
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
.L43:
	jmp .L41
.L40:
	cmp rdi, rdx
	jl .L44
	mov rax, rdx
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	jmp .L45
.L44:
	mov rax, rdi
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
.L45:
.L41:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_max3:
	push rbp
	mov rbp, rsp
	cmp rdi, rsi
	jg .L46
	cmp rsi, rdx
	jg .L48
	mov rax, rdx
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	jmp .L49
.L48:
	mov rax, rsi
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
.L49:
	jmp .L47
.L46:
	cmp rdi, rdx
	jg .L50
	mov rax, rdx
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
	jmp .L51
.L50:
	mov rax, rdi
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
.L51:
.L47:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_destroyAI:
	push rbp
	# push {r12, r13, r14}
	sub rsp, 24
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r13, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_deleteStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r14, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	mov rax, 1
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

wacc_askForAMoveAI:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	sub rsp, 1
	cmp rcx, 0
	je _errNull
	mov rax, qword ptr [rcx]
	mov rax, rax
	mov r12, rax
	cmp rcx, 0
	je _errNull
	mov rax, qword ptr [rcx + 8]
	mov rax, rax
	mov r13, rax
	cmp r13, 0
	je _errNull
	mov rax, qword ptr [r13]
	mov rax, rax
	mov r14, rax
	cmp r14, 0
	je _errNull
	mov rax, qword ptr [r14 + 8]
	mov rax, rax
	mov r15, rax
	cmp r13, 0
	je _errNull
	mov rax, qword ptr [r13 + 8]
	mov rax, rax
	mov r9, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, r9
	mov rsi, rax
	mov rax, r8
	mov rdx, rax
	call wacc_findTheBestMove
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str25]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov r10d, 0
	push r9
	mov r9, r8
	call _arrLoad4
	mov eax, r9d
	pop r9
	mov rax, rax
	mov rsi, rax
	mov r10d, 1
	push r9
	mov r9, r8
	call _arrLoad4
	mov eax, r9d
	pop r9
	mov rax, rax
	mov rdx, rax
	call wacc_deleteAllOtherChildren
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	cmp rcx, 0
	je _errNull
	mov rax, r11
	mov qword ptr [rcx + 8], rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_deleteThisStateOnly
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	add rsp, 1
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_findTheBestMove:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rsi, 90
	je .L52
	jmp .L53
.L52:
	# Stack pointer unchanged, no stack allocated variables
	# push {rdx, rsi, rdi}
	sub rsp, 24
	mov qword ptr [rsp], rdx
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 100
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_findMoveWithGivenValue
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rdx, rsi, rdi}
	mov rdx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	add rsp, 24
	mov rax, r11
	mov r13, rax
	cmp r13, 1
	je .L54
	jmp .L55
.L54:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
.L55:
	# Stack pointer unchanged, no stack allocated variables
.L53:
	# push {rdx, rsi, rdi}
	sub rsp, 24
	mov qword ptr [rsp], rdx
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_findMoveWithGivenValue
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rdx, rsi, rdi}
	mov rdx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	add rsp, 24
	mov rax, r11
	mov r12, rax
	cmp r12, 1
	je .L56
	# push {rdx, rsi, rdi}
	sub rsp, 24
	mov qword ptr [rsp], rdx
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str26]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rdx, rsi, rdi}
	mov rdx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	add rsp, 24
	# push {rdx, rsi, rdi}
	sub rsp, 24
	mov qword ptr [rsp], rdx
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, -1
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _exit
	# pop {rdx, rsi, rdi}
	mov rdx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp + 16]
	add rsp, 24
	jmp .L57
.L56:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
.L57:
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_findMoveWithGivenValue:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_findMoveWithGivenValueRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	cmp rcx, 1
	je .L58
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_findMoveWithGivenValueRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	cmp rcx, 1
	je .L60
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	call wacc_findMoveWithGivenValueRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	cmp rcx, 1
	je .L62
	mov rax, 0
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	jmp .L63
.L62:
	mov r10d, 0
	mov rax, 3
	mov r9, rdx
	call _arrStore4
.L63:
	jmp .L61
.L60:
	mov r10d, 0
	mov rax, 2
	mov r9, rdx
	call _arrStore4
.L61:
	jmp .L59
.L58:
	mov r10d, 0
	mov rax, 1
	mov r9, rdx
	call _arrStore4
.L59:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_findMoveWithGivenValueRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	call wacc_hasGivenStateValue
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	cmp rcx, 1
	je .L64
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	call wacc_hasGivenStateValue
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	cmp rcx, 1
	je .L66
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	call wacc_hasGivenStateValue
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	cmp rcx, 1
	je .L68
	mov rax, 0
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	jmp .L69
.L68:
	mov r10d, 1
	mov rax, 3
	mov r9, rdx
	call _arrStore4
.L69:
	jmp .L67
.L66:
	mov r10d, 1
	mov rax, 2
	mov r9, rdx
	call _arrStore4
.L67:
	jmp .L65
.L64:
	mov r10d, 1
	mov rax, 1
	mov r9, rdx
	call _arrStore4
.L65:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_hasGivenStateValue:
	push rbp
	push r12
	mov rbp, rsp
	cmp rdi, 0
	je .L70
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r12, rax
	cmp r12, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	jmp .L71
.L70:
	mov rax, 0
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
.L71:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_notifyMoveAI:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rcx, 0
	je _errNull
	mov rax, qword ptr [rcx + 8]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r13, 0
	je _errNull
	mov rax, qword ptr [r13 + 8]
	mov rax, rax
	mov r14, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str25]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	mov rax, r8
	mov rsi, rax
	mov rax, r9
	mov rdx, rax
	call wacc_deleteAllOtherChildren
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	cmp rcx, 0
	je _errNull
	mov rax, r11
	mov qword ptr [rcx + 8], rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	call wacc_deleteThisStateOnly
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r15, rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_deleteAllOtherChildren:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	sub rsp, 9
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	mov rax, 0
	mov rcx, rax
	mov rax, 0
	mov r8, rax
	mov rax, 0
	mov r9, rax
	cmp rsi, 1
	je .L72
	mov rax, r13
	mov r8, rax
	cmp rsi, 2
	je .L74
	mov rax, r15
	mov rcx, rax
	mov rax, r14
	mov r9, rax
	jmp .L75
.L74:
	mov rax, r14
	mov rcx, rax
	mov rax, r15
	mov r9, rax
.L75:
	jmp .L73
.L72:
	mov rax, r13
	mov rcx, rax
	mov rax, r14
	mov r8, rax
	mov rax, r15
	mov r9, rax
.L73:
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rcx
	mov rdi, rax
	mov rax, rdx
	mov rsi, rax
	call wacc_deleteAllOtherChildrenRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov qword ptr [rbp - 9], rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r8
	mov rdi, rax
	call wacc_deleteChildrenStateRecursivelyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r9
	mov rdi, rax
	call wacc_deleteChildrenStateRecursivelyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	mov rax, qword ptr [rbp - 9]
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	add rsp, 9
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_deleteAllOtherChildrenRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	mov rax, 0
	mov rcx, rax
	mov rax, 0
	mov rdx, rax
	mov rax, 0
	mov r8, rax
	cmp rsi, 1
	je .L76
	mov rax, r13
	mov rdx, rax
	cmp rsi, 2
	je .L78
	mov rax, r15
	mov rcx, rax
	mov rax, r14
	mov r8, rax
	jmp .L79
.L78:
	mov rax, r14
	mov rcx, rax
	mov rax, r15
	mov r8, rax
.L79:
	jmp .L77
.L76:
	mov rax, r13
	mov rcx, rax
	mov rax, r14
	mov rdx, rax
	mov rax, r15
	mov r8, rax
.L77:
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdx
	mov rdi, rax
	call wacc_deleteStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r9, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r8
	mov rdi, rax
	call wacc_deleteStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r9, rax
	mov rax, rcx
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_deleteStateTreeRecursively:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	cmp rdi, 0
	je .L80
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_deleteChildrenStateRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r15, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	call wacc_deleteThisStateOnly
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r15, rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	jmp .L81
.L80:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
.L81:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_deleteThisStateOnly:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_freeBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r15, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_freePointers
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r15, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_freePointers:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_freePointersRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_freePointersRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_freePointersRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_freePointersRow:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_deleteChildrenStateRecursively:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_deleteChildrenStateRecursivelyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_deleteChildrenStateRecursivelyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_deleteChildrenStateRecursivelyRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_deleteChildrenStateRecursivelyRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_deleteStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_deleteStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_deleteStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_askForAMove:
	push rbp
	push r12
	mov rbp, rsp
	cmp rsi, rdx
	je .L82
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	mov rax, rcx
	mov rcx, rax
	mov rax, r8
	mov r8, rax
	call wacc_askForAMoveAI
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated variables
	jmp .L83
.L82:
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi, r8}
	sub rsp, 40
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, r8
	mov rsi, rax
	call wacc_askForAMoveHuman
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	add rsp, 40
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated variables
.L83:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_placeMove:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	mov r12, rax
	cmp rdx, 2
	jle .L84
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	jmp .L85
.L84:
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r13, rax
	cmp rdx, 1
	je .L86
	cmp r13, 0
	je _errNull
	mov rax, qword ptr [r13 + 8]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	jmp .L87
.L86:
	cmp r13, 0
	je _errNull
	mov rax, qword ptr [r13]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
.L87:
	# Stack pointer unchanged, no stack allocated variables
.L85:
	cmp rcx, 2
	jle .L88
	cmp r12, 0
	je _errNull
	mov rax, rsi
	mov qword ptr [r12 + 8], rax
	jmp .L89
.L88:
	# Stack pointer unchanged, no stack allocated variables
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp rcx, 1
	je .L90
	cmp r13, 0
	je _errNull
	mov rax, rsi
	mov qword ptr [r13 + 8], rax
	jmp .L91
.L90:
	cmp r13, 0
	je _errNull
	mov rax, rsi
	mov qword ptr [r13], rax
.L91:
	# Stack pointer unchanged, no stack allocated variables
.L89:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_notifyMove:
	push rbp
	push r12
	mov rbp, rsp
	cmp rsi, rdx
	je .L92
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	mov rax, r8
	mov rcx, rax
	mov rax, r9
	mov r8, rax
	call wacc_notifyMoveHuman
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated variables
	jmp .L93
.L92:
	# Stack pointer unchanged, no stack allocated variables
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, rsi
	mov rsi, rax
	mov rax, rdx
	mov rdx, rax
	mov rax, rcx
	mov rcx, rax
	mov rax, r8
	mov r8, rax
	mov rax, r9
	mov r9, rax
	call wacc_notifyMoveAI
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r12, rax
	# Stack pointer unchanged, no stack allocated variables
.L93:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_oppositeSymbol:
	push rbp
	mov rbp, rsp
	cmp rdi, 120
	je .L94
	cmp rdi, 111
	je .L96
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	lea rax, [rip + .L.str27]
	push rax
	pop rax
	mov rax, rax
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _prints
	call _println
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, -1
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _exit
	pop rdi
	jmp .L97
.L96:
	mov rax, 120
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
.L97:
	jmp .L95
.L94:
	mov rax, 111
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop rbp
	ret
.L95:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_symbolAt:
	push rbp
	# push {r12, r13, r14}
	sub rsp, 24
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov rax, 0
	mov r12, rax
	cmp rsi, 2
	jle .L98
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	jmp .L99
.L98:
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r14, rax
	cmp rsi, 1
	je .L100
	cmp r14, 0
	je _errNull
	mov rax, qword ptr [r14 + 8]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
	jmp .L101
.L100:
	cmp r14, 0
	je _errNull
	mov rax, qword ptr [r14]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r12, rax
.L101:
	# Stack pointer unchanged, no stack allocated variables
.L99:
	mov rax, 0
	mov r13, rax
	cmp rdx, 2
	jle .L102
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
	jmp .L103
.L102:
	# Stack pointer unchanged, no stack allocated variables
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r14, rax
	cmp rdx, 1
	je .L104
	cmp r14, 0
	je _errNull
	mov rax, qword ptr [r14 + 8]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
	jmp .L105
.L104:
	cmp r14, 0
	je _errNull
	mov rax, qword ptr [r14]
	mov rax, rax
	push rax
	pop rax
	mov rax, rax
	mov r13, rax
.L105:
	# Stack pointer unchanged, no stack allocated variables
.L103:
	mov rax, r13
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

wacc_containEmptyCell:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_containEmptyCellRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_containEmptyCellRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rdx, rax
	# push {rcx, rdx, rsi, rdi}
	sub rsp, 32
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_containEmptyCellRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	add rsp, 32
	mov rax, r11
	mov rsi, rax
	cmp rcx, 1
	je .L106
	cmp rdx, 1
	je .L107
	cmp rsi, 1
.L107:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L106:
	sete al
	movsx rax, al
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_containEmptyCellRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	cmp r13, 0
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L108
	cmp r14, 0
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L109
	cmp r15, 0
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L109:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L108:
	sete al
	movsx rax, al
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_hasWon:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	sub rsp, 1
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 1
	mov rsi, rax
	mov rax, 1
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r12, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 1
	mov rsi, rax
	mov rax, 2
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r13, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 1
	mov rsi, rax
	mov rax, 3
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r14, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 2
	mov rsi, rax
	mov rax, 1
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r15, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 2
	mov rsi, rax
	mov rax, 2
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 2
	mov rsi, rax
	mov rax, 3
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov rdx, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 3
	mov rsi, rax
	mov rax, 1
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r8, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 3
	mov rsi, rax
	mov rax, 2
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov r9, rax
	# push {rcx, rdx, rsi, rdi, r8, r9}
	sub rsp, 48
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdx
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 40], r9
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	mov rax, 3
	mov rsi, rax
	mov rax, 3
	mov rdx, rax
	call wacc_symbolAt
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdx, rsi, rdi, r8, r9}
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	mov rdi, qword ptr [rsp + 24]
	mov r8, qword ptr [rsp + 32]
	mov r9, qword ptr [rsp + 40]
	add rsp, 48
	mov rax, r11
	mov byte ptr [rbp - 1], al
	cmp r12, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L110
	cmp r13, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L111
	cmp r14, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L111:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L110:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L112
	cmp r15, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L113
	cmp rcx, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L114
	cmp rdx, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L114:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L113:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L115
	cmp r8, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L116
	cmp r9, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L117
	movsx rax, byte ptr [rbp - 1]
	cmp rax, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L117:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L116:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L118
	cmp r12, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L119
	cmp r15, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L120
	cmp r8, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L120:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L119:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L121
	cmp r13, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L122
	cmp rcx, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L123
	cmp r9, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L123:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L122:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L124
	cmp r14, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L125
	cmp rdx, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L126
	movsx rax, byte ptr [rbp - 1]
	cmp rax, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L126:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L125:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L127
	cmp r12, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L128
	cmp rcx, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L129
	movsx rax, byte ptr [rbp - 1]
	cmp rax, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L129:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L128:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	je .L130
	cmp r14, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L131
	cmp rcx, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
	jne .L132
	cmp r8, rsi
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L132:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L131:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L130:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L127:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L124:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L121:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L118:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L115:
	sete al
	movsx rax, al
	push rax
	pop rax
	cmp rax, 1
.L112:
	sete al
	movsx rax, al
	push rax
	pop rax
	mov rax, rax
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	add rsp, 1
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_allocateNewBoard:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	push rcx
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_allocateNewRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rcx
	mov rax, r11
	mov r12, rax
	push rcx
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_allocateNewRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rcx
	mov rax, r11
	mov r13, rax
	push rcx
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	call wacc_allocateNewRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rcx
	mov rax, r11
	mov r14, rax
	push rcx
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rcx
	mov rax, r12
	mov qword ptr [r11], rax
	mov rax, r13
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r15, rax
	push rcx
	mov edi, 16
	call _malloc
	mov r11, rax
	pop rcx
	mov rax, r15
	mov qword ptr [r11], rax
	mov rax, r14
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov rcx, rax
	mov rax, rcx
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_allocateNewRow:
	push rbp
	# push {r12, r13}
	sub rsp, 16
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	mov edi, 16
	call _malloc
	mov r11, rax
	mov rax, 0
	mov qword ptr [r11], rax
	mov rax, 0
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r12, rax
	mov edi, 16
	call _malloc
	mov r11, rax
	mov rax, r12
	mov qword ptr [r11], rax
	mov rax, 0
	mov qword ptr [r11 + 8], rax
	mov rax, r11
	mov r13, rax
	mov rax, r13
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	add rsp, 16
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_freeBoard:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_freeRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_freeRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_freeRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_freeRow:
	push rbp
	push r12
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r12
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, rdi
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _freepair
	pop rdi
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	pop r12
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printAiData:
	push rbp
	# push {r12, r13, r14}
	sub rsp, 24
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r13, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_printStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	pop rdi
	mov rax, r11
	mov r14, rax
	push rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 0
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _exit
	pop rdi
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printStateTreeRecursively:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	cmp rdi, 0
	je .L133
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 118
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 61
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printi
	call _println
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_printBoard
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_printChildrenStateTree
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, 112
	mov rdi, rax
	# statement primitives do not return results (but will clobber r0/rax)
	call _printc
	call _println
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	jmp .L134
.L133:
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
.L134:
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printChildrenStateTree:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_printChildrenStateTreeRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_printChildrenStateTreeRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_printChildrenStateTreeRow
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

wacc_printChildrenStateTreeRow:
	push rbp
	# push {r12, r13, r14, r15}
	sub rsp, 32
	mov qword ptr [rsp], r12
	mov qword ptr [rsp + 8], r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r15
	mov rbp, rsp
	# Stack pointer unchanged, no stack allocated variables
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi]
	mov rax, rax
	mov r12, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12]
	mov rax, rax
	mov r13, rax
	cmp r12, 0
	je _errNull
	mov rax, qword ptr [r12 + 8]
	mov rax, rax
	mov r14, rax
	cmp rdi, 0
	je _errNull
	mov rax, qword ptr [rdi + 8]
	mov rax, rax
	mov r15, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r13
	mov rdi, rax
	call wacc_printStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r14
	mov rdi, rax
	call wacc_printStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	# push {rcx, rdi}
	sub rsp, 16
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 8], rdi
	# Set up R11 as a temporary second base pointer for the caller saved things
	mov r11, rsp
	# Stack pointer unchanged, no stack allocated arguments
	mov rax, r15
	mov rdi, rax
	call wacc_printStateTreeRecursively
	mov r11, rax
	# Stack pointer unchanged, no stack allocated arguments
	# pop {rcx, rdi}
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rsp + 8]
	add rsp, 16
	mov rax, r11
	mov rcx, rax
	mov rax, 1
	# reset the stack pointer, undoing any pushes: this is often unnecessary, but is cheap
	mov rsp, rbp
	# pop {r12, r13, r14, r15}
	mov r12, qword ptr [rsp]
	mov r13, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 16]
	mov r15, qword ptr [rsp + 24]
	add rsp, 32
	pop rbp
	ret
	# Stack pointer unchanged, no stack allocated variables
	# 'ere be dragons: this is 100% dead code, functions always end in returns!

_freepair:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	cmp rdi, 0
	je _errNull
	call free@plt
	mov rsp, rbp
	pop rbp
	ret

.section .rodata
# length of .L._readc_str0
	.int 3
.L._readc_str0:
	.asciz " %c"
.text
_readc:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	# RDI contains the "original" value of the destination of the read
	# allocate space on the stack to store the read: preserve alignment!
	# the passed default argument should be stored in case of EOF
	sub rsp, 16
	mov byte ptr [rsp], dil
	lea rsi, qword ptr [rsp]
	lea rdi, [rip + .L._readc_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call scanf@plt
	movsx rax, byte ptr [rsp]
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

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
# length of .L._readi_str0
	.int 2
.L._readi_str0:
	.asciz "%d"
.text
_readi:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	# RDI contains the "original" value of the destination of the read
	# allocate space on the stack to store the read: preserve alignment!
	# the passed default argument should be stored in case of EOF
	sub rsp, 16
	mov dword ptr [rsp], edi
	lea rsi, qword ptr [rsp]
	lea rdi, [rip + .L._readi_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call scanf@plt
	movsx rax, dword ptr [rsp]
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

_malloc:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	call malloc@plt
	cmp rax, 0
	je _errOutOfMemory
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
# length of .L._printc_str0
	.int 2
.L._printc_str0:
	.asciz "%c"
.text
_printc:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	mov sil, dil
	lea rdi, [rip + .L._printc_str0]
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

_exit:
	push rbp
	mov rbp, rsp
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	call exit@plt
	mov rsp, rbp
	pop rbp
	ret

_arrStore4:
	# Special calling convention: array ptr passed in R9, index in R10, value to store in RAX
	push rbx
	cmp r10d, 0
	cmovl rsi, r10
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rsi, r10
	jge _errOutOfBounds
	mov dword ptr [r9 + 4*r10], eax
	pop rbx
	ret

_arrLoad4:
	# Special calling convention: array ptr passed in R9, index in R10, and return into R9
	push rbx
	cmp r10d, 0
	cmovl rsi, r10
	jl _errOutOfBounds
	mov ebx, dword ptr [r9 - 4]
	cmp r10d, ebx
	cmovge rsi, r10
	jge _errOutOfBounds
	movsx r9, dword ptr [r9 + 4*r10]
	pop rbx
	ret

.section .rodata
# length of .L._errOutOfMemory_str0
	.int 27
.L._errOutOfMemory_str0:
	.asciz "fatal error: out of memory\n"
.text
_errOutOfMemory:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errOutOfMemory_str0]
	call _prints
	mov dil, -1
	call exit@plt

.section .rodata
# length of .L._errNull_str0
	.int 45
.L._errNull_str0:
	.asciz "fatal error: null pair dereferenced or freed\n"
.text
_errNull:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errNull_str0]
	call _prints
	mov dil, -1
	call exit@plt

.section .rodata
# length of .L._errOutOfBounds_str0
	.int 42
.L._errOutOfBounds_str0:
	.asciz "fatal error: array index %d out of bounds\n"
.text
_errOutOfBounds:
	# external calls must be stack-aligned to 16 bytes, accomplished by masking with fffffffffffffff0
	and rsp, -16
	lea rdi, [rip + .L._errOutOfBounds_str0]
	# on x86, al represents the number of SIMD registers used as variadic arguments
	mov al, 0
	call printf@plt
	mov rdi, 0
	call fflush@plt
	mov dil, -1
	call exit@plt

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
