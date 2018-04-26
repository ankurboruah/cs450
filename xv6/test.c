#include "types.h"
#include "user.h"
#include "syscall.h"
#include "fcntl.h"
#include "string.h"

#define MAXARGS 10

int
main(int argc, char *argv[]){

	char *arguments[MAXARGS];
	
	strcpy(arguments[0],"mkdir");
	strcpy(arguments[1],"test1");
	execv(argv[0], argv);
	printf(1, "Start of Directory Walker\n");
	directoryWalker(".");
	printf(1, "End of Directory Walker\n");

	printf(1, "Start of Inode Walker\n");
	inodeBMWalker();
	printf(1, "End of Inode Walker\n");

	printf(1, "Start of Walker Comparison\n");
	walkerComparer();
	printf(1, "End of Walker Compariosn\n");
}
