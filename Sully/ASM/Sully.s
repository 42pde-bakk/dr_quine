global main
extern fprintf, sprintf
extern fopen, fclose
extern exit, system

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

	; build string to execute
	lea rdi, [rel execute_str]
	lea rsi, [rel execute_fmt]
	mov rdx, [rel file_nb]
	call sprintf

	; build compile string
	lea rdi, [rel compile_str]
	lea rsi, [rel compile_fmt]
	lea rdx, [rel filename]
	lea rcx, [rel object]
	lea r8,  [rel object]
	mov r9,  [file_nb]
	call sprintf

	; open Sully_x.s
	lea rdi, [rel filename]
	mov rsi, open_mode
	call fopen

	; write to Sully_x.s
	mov rdi, rax ; FILE*
	mov rsi, fmt
	mov rdx, 9
	mov rcx, 10
	mov r8,  34
	mov r9,  fmt
	mov r10, [file_nb]
	push 5
	push r10
	xor rax, rax
	call fprintf ;(FILE*, fmt, 9, 10, 34, fmt, idx)

compile:
	mov rdi, compile_str
	xor rax, rax
	call system
	cmp rax, 0
	jne byebye

execute:
	mov rdi, execute_str
	xor rax, rax
	call system

byebye:
	leave
	xor rdi, rdi
	call exit

fmt: db "global main%2$cextern fprintf, sprintf%2$cextern fopen, fclose%2$cextern exit, system%2$c%2$csection .text%2$c%2$cmain:%2$c%1$cpush rbp%2$c%1$cmov rbp, rsp%2$c%1$cmov rdi, %5$d%2$c%1$cdec rdi%2$c%1$ccmp rdi, 0%2$c%1$cje byebye%2$c%1$cmov [rel file_nb], rdi%2$c%1$cxor rax, rax%2$c%2$ccreation:%2$c%1$c; build string Sully_x.s%2$c%1$clea rdi, [rel filename]%2$c%1$clea rsi, [rel filename_fmt]%2$c%1$cmov rdx, [rel file_nb]%2$c%1$cmov rcx, 's'%2$c%1$ccall sprintf%2$c%2$c%1$c; build string Sully_x.o%2$c%1$clea rdi, [rel object]%2$c%1$clea rsi, [rel filename_fmt]%2$c%1$cmov rdx, [rel file_nb]%2$c%1$cmov rcx, 'o'%2$c%1$ccall sprintf%2$c%2$c%1$c; build string to execute%2$c%1$clea rdi, [rel execute_str]%2$c%1$clea rsi, [rel execute_fmt]%2$c%1$cmov rdx, [rel file_nb]%2$c%1$ccall sprintf%2$c%2$c%1$c; build compile string%2$c%1$clea rdi, [rel compile_str]%2$c%1$clea rsi, [rel compile_fmt]%2$c%1$clea rdx, [rel filename]%2$c%1$clea rcx, [rel object]%2$c%1$clea r8,  [rel object]%2$c%1$cmov r9,  [file_nb]%2$c%1$ccall sprintf%2$c%2$c%1$c; open Sully_x.s%2$c%1$clea rdi, [rel filename]%2$c%1$cmov rsi, open_mode%2$c%1$ccall fopen%2$c%2$c%1$c; write to Sully_x.s%2$c%1$cmov rdi, rax ; FILE*%2$c%1$cmov rsi, fmt%2$c%1$cmov rdx, 9%2$c%1$cmov rcx, 10%2$c%1$cmov r8,  34%2$c%1$cmov r9,  fmt%2$c%1$cmov r10, [file_nb]%2$c%1$cpush 5%2$c%1$cpush r10%2$c%1$cxor rax, rax%2$c%1$ccall fprintf ;(FILE*, fmt, 9, 10, 34, fmt, idx)%2$c%2$ccompile:%2$c%1$cmov rdi, compile_str%2$c%1$cxor rax, rax%2$c%1$ccall system%2$c%1$ccmp rax, 0%2$c%1$cjne byebye%2$c%2$cexecute:%2$c%1$cmov rdi, execute_str%2$c%1$cxor rax, rax%2$c%1$ccall system%2$c%2$cbyebye:%2$c%1$cleave%2$c%1$cxor rdi, rdi%2$c%1$ccall exit%2$c%2$cfmt: db %3$c%4$s%3$c, 0%2$cfilename_fmt: db %3$cSully_%%d.%%c%3$c, 0%2$copen_mode: db %3$cw%3$c, 0%2$ccompile_fmt: db %3$cnasm -f elf64 %%s -o %%s && gcc -lc -m64 -no-pie %%s -o Sully_%%d%3$c, 0%2$cexecute_fmt: db %3$c./Sully_%%d%3$c, 0%2$c%2$csection .bss%2$cfile_nb: resb 4%2$cfilename: resb 10%2$cobject: resb 10%2$cexecute_str: resb 12%2$ccompile_str: resb 65%2$c", 0
filename_fmt: db "Sully_%d.%c", 0
open_mode: db "w", 0
compile_fmt: db "nasm -f elf64 %s -o %s && gcc -lc -m64 -no-pie %s -o Sully_%d", 0
execute_fmt: db "./Sully_%d", 0

section .bss
file_nb: resb 4
filename: resb 10
object: resb 10
execute_str: resb 12
compile_str: resb 65
