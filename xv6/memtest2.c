#include "types.h"
#include "syscall.h"
#include "user.h"

int* foo(int y){
	int *x=malloc(8*1024);
	printf(1, "\nFoo %d\n", 10-y);
	myMemory();
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
