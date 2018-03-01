#include "syscall.h"
#include "types.h"
#include "user.h"
#include "stat.h"


int
main(int argc, char *argv[])
{
  char source[] = "Hello";
  char dest[512], buf[1];
  strcpy(dest, source);
  printf(1, "Contents of out.txt: ");
  int n, fd;
  if((fd = open("out.txt",0))<0) return -1;
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "console: write error\n");
      exit();
    }
  }
  printf(1, "\nResult of strcpy(): %s %s", dest, "\n\n");
  printf(1, "read count %d\n", getcallcount(SYS_read));
  printf(1, "initial fork count %d\n", getcallcount(SYS_fork));
  if (fork() == 0) {
    printf(1, "child fork count %d\n", getcallcount(SYS_fork));
    printf(1, "child write count %d\n", getcallcount(SYS_write));
  } else {
    wait();
    printf(1, "parent fork count %d\n", getcallcount(SYS_fork));
    printf(1, "parent write count %d\n", getcallcount(SYS_write));
  }
  printf(1, "wait count %d\n", getcallcount(SYS_wait));
  return 0;
}
