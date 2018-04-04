/* Created for CS450 PA3 Spring 2018 by Group 8, Shahzil Sheikh(A20353481) and Ankur Boruah(A20392013)*/

#include "types.h"
#include "syscall.h"
#include "user.h"

int* foo(int y){
	int *x=malloc(16*1024*4096); //Dynamic Allocation of huge chunk to check max allocation
	printf(1, "\nFoo %d\n", 10-y);
	myMemory(); 
	if(!x){
		printf(1, "\nUnable to allocate as there is no space!\n");
		return x;
	}
	foo(y-1);
	return x;
}

int
main(int argc, char *argv[])
{
	printf(1, "\nInitial\n");	
	myMemory();
	printf(1, "\nCalling foo recursively 10 times.\n");
	foo(9);
	printf(1, "\nNote how foo runs only 4 times due to unavailable memory.\n");
}
