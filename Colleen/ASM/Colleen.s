; Comment outside function
global main
extern printf

section .text

main:
	; Comment inside function
	push rbp
	mov rbp, rsp
	mov rdi, fmt
	mov rsi, 9
	mov rdx, 10
	mov rcx, 34
	mov r8, fmt
	xor rax, rax

peer:
	call printf
	leave
	xor rax, rax
	ret

fmt: db "; Comment outside function%2$cglobal main%2$cextern printf%2$c%2$csection .text%2$c%2$cmain:%2$c%1$c; Comment inside function%2$c%1$cpush rbp%2$c%1$cmov rbp, rsp%2$c%1$cmov rdi, fmt%2$c%1$cmov rsi, 9%2$c%1$cmov rdx, 10%2$c%1$cmov rcx, 34%2$c%1$cmov r8, fmt%2$c%1$cxor rax, rax%2$c%2$cpeer:%2$c%1$ccall printf%2$c%1$cleave%2$c%1$cxor rax, rax%2$c%1$cret%2$c%2$cfmt: db %3$c%4$s%3$c, 0%2$c", 0
