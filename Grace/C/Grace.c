#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
const char *x = "#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$cconst char *x = %2$c%3$s%2$c;%1$c#define FT(result) int main() {int fd = open(%2$cGrace_kid.c%2$c, O_WRONLY | O_TRUNC | O_CREAT, 0644); if (fd != -1) {dprintf(fd, x, 10, 34, x); close(fd);} return (result);}%1$c%1$cFT(0)%1$c";
#define FT(result) int main() {int fd = open("Grace_kid.c", O_WRONLY | O_TRUNC | O_CREAT, 0644); if (fd != -1) {dprintf(fd, x, 10, 34, x); close(fd);} return (result);}

FT(0)
