global main
extern fprintf, sprintf
extern fopen, fclose
extern exit, system

section .text

main:
  push rbp
  mov rbp, rsp
  mov rdi, 5
  cmp rdi, 0
  je byebye
  dec rdi
  mov [rel file_nb], rdi
  xor rax, rax

creation:
  ; build string Sully_x.s
  lea rdi, [rel filename]
  lea rsi, [rel filename_fmt]
  mov rdx, [rel file_nb]
  call sprintf

  ; build compile string
  lea rdi, [rel compile_str]
  lea rsi, [rel compile_fmt]
  mov rdx, [file_nb]
  call sprintf

  ; open Sully_x.s
  lea rdi, [rel filename]
  mov rsi, open_mode
  call fopen

  ; write to Sully_x.s
  push rax
  mov rdi, rax ; FILE*
  mov rsi, fmt
  mov rdx, 10
  mov rcx, 34
  mov r8,  fmt
  mov r9,  [file_nb]
  xor rax, rax
  call fprintf ;(FILE*, fmt, 10, 34, fmt, idx)

  pop rdi
  xor rax, rax
  call fclose

compile:
  mov rdi, compile_str
  xor rax, rax
  call system

byebye:
  leave
  xor rdi, rdi
  call exit

fmt: db "global main%1$cextern fprintf, sprintf%1$cextern fopen, fclose%1$cextern exit, system%1$c%1$csection .text%1$c%1$cmain:%1$c  push rbp%1$c  mov rbp, rsp%1$c  mov rdi, %4$d%1$c  cmp rdi, 0%1$c  je byebye%1$c  dec rdi%1$c  mov [rel file_nb], rdi%1$c  xor rax, rax%1$c%1$ccreation:%1$c  ; build string Sully_x.s%1$c  lea rdi, [rel filename]%1$c  lea rsi, [rel filename_fmt]%1$c  mov rdx, [rel file_nb]%1$c  call sprintf%1$c%1$c  ; build compile string%1$c  lea rdi, [rel compile_str]%1$c  lea rsi, [rel compile_fmt]%1$c  mov rdx, [file_nb]%1$c  call sprintf%1$c%1$c  ; open Sully_x.s%1$c  lea rdi, [rel filename]%1$c  mov rsi, open_mode%1$c  call fopen%1$c%1$c  ; write to Sully_x.s%1$c  push rax%1$c  mov rdi, rax ; FILE*%1$c  mov rsi, fmt%1$c  mov rdx, 10%1$c  mov rcx, 34%1$c  mov r8,  fmt%1$c  mov r9,  [file_nb]%1$c  xor rax, rax%1$c  call fprintf ;(FILE*, fmt, 10, 34, fmt, idx)%1$c%1$c  pop rdi%1$c  xor rax, rax%1$c  call fclose%1$ccompile:%1$c  mov rdi, compile_str%1$c  xor rax, rax%1$c  call system%1$c%1$cbyebye:%1$c  leave%1$c  xor rdi, rdi%1$c  call exit%1$c%1$cfmt: db %2$c%3$s%2$c, 0%1$cfilename_fmt: db %2$cSully_%%d.s%2$c, 0%1$copen_mode: db %2$cw%2$c, 0%1$ccompile_fmt: db %2$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc -lc -m64 -no-pie Sully_%%1$d.o -o Sully_%%1$d && ./Sully_%%1$d%2$c, 0%1$c%1$csection .bss%1$cfile_nb: resb 4%1$cfilename: resb 16%1$ccompile_str: resb 128%1$c", 0
filename_fmt: db "Sully_%d.s", 0
open_mode: db "w", 0
compile_fmt: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc -lc -m64 -no-pie Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d", 0

section .bss
file_nb: resb 4
filename: resb 16
compile_str: resb 128
