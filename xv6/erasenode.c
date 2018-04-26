#include "types.h"
#include "user.h"
#include "syscall.h"

int
main(int argc, char *argv[]){


if(argc == 1){
  damageDirectoryInode(1);
}
else{
  if((damageDirectoryInode(atoi(argv[1]))) == -1){
    printf(1,"Input not valid\n");
  }
}
exit();
}
