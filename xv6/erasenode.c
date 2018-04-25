#include "types.h"
#include "stat.h"
#include "user.h"
#include "syscall.h"

int main(int argc, char *argv[]) {
	
	if (argc == 2)
		fsop(atoi(argv[1]));

	exit();
}