
_memtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	myMemory();
	return x[0];
}
int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 14             	sub    $0x14,%esp
	printf(1, "\nInitial\n");	
  13:	68 16 08 00 00       	push   $0x816
  18:	6a 01                	push   $0x1
  1a:	e8 d1 04 00 00       	call   4f0 <printf>
	myMemory();
  1f:	e8 16 04 00 00       	call   43a <myMemory>
	void *mem1 = malloc(50*1024*4096);
  24:	c7 04 24 00 00 80 0c 	movl   $0xc800000,(%esp)
  2b:	e8 f0 06 00 00       	call   720 <malloc>
  30:	89 c6                	mov    %eax,%esi
	printf(1, "\nMalloc 50*1024*4096\n");
  32:	58                   	pop    %eax
  33:	5a                   	pop    %edx
  34:	68 20 08 00 00       	push   $0x820
  39:	6a 01                	push   $0x1
  3b:	e8 b0 04 00 00       	call   4f0 <printf>
	myMemory();
  40:	e8 f5 03 00 00       	call   43a <myMemory>
	const int array[1024*4096];
	printf(1, "\nSize of Array: %d\n", sizeof(array));
  45:	83 c4 0c             	add    $0xc,%esp
  48:	68 00 00 00 01       	push   $0x1000000
  4d:	68 36 08 00 00       	push   $0x836
  52:	6a 01                	push   $0x1
  54:	e8 97 04 00 00       	call   4f0 <printf>
	printf(1, "\nConst Int Array");
  59:	59                   	pop    %ecx
  5a:	5b                   	pop    %ebx
  5b:	68 4a 08 00 00       	push   $0x84a
  60:	6a 01                	push   $0x1
  62:	e8 89 04 00 00       	call   4f0 <printf>
	myMemory();
  67:	e8 ce 03 00 00       	call   43a <myMemory>
#include "types.h"
#include "syscall.h"
#include "user.h"

int* foo(){
	int *x=malloc(8192);
  6c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
  73:	e8 a8 06 00 00       	call   720 <malloc>
  78:	89 c3                	mov    %eax,%ebx
	const int array[1024*4096];
	printf(1, "\nSize of Array: %d\n", sizeof(array));
	printf(1, "\nConst Int Array");
	myMemory();
	int *mem2 = foo();
	printf(1, "\nFoo\n");
  7a:	58                   	pop    %eax
  7b:	5a                   	pop    %edx
  7c:	68 5b 08 00 00       	push   $0x85b
  81:	6a 01                	push   $0x1
  83:	e8 68 04 00 00       	call   4f0 <printf>
	myMemory();
  88:	e8 ad 03 00 00       	call   43a <myMemory>
	return x;
}
int bar(){
	int x[8192];
	x[0]=0;
	printf(1, "\nBar\n");
  8d:	59                   	pop    %ecx
  8e:	58                   	pop    %eax
  8f:	68 10 08 00 00       	push   $0x810
  94:	6a 01                	push   $0x1
  96:	e8 55 04 00 00       	call   4f0 <printf>
	myMemory();
  9b:	e8 9a 03 00 00       	call   43a <myMemory>
	myMemory();
	int *mem2 = foo();
	printf(1, "\nFoo\n");
	myMemory();
	bar(); 
	free(mem1);
  a0:	89 34 24             	mov    %esi,(%esp)
  a3:	e8 e8 05 00 00       	call   690 <free>
	printf(1, "\nFree Malloc 48*1024*4096\n");
  a8:	58                   	pop    %eax
  a9:	5a                   	pop    %edx
  aa:	68 61 08 00 00       	push   $0x861
  af:	6a 01                	push   $0x1
  b1:	e8 3a 04 00 00       	call   4f0 <printf>
	myMemory();
  b6:	e8 7f 03 00 00       	call   43a <myMemory>
	free(mem2);
  bb:	89 1c 24             	mov    %ebx,(%esp)
  be:	e8 cd 05 00 00       	call   690 <free>
	printf(1, "\nFree Foo Malloc 8192\n");
  c3:	59                   	pop    %ecx
  c4:	5b                   	pop    %ebx
  c5:	68 7c 08 00 00       	push   $0x87c
  ca:	6a 01                	push   $0x1
  cc:	e8 1f 04 00 00       	call   4f0 <printf>
	myMemory();
  d1:	e8 64 03 00 00       	call   43a <myMemory>
	mem1 = malloc(1);
  d6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  dd:	e8 3e 06 00 00       	call   720 <malloc>
	printf(1, "\nMalloc 1\n");
  e2:	5e                   	pop    %esi
  e3:	58                   	pop    %eax
  e4:	68 93 08 00 00       	push   $0x893
  e9:	6a 01                	push   $0x1
  eb:	e8 00 04 00 00       	call   4f0 <printf>
	myMemory();
  f0:	e8 45 03 00 00       	call   43a <myMemory>
}
  f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  f8:	31 c0                	xor    %eax,%eax
  fa:	59                   	pop    %ecx
  fb:	5b                   	pop    %ebx
  fc:	5e                   	pop    %esi
  fd:	5d                   	pop    %ebp
  fe:	8d 61 fc             	lea    -0x4(%ecx),%esp
 101:	c3                   	ret    
 102:	66 90                	xchg   %ax,%ax
 104:	66 90                	xchg   %ax,%ax
 106:	66 90                	xchg   %ax,%ax
 108:	66 90                	xchg   %ax,%ax
 10a:	66 90                	xchg   %ax,%ax
 10c:	66 90                	xchg   %ax,%ax
 10e:	66 90                	xchg   %ax,%ax

