; Comment
global main
extern fprintf, fopen, exit
%define STRING "; Comment%2$cglobal main%2$cextern fprintf, fopen, exit%2$c%%define STRING %3$c%4$s%3$c%2$c%%define FILENAME %3$cGrace_kid.s%3$c%2$c%2$csection .text%2$c%2$c%%macro grace 0%2$cmain:%2$c%1$cpush rbp%2$c%1$cmov rbp, rsp%2$c%1$cmov rdi, filename%2$c%1$cmov rsi, open_mode%2$c%1$ccall fopen%2$c%1$cmov rdi, rax%2$c%1$cmov rsi, fmt%2$c%1$cmov rdx, 9%2$c%1$cmov rcx, 10%2$c%1$cmov r8, 34%2$c%1$cmov r9, fmt%2$c%1$cxor rax, rax%2$c%1$ccall fprintf%2$c%1$cleave%2$c%1$cxor rdi, rdi%2$c%1$ccall exit%2$c%%endmacro%2$c%2$cgrace%2$c%2$cfmt: db STRING, 0%2$cfilename: db FILENAME, 0%2$copen_mode: db %3$cw%3$c, 0%2$c"
%define FILENAME "Grace_kid.s"

section .text

%macro grace 0
main:
	push rbp
	mov rbp, rsp
	mov rdi, filename
	mov rsi, open_mode
	call fopen
	mov rdi, rax
	mov rsi, fmt
	mov rdx, 9
	mov rcx, 10
	mov r8, 34
	mov r9, fmt
	xor rax, rax
	call fprintf
	leave
	xor rdi, rdi
	call exit
%endmacro

grace

fmt: db STRING, 0
filename: db FILENAME, 0
open_mode: db "w", 0
