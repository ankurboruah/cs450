#include "types.h"
#include "syscall.h"
#include "user.h"

int bar(int y){
	int x[64*1024*4096];
	x[0]=1;
	x[64*1024*4095+25]=0;
	printf(1, "\nBar: %d\n", y);
	myMemory();
	if(y==0){return x[0];}
	bar(y-1);
	return x[0];
}
int
main(int argc, char *argv[])
{
	printf(1, "\nInitial\n");	
	myMemory();
	bar(9); 
}