00000110 <foo>:
#include "types.h"
#include "syscall.h"
#include "user.h"

int* foo(){
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	83 ec 14             	sub    $0x14,%esp
	int *x=malloc(8192);
 116:	68 00 20 00 00       	push   $0x2000
 11b:	e8 00 06 00 00       	call   720 <malloc>
	return x;
}
 120:	c9                   	leave  
 121:	c3                   	ret    
 122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <bar>:
int bar(){
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	83 ec 10             	sub    $0x10,%esp
	int x[8192];
	x[0]=0;
	printf(1, "\nBar\n");
 136:	68 10 08 00 00       	push   $0x810
 13b:	6a 01                	push   $0x1
 13d:	e8 ae 03 00 00       	call   4f0 <printf>
	myMemory();
 142:	e8 f3 02 00 00       	call   43a <myMemory>
	return x[0];
}
 147:	31 c0                	xor    %eax,%eax
 149:	c9                   	leave  
 14a:	c3                   	ret    
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15a:	89 c2                	mov    %eax,%edx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	83 c1 01             	add    $0x1,%ecx
 163:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 db                	test   %bl,%bl
 16c:	88 5a ff             	mov    %bl,-0x1(%edx)
 16f:	75 ef                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 171:	5b                   	pop    %ebx
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	8b 55 08             	mov    0x8(%ebp),%edx
 188:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 18b:	0f b6 02             	movzbl (%edx),%eax
 18e:	0f b6 19             	movzbl (%ecx),%ebx
 191:	84 c0                	test   %al,%al
 193:	75 1e                	jne    1b3 <strcmp+0x33>
 195:	eb 29                	jmp    1c0 <strcmp+0x40>
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1a0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1a6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1a9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1ad:	84 c0                	test   %al,%al
 1af:	74 0f                	je     1c0 <strcmp+0x40>
 1b1:	89 f1                	mov    %esi,%ecx
 1b3:	38 d8                	cmp    %bl,%al
 1b5:	74 e9                	je     1a0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1b7:	29 d8                	sub    %ebx,%eax
}
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1c0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1c2:	29 d8                	sub    %ebx,%eax
}
 1c4:	5b                   	pop    %ebx
 1c5:	5e                   	pop    %esi
 1c6:	5d                   	pop    %ebp
 1c7:	c3                   	ret    
 1c8:	90                   	nop
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strlen>:

