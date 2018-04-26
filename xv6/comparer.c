#include "types.h"
#include "user.h"
#include "syscall.h"

#include "types.h"
#include "user.h"

int
main(int argc, char *argv[]){
	if(walkerComparer() == -1){
		printf(1,"No allocations\n\n");
	}
	exit();
}
