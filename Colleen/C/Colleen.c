#include <stdio.h>

// comment outside function

void print() {
	// comment inside function
	const char* x = "#include <stdio.h>%2$c%2$c// comment outside function%2$c%2$cvoid print() {%2$c%1$c// comment inside function%2$c%1$cconst char* x = %3$c%4$s%3$c;%2$c%1$cprintf(x, 9, 10, 34, x);%2$c}%2$c%2$cint main() {%2$c%1$cprint();%2$c%1$creturn (0);%2$c}%2$c";
	printf(x, 9, 10, 34, x);
}

int main() {
	print();
	return (0);
}
