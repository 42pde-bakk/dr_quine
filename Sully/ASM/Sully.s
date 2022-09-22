global main
extern fprintf, fopen, asprintf, exit, system, malloc, sprintf

section .text

main:
	push rbp
	mov rbp, rsp

	mov rdi, 12
	call malloc
	mov rdi, rax
	mov rsi, filename
	mov rdx, 5
	call sprintf

	mov rdi, filename
	mov rsi, open_mode
	call fopen

	; mov rdi, rax
	; mov rsi, fmt
	; mov rdx, 9
	; mov rcx, 10
	; mov r8, 34
	; mov r9, fmt
	mov rdi, rax
	xor rax, rax
	mov rsi, filename
	; call fprintf
	leave
	xor rdi, rdi
	call exit

fmt: db "%s", 0
filename: db "Sully_%d.s", 0
open_mode: db "w", 0
