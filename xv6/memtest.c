#include "types.h"
#include "syscall.h"
#include "user.h"

int* foo(){
	int *x=malloc(8192);
	return x;
}
int bar(){
	int x[8192];
	x[0]=0;
	printf(1, "\nBar\n");
	myMemory();
	return x[0];
}
int
main(int argc, char *argv[])
{
	printf(1, "\nInitial\n");	
	myMemory();
	void *mem1 = malloc(48*1024*4096);
	printf(1, "\nMalloc 48*1024*4096\n");
	myMemory();
	const int array[1024*4096];
	printf(1, "\nSize of Array: %d\n", sizeof(array));
	printf(1, "\nConst Int Array");
	myMemory();
	int *mem2 = foo();
	printf(1, "\nFoo\n");
	myMemory();
	bar(); 
	free(mem1);
	printf(1, "\nFree Malloc 48*1024*4096\n");
	myMemory();
	free(mem2);
	printf(1, "\nFree Foo Malloc 8192\n");
	myMemory();
	mem1 = malloc(1);
	printf(1, "\nMalloc 1\n");
	myMemory();
}
