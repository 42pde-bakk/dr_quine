; Comment outside function
global main
global start
extern printf

section .text

start:
	; Comment inside function
	call main
	ret

main:
	push rbp
	mov rbp, rsp
	lea rdi, [rel fmt]
	mov rsi, 9
	mov rdx, 10
	mov rcx, 34
	mov r8, fmt
	xor rax, rax
	call printf WRT ..plt
	leave
	ret

section .data
fmt: db "; Comment outside function%2$cglobal main%2$cglobal start%2$cextern printf%2$c%2$csection .text%2$c%2$cstart:%2$c%1$c; Comment inside function%2$c%1$ccall main%2$c%1$cret%2$c%2$cmain:%2$c%1$cpush rbp%2$c%1$cmov rbp, rsp%2$c%1$clea rdi, [rel fmt]%2$c%1$cmov rsi, 9%2$c%1$cmov rdx, 10%2$c%1$cmov rcx, 34%2$c%1$cmov r8, fmt%2$c%1$cxor rax, rax%2$c%1$ccall printf WRT ..plt%2$c%1$cleave%2$c%1$cret%2$c%2$csection .data%2$cfmt: db %3$c%4$s%3$c%2$c"