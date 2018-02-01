#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  printf(1, "%s", "Cannot exit. Press Ctrl+a and then x to terminate xv6.\n");
  exit();
}
