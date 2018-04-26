#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "fs.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

//return how many calls to a system call
int
sys_getcallcount(void)
{
    int num = 0;
    argint(0, &num); //getting system call number

    struct proc *curproc = myproc();
    if(num>23 || num <1) return -1;
    return curproc->syscallcount[num];
}

//Printing the number of pages in use, user accessible and writable.
int
sys_myMemory(void)
{
    long int pagecount = 0, writecount=0, usercount=0;

    pde_t *pde;
    pte_t *pgtab;

    struct proc *curproc = myproc();

    pde = &curproc->pgdir[0];
    for(int i=0; i<1024; i++){
    	if(*pde & PTE_P){
	    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
	    for(int j=0; j<1024; j++){
			if(*pgtab & PTE_P) pagecount++; //Page is present
			if((*pgtab & PTE_P)&&(*pgtab & PTE_U)) usercount++;	//Pages accessible by user program.
			if((*pgtab & PTE_P)&&(*pgtab & PTE_U)&&(*pgtab & PTE_W)) writecount++; //Pages writable by the user program
			pgtab++;
	    }
	} 
	pde++;
    }	
    cprintf("Pages in use: %d\n", pagecount);
    cprintf("User Accessible Pages: %d\n", usercount);
    cprintf("User Writeable Pages: %d\n", writecount);
    return 0;
} 

