#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  printf(1, "%s", "I cannot exit. Press ctrl+a and then x to quit xv6.\n");
  exit();
}
