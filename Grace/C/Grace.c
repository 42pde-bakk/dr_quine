#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
/*
	Comment ca va?
*/
#define OPEN(name) open(name, O_WRONLY | O_TRUNC | O_CREAT, 0644)
#define STR "#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$c/*%1$c%4$cComment ca va?%1$c*/%1$c#define OPEN(name) open(name, O_WRONLY | O_TRUNC | O_CREAT, 0644)%1$c#define STR %2$c%3$s%2$c%1$c#define FT(result) int main() {int fd = OPEN(%2$cGrace_kid.c%2$c); if (fd != -1) {dprintf(fd, STR, 10, 34, STR, 9); close(fd);} return (result);}%1$c%1$cFT(0)%1$c"
#define FT(result) int main() {int fd = OPEN("Grace_kid.c"); if (fd != -1) {dprintf(fd, STR, 10, 34, STR, 9); close(fd);} return (result);}

FT(0)
