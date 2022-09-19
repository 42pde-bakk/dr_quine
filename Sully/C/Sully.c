#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int i = 5;

int main() {
	if (i == 0)
		return (0);
	char filename[10];
	sprintf(filename, "Sully_%d.c", i - 1);
	int fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 0644);
	if (fd == -1)
		return (1);
	const char* x = "#include <stdio.h>%2$c#include <fcntl.h>%2$c#include <unistd.h>%2$c%2$cint i = %4$d;%2$c%2$cint main() {%2$c%1$cif (i == 0)%2$c%1$c%1$creturn (0);%2$c%1$cchar filename[10];%2$c%1$csprintf(filename, %3$cSully_%%d.c%3$c, i - 1);%2$c%1$cint fd = open(filename, O_CREAT | O_TRUNC | O_WRONLY, 0644);%2$c%1$cif (fd == -1)%2$c%1$c%1$creturn (1);%2$c%1$cconst char* x = %3$c%5$s%3$c;%2$c%1$cdprintf(fd, x, 9, 10, 34, i - 1, x);%2$c%1$cclose(fd);%2$c%1$creturn (0);%2$c}%2$c";
	dprintf(fd, x, 9, 10, 34, i - 1, x);
	close(fd);
	return (0);
}
