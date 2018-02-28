#include "syscall.h"
#include "types.h"
#include "user.h"
#include "stat.h"

extern int callcount[23];

int
main(int argc, char *argv[])
{
  for(int i=0; i<23; i++){
    callcount[i]=0;
  }
  printf(1, "initial fork count %d\n", getsyscallcount(SYS_fork));
  if (fork() == 0) {
    printf(1, "child fork count %d\n", getsyscallcount(SYS_fork));
    printf(1, "child write count %d\n", getsyscallcount(SYS_write));
  } else {
    wait();
    printf(1, "parent fork count %d\n", getsyscallcount(SYS_fork));
    printf(1, "parent write count %d\n", getsyscallcount(SYS_write));
  }
  printf(1, "wait count %d\n", getsyscallcount(SYS_wait));
  return 0;
}
