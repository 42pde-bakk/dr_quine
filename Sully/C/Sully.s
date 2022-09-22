	.file	"Sully.c"
	.text
	.globl	i
	.section	.rodata
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.long	5
.LC0:
	.string	"Sully_%d.c"
.LC1:
	.string	"./Sully_%d"
.LC2:
	.string	"cc %s -o %s"
.LC3:
	.string	"w"
	.align 8
.LC4:
	.ascii	"#define _GNU_SOURCE%2$c#include <stdio.h>%2$c#include <stdli"
	.ascii	"b.h>%2$c%2$cconst int i = %4$d;%2$c%2$cint main() {%2$c%1$ci"
	.ascii	"f (i == 0)%2$c%1$c%1$creturn (0);%2$c%1$cchar *filename, *co"
	.ascii	"mpile, *execute;%2$c%1$casprintf(&filename, %3$cSully_%%d.c%"
	.ascii	"3$c, i - 1);%2$c%1$casprintf(&execute, %3$c./Sully_%%d%3$c, "
	.ascii	"i - 1);%2$c%1$casprintf(&compile, %3$ccc %%s -o %%s%3$c, fil"
	.ascii	"ename, execute);%2$c%1$cFILE* fptr ="
	.string	" fopen(filename, %3$cw%3$c);%2$c%1$cif (fptr == NULL)%2$c%1$c%1$creturn (1);%2$c%1$cconst char* x = %3$c%5$s%3$c;%2$c%1$cfprintf(fptr, x, 9, 10, 34, i - 1, x);%2$c%1$cfclose(fptr);%2$c%1$csystem(compile);%2$c%1$csystem(execute);%2$c%1$creturn (0);%2$c}%2$c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$5, %eax
	testl	%eax, %eax
	jne	.L2
	movl	$0, %eax
	jmp	.L5
.L2:
	movl	$5, %eax
	leal	-1(%rax), %edx
	leaq	-24(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movl	$5, %eax
	leal	-1(%rax), %edx
	leaq	-40(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-40(%rbp), %rcx
	movq	-24(%rbp), %rdx
	leaq	-32(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	asprintf@PLT
	movq	-24(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L4
	movl	$1, %eax
	jmp	.L5
.L4:
	leaq	.LC4(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$5, %eax
	leal	-1(%rax), %edx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	subq	$8, %rsp
	pushq	-16(%rbp)
	movl	%edx, %r9d
	movl	$34, %r8d
	movl	$10, %ecx
	movl	$9, %edx
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addq	$16, %rsp
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	system@PLT
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	system@PLT
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
