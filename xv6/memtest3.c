/* Created for CS450 PA3 Spring 2018 by Group 8, Shahzil Sheikh(A20353481) and Ankur Boruah(A20392013)*/

#include "types.h"
#include "syscall.h"
#include "user.h"

int
main(int argc, char *argv[])
{
	printf(1, "\nInitial\n");	
	myMemory();
	int *x = malloc(12*1024);
	printf(1, "\n12*1024: %d\n", sizeof(x));
	myMemory();
	free(x);
	printf(1, "\nFree 12*1024\n");	
	myMemory(); //Page not returned after free. Still being used by process.
	int *y = malloc(24*1024);
	printf(1, "\n24*1024: %d\n", sizeof(y));
	myMemory();
}