uint
strlen(char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 39 00             	cmpb   $0x0,(%ecx)
 1d9:	74 12                	je     1ed <strlen+0x1d>
 1db:	31 d2                	xor    %edx,%edx
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1e7:	89 d0                	mov    %edx,%eax
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1ed:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	eb 0d                	jmp    200 <memset>
 1f3:	90                   	nop
 1f4:	90                   	nop
 1f5:	90                   	nop
 1f6:	90                   	nop
 1f7:	90                   	nop
 1f8:	90                   	nop
 1f9:	90                   	nop
 1fa:	90                   	nop
 1fb:	90                   	nop
 1fc:	90                   	nop
 1fd:	90                   	nop
 1fe:	90                   	nop
 1ff:	90                   	nop

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	74 1d                	je     24e <strchr+0x2e>
    if(*s == c)
 231:	38 d3                	cmp    %dl,%bl
 233:	89 d9                	mov    %ebx,%ecx
 235:	75 0d                	jne    244 <strchr+0x24>
 237:	eb 17                	jmp    250 <strchr+0x30>
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	38 ca                	cmp    %cl,%dl
 242:	74 0c                	je     250 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 244:	83 c0 01             	add    $0x1,%eax
 247:	0f b6 10             	movzbl (%eax),%edx
 24a:	84 d2                	test   %dl,%dl
 24c:	75 f2                	jne    240 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 24e:	31 c0                	xor    %eax,%eax
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 266:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 268:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 26b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26e:	eb 29                	jmp    299 <gets+0x39>
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	57                   	push   %edi
 276:	6a 00                	push   $0x0
 278:	e8 2d 01 00 00       	call   3aa <read>
    if(cc < 1)
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 28d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 28f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 293:	74 1b                	je     2b0 <gets+0x50>
 295:	3c 0d                	cmp    $0xd,%al
 297:	74 17                	je     2b0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 299:	8d 5e 01             	lea    0x1(%esi),%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5f                   	pop    %edi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	eb 0d                	jmp    2d0 <stat>
 2c3:	90                   	nop
 2c4:	90                   	nop
 2c5:	90                   	nop
 2c6:	90                   	nop
 2c7:	90                   	nop
 2c8:	90                   	nop
 2c9:	90                   	nop
 2ca:	90                   	nop
 2cb:	90                   	nop
 2cc:	90                   	nop
 2cd:	90                   	nop
 2ce:	90                   	nop
 2cf:	90                   	nop

000002d0 <stat>:

int
stat(char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	pushl  0x8(%ebp)
 2dd:	e8 f0 00 00 00       	call   3d2 <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	pushl  0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f3 00 00 00       	call   3ea <fstat>
 2f7:	89 c6                	mov    %eax,%esi
  close(fd);
 2f9:	89 1c 24             	mov    %ebx,(%esp)
 2fc:	e8 b9 00 00 00       	call   3ba <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
 304:	89 f0                	mov    %esi,%eax
}
 306:	8d 65 f8             	lea    -0x8(%ebp),%esp
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 310:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 315:	eb ef                	jmp    306 <stat+0x36>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 11             	movsbl (%ecx),%edx
 32a:	8d 42 d0             	lea    -0x30(%edx),%eax
 32d:	3c 09                	cmp    $0x9,%al
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
 334:	77 1f                	ja     355 <atoi+0x35>
 336:	8d 76 00             	lea    0x0(%esi),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 340:	8d 04 80             	lea    (%eax,%eax,4),%eax
 343:	83 c1 01             	add    $0x1,%ecx
 346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 34a:	0f be 11             	movsbl (%ecx),%edx
 34d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 355:	5b                   	pop    %ebx
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	8b 5d 10             	mov    0x10(%ebp),%ebx
 368:	8b 45 08             	mov    0x8(%ebp),%eax
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 db                	test   %ebx,%ebx
 370:	7e 14                	jle    386 <memmove+0x26>
 372:	31 d2                	xor    %edx,%edx
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 378:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 37c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 37f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 382:	39 da                	cmp    %ebx,%edx
 384:	75 f2                	jne    378 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    

0000038a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38a:	b8 01 00 00 00       	mov    $0x1,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <exit>:
SYSCALL(exit)
 392:	b8 02 00 00 00       	mov    $0x2,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <wait>:
SYSCALL(wait)
 39a:	b8 03 00 00 00       	mov    $0x3,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <pipe>:
SYSCALL(pipe)
 3a2:	b8 04 00 00 00       	mov    $0x4,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <read>:
SYSCALL(read)
 3aa:	b8 05 00 00 00       	mov    $0x5,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <write>:
SYSCALL(write)
 3b2:	b8 10 00 00 00       	mov    $0x10,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <close>:
SYSCALL(close)
 3ba:	b8 15 00 00 00       	mov    $0x15,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <kill>:
SYSCALL(kill)
 3c2:	b8 06 00 00 00       	mov    $0x6,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <exec>:
SYSCALL(exec)
 3ca:	b8 07 00 00 00       	mov    $0x7,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <open>:
SYSCALL(open)
 3d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <mknod>:
SYSCALL(mknod)
 3da:	b8 11 00 00 00       	mov    $0x11,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <unlink>:
SYSCALL(unlink)
 3e2:	b8 12 00 00 00       	mov    $0x12,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <fstat>:
SYSCALL(fstat)
 3ea:	b8 08 00 00 00       	mov    $0x8,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <link>:
SYSCALL(link)
 3f2:	b8 13 00 00 00       	mov    $0x13,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <mkdir>:
SYSCALL(mkdir)
 3fa:	b8 14 00 00 00       	mov    $0x14,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <chdir>:
SYSCALL(chdir)
 402:	b8 09 00 00 00       	mov    $0x9,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <dup>:
SYSCALL(dup)
 40a:	b8 0a 00 00 00       	mov    $0xa,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <getpid>:
SYSCALL(getpid)
 412:	b8 0b 00 00 00       	mov    $0xb,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <sbrk>:
SYSCALL(sbrk)
 41a:	b8 0c 00 00 00       	mov    $0xc,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <sleep>:
SYSCALL(sleep)
 422:	b8 0d 00 00 00       	mov    $0xd,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <uptime>:
SYSCALL(uptime)
 42a:	b8 0e 00 00 00       	mov    $0xe,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <getcallcount>:
SYSCALL(getcallcount)
 432:	b8 16 00 00 00       	mov    $0x16,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <myMemory>:
SYSCALL(myMemory)
 43a:	b8 17 00 00 00       	mov    $0x17,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    
 442:	66 90                	xchg   %ax,%ax
 444:	66 90                	xchg   %ax,%ax
 446:	66 90                	xchg   %ax,%ax
 448:	66 90                	xchg   %ax,%ax
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	89 c6                	mov    %eax,%esi
 458:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 45e:	85 db                	test   %ebx,%ebx
 460:	74 7e                	je     4e0 <printint+0x90>
 462:	89 d0                	mov    %edx,%eax
 464:	c1 e8 1f             	shr    $0x1f,%eax
 467:	84 c0                	test   %al,%al
 469:	74 75                	je     4e0 <printint+0x90>
    neg = 1;
    x = -xx;
 46b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 46d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 474:	f7 d8                	neg    %eax
 476:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 479:	31 ff                	xor    %edi,%edi
 47b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 47e:	89 ce                	mov    %ecx,%esi
 480:	eb 08                	jmp    48a <printint+0x3a>
 482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 488:	89 cf                	mov    %ecx,%edi
 48a:	31 d2                	xor    %edx,%edx
 48c:	8d 4f 01             	lea    0x1(%edi),%ecx
 48f:	f7 f6                	div    %esi
 491:	0f b6 92 a8 08 00 00 	movzbl 0x8a8(%edx),%edx
  }while((x /= base) != 0);
 498:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 49a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 49d:	75 e9                	jne    488 <printint+0x38>
  if(neg)
 49f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4a2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4a5:	85 c0                	test   %eax,%eax
 4a7:	74 08                	je     4b1 <printint+0x61>
    buf[i++] = '-';
 4a9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 4ae:	8d 4f 02             	lea    0x2(%edi),%ecx
 4b1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 4b5:	8d 76 00             	lea    0x0(%esi),%esi
 4b8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4bb:	83 ec 04             	sub    $0x4,%esp
 4be:	83 ef 01             	sub    $0x1,%edi
 4c1:	6a 01                	push   $0x1
 4c3:	53                   	push   %ebx
 4c4:	56                   	push   %esi
 4c5:	88 45 d7             	mov    %al,-0x29(%ebp)
 4c8:	e8 e5 fe ff ff       	call   3b2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4cd:	83 c4 10             	add    $0x10,%esp
 4d0:	39 df                	cmp    %ebx,%edi
 4d2:	75 e4                	jne    4b8 <printint+0x68>
    putc(fd, buf[i]);
}
 4d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d7:	5b                   	pop    %ebx
 4d8:	5e                   	pop    %esi
 4d9:	5f                   	pop    %edi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4e0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4e2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4e9:	eb 8b                	jmp    476 <printint+0x26>
 4eb:	90                   	nop
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4f9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4fc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4ff:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 502:	89 45 d0             	mov    %eax,-0x30(%ebp)
 505:	0f b6 1e             	movzbl (%esi),%ebx
 508:	83 c6 01             	add    $0x1,%esi
 50b:	84 db                	test   %bl,%bl
 50d:	0f 84 b0 00 00 00    	je     5c3 <printf+0xd3>
 513:	31 d2                	xor    %edx,%edx
 515:	eb 39                	jmp    550 <printf+0x60>
 517:	89 f6                	mov    %esi,%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 520:	83 f8 25             	cmp    $0x25,%eax
 523:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 526:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 52b:	74 18                	je     545 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 52d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 536:	6a 01                	push   $0x1
 538:	50                   	push   %eax
 539:	57                   	push   %edi
 53a:	e8 73 fe ff ff       	call   3b2 <write>
 53f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 542:	83 c4 10             	add    $0x10,%esp
 545:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 548:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 54c:	84 db                	test   %bl,%bl
 54e:	74 73                	je     5c3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 550:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 552:	0f be cb             	movsbl %bl,%ecx
 555:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 558:	74 c6                	je     520 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 55a:	83 fa 25             	cmp    $0x25,%edx
 55d:	75 e6                	jne    545 <printf+0x55>
      if(c == 'd'){
 55f:	83 f8 64             	cmp    $0x64,%eax
 562:	0f 84 f8 00 00 00    	je     660 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 568:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 56e:	83 f9 70             	cmp    $0x70,%ecx
 571:	74 5d                	je     5d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 573:	83 f8 73             	cmp    $0x73,%eax
 576:	0f 84 84 00 00 00    	je     600 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57c:	83 f8 63             	cmp    $0x63,%eax
 57f:	0f 84 ea 00 00 00    	je     66f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 585:	83 f8 25             	cmp    $0x25,%eax
 588:	0f 84 c2 00 00 00    	je     650 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 591:	83 ec 04             	sub    $0x4,%esp
 594:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 598:	6a 01                	push   $0x1
 59a:	50                   	push   %eax
 59b:	57                   	push   %edi
 59c:	e8 11 fe ff ff       	call   3b2 <write>
 5a1:	83 c4 0c             	add    $0xc,%esp
 5a4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5a7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5aa:	6a 01                	push   $0x1
 5ac:	50                   	push   %eax
 5ad:	57                   	push   %edi
 5ae:	83 c6 01             	add    $0x1,%esi
 5b1:	e8 fc fd ff ff       	call   3b2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5bd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5bf:	84 db                	test   %bl,%bl
 5c1:	75 8d                	jne    550 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c6:	5b                   	pop    %ebx
 5c7:	5e                   	pop    %esi
 5c8:	5f                   	pop    %edi
 5c9:	5d                   	pop    %ebp
 5ca:	c3                   	ret    
 5cb:	90                   	nop
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d8:	6a 00                	push   $0x0
 5da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5dd:	89 f8                	mov    %edi,%eax
 5df:	8b 13                	mov    (%ebx),%edx
 5e1:	e8 6a fe ff ff       	call   450 <printint>
        ap++;
 5e6:	89 d8                	mov    %ebx,%eax
 5e8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5eb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 5ed:	83 c0 04             	add    $0x4,%eax
 5f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f3:	e9 4d ff ff ff       	jmp    545 <printf+0x55>
 5f8:	90                   	nop
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 600:	8b 45 d0             	mov    -0x30(%ebp),%eax
 603:	8b 18                	mov    (%eax),%ebx
        ap++;
 605:	83 c0 04             	add    $0x4,%eax
 608:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 60b:	b8 9e 08 00 00       	mov    $0x89e,%eax
 610:	85 db                	test   %ebx,%ebx
 612:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 615:	0f b6 03             	movzbl (%ebx),%eax
 618:	84 c0                	test   %al,%al
 61a:	74 23                	je     63f <printf+0x14f>
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 620:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 623:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 626:	83 ec 04             	sub    $0x4,%esp
 629:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 62b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 62e:	50                   	push   %eax
 62f:	57                   	push   %edi
 630:	e8 7d fd ff ff       	call   3b2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 635:	0f b6 03             	movzbl (%ebx),%eax
 638:	83 c4 10             	add    $0x10,%esp
 63b:	84 c0                	test   %al,%al
 63d:	75 e1                	jne    620 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 ff fe ff ff       	jmp    545 <printf+0x55>
 646:	8d 76 00             	lea    0x0(%esi),%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 656:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 659:	6a 01                	push   $0x1
 65b:	e9 4c ff ff ff       	jmp    5ac <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 0a 00 00 00       	mov    $0xa,%ecx
 668:	6a 01                	push   $0x1
 66a:	e9 6b ff ff ff       	jmp    5da <printf+0xea>
 66f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 672:	83 ec 04             	sub    $0x4,%esp
 675:	8b 03                	mov    (%ebx),%eax
 677:	6a 01                	push   $0x1
 679:	88 45 e4             	mov    %al,-0x1c(%ebp)
 67c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 67f:	50                   	push   %eax
 680:	57                   	push   %edi
 681:	e8 2c fd ff ff       	call   3b2 <write>
 686:	e9 5b ff ff ff       	jmp    5e6 <printf+0xf6>
 68b:	66 90                	xchg   %ax,%ax
 68d:	66 90                	xchg   %ax,%ax
 68f:	90                   	nop

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	a1 98 0b 00 00       	mov    0xb98,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a3:	39 c8                	cmp    %ecx,%eax
 6a5:	73 19                	jae    6c0 <free+0x30>
 6a7:	89 f6                	mov    %esi,%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 6b0:	39 d1                	cmp    %edx,%ecx
 6b2:	72 1c                	jb     6d0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b4:	39 d0                	cmp    %edx,%eax
 6b6:	73 18                	jae    6d0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6bc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6be:	72 f0                	jb     6b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c0:	39 d0                	cmp    %edx,%eax
 6c2:	72 f4                	jb     6b8 <free+0x28>
 6c4:	39 d1                	cmp    %edx,%ecx
 6c6:	73 f0                	jae    6b8 <free+0x28>
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6d6:	39 d7                	cmp    %edx,%edi
 6d8:	74 19                	je     6f3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e3:	39 f1                	cmp    %esi,%ecx
 6e5:	74 23                	je     70a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6e9:	a3 98 0b 00 00       	mov    %eax,0xb98
}
 6ee:	5b                   	pop    %ebx
 6ef:	5e                   	pop    %esi
 6f0:	5f                   	pop    %edi
 6f1:	5d                   	pop    %ebp
 6f2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6f3:	03 72 04             	add    0x4(%edx),%esi
 6f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f9:	8b 10                	mov    (%eax),%edx
 6fb:	8b 12                	mov    (%edx),%edx
 6fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 700:	8b 50 04             	mov    0x4(%eax),%edx
 703:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 706:	39 f1                	cmp    %esi,%ecx
 708:	75 dd                	jne    6e7 <free+0x57>
    p->s.size += bp->s.size;
 70a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 70d:	a3 98 0b 00 00       	mov    %eax,0xb98
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 712:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 715:	8b 53 f8             	mov    -0x8(%ebx),%edx
 718:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 71a:	5b                   	pop    %ebx
 71b:	5e                   	pop    %esi
 71c:	5f                   	pop    %edi
 71d:	5d                   	pop    %ebp
 71e:	c3                   	ret    
 71f:	90                   	nop

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 72c:	8b 15 98 0b 00 00    	mov    0xb98,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 732:	8d 78 07             	lea    0x7(%eax),%edi
 735:	c1 ef 03             	shr    $0x3,%edi
 738:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 73b:	85 d2                	test   %edx,%edx
 73d:	0f 84 a3 00 00 00    	je     7e6 <malloc+0xc6>
 743:	8b 02                	mov    (%edx),%eax
 745:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 748:	39 cf                	cmp    %ecx,%edi
 74a:	76 74                	jbe    7c0 <malloc+0xa0>
 74c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 752:	be 00 10 00 00       	mov    $0x1000,%esi
 757:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 75e:	0f 43 f7             	cmovae %edi,%esi
 761:	ba 00 80 00 00       	mov    $0x8000,%edx
 766:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 76c:	0f 46 da             	cmovbe %edx,%ebx
 76f:	eb 10                	jmp    781 <malloc+0x61>
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 778:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 77a:	8b 48 04             	mov    0x4(%eax),%ecx
 77d:	39 cf                	cmp    %ecx,%edi
 77f:	76 3f                	jbe    7c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 781:	39 05 98 0b 00 00    	cmp    %eax,0xb98
 787:	89 c2                	mov    %eax,%edx
 789:	75 ed                	jne    778 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 78b:	83 ec 0c             	sub    $0xc,%esp
 78e:	53                   	push   %ebx
 78f:	e8 86 fc ff ff       	call   41a <sbrk>
  if(p == (char*)-1)
 794:	83 c4 10             	add    $0x10,%esp
 797:	83 f8 ff             	cmp    $0xffffffff,%eax
 79a:	74 1c                	je     7b8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 79c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 79f:	83 ec 0c             	sub    $0xc,%esp
 7a2:	83 c0 08             	add    $0x8,%eax
 7a5:	50                   	push   %eax
 7a6:	e8 e5 fe ff ff       	call   690 <free>
  return freep;
 7ab:	8b 15 98 0b 00 00    	mov    0xb98,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7b1:	83 c4 10             	add    $0x10,%esp
 7b4:	85 d2                	test   %edx,%edx
 7b6:	75 c0                	jne    778 <malloc+0x58>
        return 0;
 7b8:	31 c0                	xor    %eax,%eax
 7ba:	eb 1c                	jmp    7d8 <malloc+0xb8>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7c0:	39 cf                	cmp    %ecx,%edi
 7c2:	74 1c                	je     7e0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7c4:	29 f9                	sub    %edi,%ecx
 7c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7cc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 7cf:	89 15 98 0b 00 00    	mov    %edx,0xb98
      return (void*)(p + 1);
 7d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7db:	5b                   	pop    %ebx
 7dc:	5e                   	pop    %esi
 7dd:	5f                   	pop    %edi
 7de:	5d                   	pop    %ebp
 7df:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 08                	mov    (%eax),%ecx
 7e2:	89 0a                	mov    %ecx,(%edx)
 7e4:	eb e9                	jmp    7cf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7e6:	c7 05 98 0b 00 00 9c 	movl   $0xb9c,0xb98
 7ed:	0b 00 00 
 7f0:	c7 05 9c 0b 00 00 9c 	movl   $0xb9c,0xb9c
 7f7:	0b 00 00 
    base.s.size = 0;
 7fa:	b8 9c 0b 00 00       	mov    $0xb9c,%eax
 7ff:	c7 05 a0 0b 00 00 00 	movl   $0x0,0xba0
 806:	00 00 00 
 809:	e9 3e ff ff ff       	jmp    74c <malloc+0x2c>
