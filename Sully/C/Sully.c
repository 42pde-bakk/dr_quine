#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

const int i = 5;

int main() {
	if (i == 0)
		return (0);
	char *filename, *compile, *execute;
	asprintf(&filename, "Sully_%d.c", i - 1);
	asprintf(&execute, "./Sully_%d", i - 1);
	asprintf(&compile, "cc %s -o %s", filename, execute);
	FILE* fptr = fopen(filename, "w");
	if (fptr == NULL)
		return (1);
	const char* x = "#define _GNU_SOURCE%2$c#include <stdio.h>%2$c#include <stdlib.h>%2$c%2$cconst int i = %4$d;%2$c%2$cint main() {%2$c%1$cif (i == 0)%2$c%1$c%1$creturn (0);%2$c%1$cchar *filename, *compile, *execute;%2$c%1$casprintf(&filename, %3$cSully_%%d.c%3$c, i - 1);%2$c%1$casprintf(&execute, %3$c./Sully_%%d%3$c, i - 1);%2$c%1$casprintf(&compile, %3$ccc %%s -o %%s%3$c, filename, execute);%2$c%1$cFILE* fptr = fopen(filename, %3$cw%3$c);%2$c%1$cif (fptr == NULL)%2$c%1$c%1$creturn (1);%2$c%1$cconst char* x = %3$c%5$s%3$c;%2$c%1$cfprintf(fptr, x, 9, 10, 34, i - 1, x);%2$c%1$cfclose(fptr);%2$c%1$csystem(compile);%2$c%1$csystem(execute);%2$c%1$creturn (0);%2$c}%2$c";
	fprintf(fptr, x, 9, 10, 34, i - 1, x);
	fclose(fptr);
	system(compile);
	system(execute);
	return (0);
}
