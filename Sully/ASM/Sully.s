global main
extern fprintf, fopen, exit, system, malloc, sprintf

section .text

main:
	push rbp
	mov rbp, rsp
	mov rdi, 5
	dec rdi
	cmp rdi, 0
	je byebye

	mov [rel file_nb], rdi

	xor rax, rax

creation:
	; build string Sully_x.s
	lea rdi, [rel filename]
	lea rsi, [rel filename_fmt]
	mov rdx, [rel file_nb]
	mov rcx, 's'
	call sprintf

	; build string Sully_x.o
	lea rdi, [rel object]
	lea rsi, [rel filename_fmt]
	mov rdx, [rel file_nb]
	mov rcx, 'o'
	call sprintf

	lea rdi, [rel filename]
	lea rsi, [rel open_mode]
	call fopen


byebye:
	leave
	xor rdi, rdi
	call exit

fmt: db "%p", 0
filename_fmt: db "Sully_%d.%c", 0
open_mode: db "w", 0
compile_fmt: db "nasm -f elf64 %s && cc %s -o %s", 0
execute_fmt: db "./%s", 0

section .bss
file_nb: resb 4
filename: resb 10
object: resb 10
execute: resb 255
compile: resb 255
