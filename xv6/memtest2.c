/* Created for CS450 PA3 Spring 2018 by Group 8, Shahzil Sheikh(A20353481) and Ankur Boruah(A20392013)*/

#include "types.h"
#include "syscall.h"
#include "user.h"

int* foo(int y){
	int *x=malloc(8*1024); //Dynamic Allocation
	printf(1, "\nFoo %d\n", 10-y);
	myMemory(); //Page usage changes by 8 everytime it needs a new page as 32KB is allocated.
	if(y==0){return x;}
	foo(y-1);
	return x;
}

int
main(int argc, char *argv[])
{
	printf(1, "\nInitial\n");	
	myMemory();
	foo(9);
}
