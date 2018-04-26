#include "types.h"
#include "user.h"
#include "syscall.h"


int
main(int argc, char *argv[]){

	printf(1, "Start of Directory Walker\n");
	directoryWalker(".");
	printf(1, "End of Directory Walker\n");

}
