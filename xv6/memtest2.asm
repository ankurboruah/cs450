
_memtest2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	return x;
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
	printf(1, "\nInitial\n");	
  11:	68 c9 07 00 00       	push   $0x7c9
  16:	6a 01                	push   $0x1
  18:	e8 83 04 00 00       	call   4a0 <printf>
	myMemory();
  1d:	e8 a8 03 00 00       	call   3ca <myMemory>
	foo(9);
  22:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  29:	e8 12 00 00 00       	call   40 <foo>
}
  2e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  31:	31 c0                	xor    %eax,%eax
  33:	c9                   	leave  
  34:	8d 61 fc             	lea    -0x4(%ecx),%esp
  37:	c3                   	ret    
  38:	66 90                	xchg   %ax,%ax
  3a:	66 90                	xchg   %ax,%ax
  3c:	66 90                	xchg   %ax,%ax
  3e:	66 90                	xchg   %ax,%ax

00000040 <foo>:

#include "types.h"
#include "syscall.h"
#include "user.h"

int* foo(int y){
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	56                   	push   %esi
  44:	53                   	push   %ebx
  45:	8b 5d 08             	mov    0x8(%ebp),%ebx
	int *x=malloc(8*1024); //Dynamic Allocation
  48:	83 ec 0c             	sub    $0xc,%esp
  4b:	68 00 20 00 00       	push   $0x2000
  50:	e8 7b 06 00 00       	call   6d0 <malloc>
  55:	89 c6                	mov    %eax,%esi
	printf(1, "\nFoo %d\n", 10-y);
  57:	b8 0a 00 00 00       	mov    $0xa,%eax
  5c:	83 c4 0c             	add    $0xc,%esp
  5f:	29 d8                	sub    %ebx,%eax
  61:	50                   	push   %eax
  62:	68 c0 07 00 00       	push   $0x7c0
  67:	6a 01                	push   $0x1
  69:	e8 32 04 00 00       	call   4a0 <printf>
	myMemory(); //Page usage changes by 8 everytime it needs a new page as 32KB is allocated.
  6e:	e8 57 03 00 00       	call   3ca <myMemory>
	if(y==0){return x;}
  73:	83 c4 10             	add    $0x10,%esp
  76:	85 db                	test   %ebx,%ebx
  78:	74 0f                	je     89 <foo+0x49>
	foo(y-1);
  7a:	83 ec 0c             	sub    $0xc,%esp
  7d:	83 eb 01             	sub    $0x1,%ebx
  80:	53                   	push   %ebx
  81:	e8 ba ff ff ff       	call   40 <foo>
	return x;
  86:	83 c4 10             	add    $0x10,%esp
}
  89:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8c:	89 f0                	mov    %esi,%eax
  8e:	5b                   	pop    %ebx
  8f:	5e                   	pop    %esi
  90:	5d                   	pop    %ebp
  91:	c3                   	ret    
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcat>:

char*
strcat(char *s, char *t)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while(*s++ != '\0');
  da:	89 c2                	mov    %eax,%edx
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  e0:	83 c2 01             	add    $0x1,%edx
  e3:	80 7a ff 00          	cmpb   $0x0,-0x1(%edx)
  e7:	75 f7                	jne    e0 <strcat+0x10>
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  f0:	83 c1 01             	add    $0x1,%ecx
  f3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  f7:	83 c2 01             	add    $0x1,%edx
  fa:	84 db                	test   %bl,%bl
  fc:	88 5a ff             	mov    %bl,-0x1(%edx)
  ff:	75 ef                	jne    f0 <strcat+0x20>
    ;
  return os;
}
 101:	5b                   	pop    %ebx
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 10a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	56                   	push   %esi
 114:	53                   	push   %ebx
 115:	8b 55 08             	mov    0x8(%ebp),%edx
 118:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11b:	0f b6 02             	movzbl (%edx),%eax
 11e:	0f b6 19             	movzbl (%ecx),%ebx
 121:	84 c0                	test   %al,%al
 123:	75 1e                	jne    143 <strcmp+0x33>
 125:	eb 29                	jmp    150 <strcmp+0x40>
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 130:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 133:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 136:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 139:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 13d:	84 c0                	test   %al,%al
 13f:	74 0f                	je     150 <strcmp+0x40>
 141:	89 f1                	mov    %esi,%ecx
 143:	38 d8                	cmp    %bl,%al
 145:	74 e9                	je     130 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 147:	29 d8                	sub    %ebx,%eax
}
 149:	5b                   	pop    %ebx
 14a:	5e                   	pop    %esi
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    
 14d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 150:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 152:	29 d8                	sub    %ebx,%eax
}
 154:	5b                   	pop    %ebx
 155:	5e                   	pop    %esi
 156:	5d                   	pop    %ebp
 157:	c3                   	ret    
 158:	90                   	nop
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strlen>:

uint
strlen(char *s)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 166:	80 39 00             	cmpb   $0x0,(%ecx)
 169:	74 12                	je     17d <strlen+0x1d>
 16b:	31 d2                	xor    %edx,%edx
 16d:	8d 76 00             	lea    0x0(%esi),%esi
 170:	83 c2 01             	add    $0x1,%edx
 173:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 177:	89 d0                	mov    %edx,%eax
 179:	75 f5                	jne    170 <strlen+0x10>
    ;
  return n;
}
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 17d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	eb 0d                	jmp    190 <memset>
 183:	90                   	nop
 184:	90                   	nop
 185:	90                   	nop
 186:	90                   	nop
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 197:	8b 4d 10             	mov    0x10(%ebp),%ecx
 19a:	8b 45 0c             	mov    0xc(%ebp),%eax
 19d:	89 d7                	mov    %edx,%edi
 19f:	fc                   	cld    
 1a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a2:	89 d0                	mov    %edx,%eax
 1a4:	5f                   	pop    %edi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <strchr>:

char*
strchr(const char *s, char c)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1ba:	0f b6 10             	movzbl (%eax),%edx
 1bd:	84 d2                	test   %dl,%dl
 1bf:	74 1d                	je     1de <strchr+0x2e>
    if(*s == c)
 1c1:	38 d3                	cmp    %dl,%bl
 1c3:	89 d9                	mov    %ebx,%ecx
 1c5:	75 0d                	jne    1d4 <strchr+0x24>
 1c7:	eb 17                	jmp    1e0 <strchr+0x30>
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d0:	38 ca                	cmp    %cl,%dl
 1d2:	74 0c                	je     1e0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1d4:	83 c0 01             	add    $0x1,%eax
 1d7:	0f b6 10             	movzbl (%eax),%edx
 1da:	84 d2                	test   %dl,%dl
 1dc:	75 f2                	jne    1d0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1de:	31 c0                	xor    %eax,%eax
}
 1e0:	5b                   	pop    %ebx
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <gets>:

char*
gets(char *buf, int max)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
 1f5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 1f8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 1fb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fe:	eb 29                	jmp    229 <gets+0x39>
    cc = read(0, &c, 1);
 200:	83 ec 04             	sub    $0x4,%esp
 203:	6a 01                	push   $0x1
 205:	57                   	push   %edi
 206:	6a 00                	push   $0x0
 208:	e8 2d 01 00 00       	call   33a <read>
    if(cc < 1)
 20d:	83 c4 10             	add    $0x10,%esp
 210:	85 c0                	test   %eax,%eax
 212:	7e 1d                	jle    231 <gets+0x41>
      break;
    buf[i++] = c;
 214:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 218:	8b 55 08             	mov    0x8(%ebp),%edx
 21b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 21d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 21f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 223:	74 1b                	je     240 <gets+0x50>
 225:	3c 0d                	cmp    $0xd,%al
 227:	74 17                	je     240 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 229:	8d 5e 01             	lea    0x1(%esi),%ebx
 22c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 22f:	7c cf                	jl     200 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 238:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23b:	5b                   	pop    %ebx
 23c:	5e                   	pop    %esi
 23d:	5f                   	pop    %edi
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 240:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 243:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 245:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 249:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24c:	5b                   	pop    %ebx
 24d:	5e                   	pop    %esi
 24e:	5f                   	pop    %edi
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	eb 0d                	jmp    260 <stat>
 253:	90                   	nop
 254:	90                   	nop
 255:	90                   	nop
 256:	90                   	nop
 257:	90                   	nop
 258:	90                   	nop
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop
 25c:	90                   	nop
 25d:	90                   	nop
 25e:	90                   	nop
 25f:	90                   	nop

00000260 <stat>:

int
stat(char *n, struct stat *st)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 265:	83 ec 08             	sub    $0x8,%esp
 268:	6a 00                	push   $0x0
 26a:	ff 75 08             	pushl  0x8(%ebp)
 26d:	e8 f0 00 00 00       	call   362 <open>
  if(fd < 0)
 272:	83 c4 10             	add    $0x10,%esp
 275:	85 c0                	test   %eax,%eax
 277:	78 27                	js     2a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 279:	83 ec 08             	sub    $0x8,%esp
 27c:	ff 75 0c             	pushl  0xc(%ebp)
 27f:	89 c3                	mov    %eax,%ebx
 281:	50                   	push   %eax
 282:	e8 f3 00 00 00       	call   37a <fstat>
 287:	89 c6                	mov    %eax,%esi
  close(fd);
 289:	89 1c 24             	mov    %ebx,(%esp)
 28c:	e8 b9 00 00 00       	call   34a <close>
  return r;
 291:	83 c4 10             	add    $0x10,%esp
 294:	89 f0                	mov    %esi,%eax
}
 296:	8d 65 f8             	lea    -0x8(%ebp),%esp
 299:	5b                   	pop    %ebx
 29a:	5e                   	pop    %esi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a5:	eb ef                	jmp    296 <stat+0x36>
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b7:	0f be 11             	movsbl (%ecx),%edx
 2ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 2bd:	3c 09                	cmp    $0x9,%al
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
 2c4:	77 1f                	ja     2e5 <atoi+0x35>
 2c6:	8d 76 00             	lea    0x0(%esi),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2d3:	83 c1 01             	add    $0x1,%ecx
 2d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2da:	0f be 11             	movsbl (%ecx),%edx
 2dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2e0:	80 fb 09             	cmp    $0x9,%bl
 2e3:	76 eb                	jbe    2d0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2e5:	5b                   	pop    %ebx
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    
 2e8:	90                   	nop
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
 2fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2fe:	85 db                	test   %ebx,%ebx
 300:	7e 14                	jle    316 <memmove+0x26>
 302:	31 d2                	xor    %edx,%edx
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 312:	39 da                	cmp    %ebx,%edx
 314:	75 f2                	jne    308 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31a:	b8 01 00 00 00       	mov    $0x1,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <exit>:
SYSCALL(exit)
 322:	b8 02 00 00 00       	mov    $0x2,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <wait>:
SYSCALL(wait)
 32a:	b8 03 00 00 00       	mov    $0x3,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <pipe>:
SYSCALL(pipe)
 332:	b8 04 00 00 00       	mov    $0x4,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <read>:
SYSCALL(read)
 33a:	b8 05 00 00 00       	mov    $0x5,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <write>:
SYSCALL(write)
 342:	b8 10 00 00 00       	mov    $0x10,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <close>:
SYSCALL(close)
 34a:	b8 15 00 00 00       	mov    $0x15,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <kill>:
SYSCALL(kill)
 352:	b8 06 00 00 00       	mov    $0x6,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <exec>:
SYSCALL(exec)
 35a:	b8 07 00 00 00       	mov    $0x7,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <open>:
SYSCALL(open)
 362:	b8 0f 00 00 00       	mov    $0xf,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mknod>:
SYSCALL(mknod)
 36a:	b8 11 00 00 00       	mov    $0x11,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <unlink>:
SYSCALL(unlink)
 372:	b8 12 00 00 00       	mov    $0x12,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <fstat>:
SYSCALL(fstat)
 37a:	b8 08 00 00 00       	mov    $0x8,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <link>:
SYSCALL(link)
 382:	b8 13 00 00 00       	mov    $0x13,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mkdir>:
SYSCALL(mkdir)
 38a:	b8 14 00 00 00       	mov    $0x14,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <chdir>:
SYSCALL(chdir)
 392:	b8 09 00 00 00       	mov    $0x9,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <dup>:
SYSCALL(dup)
 39a:	b8 0a 00 00 00       	mov    $0xa,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getpid>:
SYSCALL(getpid)
 3a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <sbrk>:
SYSCALL(sbrk)
 3aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <sleep>:
SYSCALL(sleep)
 3b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <uptime>:
SYSCALL(uptime)
 3ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <getcallcount>:
SYSCALL(getcallcount)
 3c2:	b8 16 00 00 00       	mov    $0x16,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <myMemory>:
SYSCALL(myMemory)
 3ca:	b8 17 00 00 00       	mov    $0x17,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <directoryWalker>:
SYSCALL(directoryWalker)
 3d2:	b8 18 00 00 00       	mov    $0x18,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <inodeBMWalker>:
SYSCALL(inodeBMWalker)
 3da:	b8 19 00 00 00       	mov    $0x19,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <walkerComparer>:
SYSCALL(walkerComparer)
 3e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <damageDirectoryInode>:
SYSCALL(damageDirectoryInode)
 3ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <fsRecovery>:
SYSCALL(fsRecovery)
 3f2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    
 3fa:	66 90                	xchg   %ax,%ax
 3fc:	66 90                	xchg   %ax,%ax
 3fe:	66 90                	xchg   %ax,%ax

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	89 c6                	mov    %eax,%esi
 408:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 40e:	85 db                	test   %ebx,%ebx
 410:	74 7e                	je     490 <printint+0x90>
 412:	89 d0                	mov    %edx,%eax
 414:	c1 e8 1f             	shr    $0x1f,%eax
 417:	84 c0                	test   %al,%al
 419:	74 75                	je     490 <printint+0x90>
    neg = 1;
    x = -xx;
 41b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 41d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 424:	f7 d8                	neg    %eax
 426:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 429:	31 ff                	xor    %edi,%edi
 42b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 42e:	89 ce                	mov    %ecx,%esi
 430:	eb 08                	jmp    43a <printint+0x3a>
 432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 438:	89 cf                	mov    %ecx,%edi
 43a:	31 d2                	xor    %edx,%edx
 43c:	8d 4f 01             	lea    0x1(%edi),%ecx
 43f:	f7 f6                	div    %esi
 441:	0f b6 92 dc 07 00 00 	movzbl 0x7dc(%edx),%edx
  }while((x /= base) != 0);
 448:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 44a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 44d:	75 e9                	jne    438 <printint+0x38>
  if(neg)
 44f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 452:	8b 75 c0             	mov    -0x40(%ebp),%esi
 455:	85 c0                	test   %eax,%eax
 457:	74 08                	je     461 <printint+0x61>
    buf[i++] = '-';
 459:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 45e:	8d 4f 02             	lea    0x2(%edi),%ecx
 461:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 465:	8d 76 00             	lea    0x0(%esi),%esi
 468:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 46b:	83 ec 04             	sub    $0x4,%esp
 46e:	83 ef 01             	sub    $0x1,%edi
 471:	6a 01                	push   $0x1
 473:	53                   	push   %ebx
 474:	56                   	push   %esi
 475:	88 45 d7             	mov    %al,-0x29(%ebp)
 478:	e8 c5 fe ff ff       	call   342 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 47d:	83 c4 10             	add    $0x10,%esp
 480:	39 df                	cmp    %ebx,%edi
 482:	75 e4                	jne    468 <printint+0x68>
    putc(fd, buf[i]);
}
 484:	8d 65 f4             	lea    -0xc(%ebp),%esp
 487:	5b                   	pop    %ebx
 488:	5e                   	pop    %esi
 489:	5f                   	pop    %edi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 490:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 492:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 499:	eb 8b                	jmp    426 <printint+0x26>
 49b:	90                   	nop
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b5:	0f b6 1e             	movzbl (%esi),%ebx
 4b8:	83 c6 01             	add    $0x1,%esi
 4bb:	84 db                	test   %bl,%bl
 4bd:	0f 84 b0 00 00 00    	je     573 <printf+0xd3>
 4c3:	31 d2                	xor    %edx,%edx
 4c5:	eb 39                	jmp    500 <printf+0x60>
 4c7:	89 f6                	mov    %esi,%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d0:	83 f8 25             	cmp    $0x25,%eax
 4d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4db:	74 18                	je     4f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4e6:	6a 01                	push   $0x1
 4e8:	50                   	push   %eax
 4e9:	57                   	push   %edi
 4ea:	e8 53 fe ff ff       	call   342 <write>
 4ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4fc:	84 db                	test   %bl,%bl
 4fe:	74 73                	je     573 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 500:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 502:	0f be cb             	movsbl %bl,%ecx
 505:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 508:	74 c6                	je     4d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 50a:	83 fa 25             	cmp    $0x25,%edx
 50d:	75 e6                	jne    4f5 <printf+0x55>
      if(c == 'd'){
 50f:	83 f8 64             	cmp    $0x64,%eax
 512:	0f 84 f8 00 00 00    	je     610 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 518:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 51e:	83 f9 70             	cmp    $0x70,%ecx
 521:	74 5d                	je     580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 523:	83 f8 73             	cmp    $0x73,%eax
 526:	0f 84 84 00 00 00    	je     5b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 52c:	83 f8 63             	cmp    $0x63,%eax
 52f:	0f 84 ea 00 00 00    	je     61f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 535:	83 f8 25             	cmp    $0x25,%eax
 538:	0f 84 c2 00 00 00    	je     600 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 53e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 541:	83 ec 04             	sub    $0x4,%esp
 544:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 548:	6a 01                	push   $0x1
 54a:	50                   	push   %eax
 54b:	57                   	push   %edi
 54c:	e8 f1 fd ff ff       	call   342 <write>
 551:	83 c4 0c             	add    $0xc,%esp
 554:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 557:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 55a:	6a 01                	push   $0x1
 55c:	50                   	push   %eax
 55d:	57                   	push   %edi
 55e:	83 c6 01             	add    $0x1,%esi
 561:	e8 dc fd ff ff       	call   342 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 566:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 56a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 56d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 56f:	84 db                	test   %bl,%bl
 571:	75 8d                	jne    500 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 573:	8d 65 f4             	lea    -0xc(%ebp),%esp
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5f                   	pop    %edi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret    
 57b:	90                   	nop
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 10 00 00 00       	mov    $0x10,%ecx
 588:	6a 00                	push   $0x0
 58a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 58d:	89 f8                	mov    %edi,%eax
 58f:	8b 13                	mov    (%ebx),%edx
 591:	e8 6a fe ff ff       	call   400 <printint>
        ap++;
 596:	89 d8                	mov    %ebx,%eax
 598:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 59b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 59d:	83 c0 04             	add    $0x4,%eax
 5a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a3:	e9 4d ff ff ff       	jmp    4f5 <printf+0x55>
 5a8:	90                   	nop
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5b3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5b5:	83 c0 04             	add    $0x4,%eax
 5b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 5bb:	b8 d3 07 00 00       	mov    $0x7d3,%eax
 5c0:	85 db                	test   %ebx,%ebx
 5c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 5c5:	0f b6 03             	movzbl (%ebx),%eax
 5c8:	84 c0                	test   %al,%al
 5ca:	74 23                	je     5ef <printf+0x14f>
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5d6:	83 ec 04             	sub    $0x4,%esp
 5d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5de:	50                   	push   %eax
 5df:	57                   	push   %edi
 5e0:	e8 5d fd ff ff       	call   342 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5e5:	0f b6 03             	movzbl (%ebx),%eax
 5e8:	83 c4 10             	add    $0x10,%esp
 5eb:	84 c0                	test   %al,%al
 5ed:	75 e1                	jne    5d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ef:	31 d2                	xor    %edx,%edx
 5f1:	e9 ff fe ff ff       	jmp    4f5 <printf+0x55>
 5f6:	8d 76 00             	lea    0x0(%esi),%esi
 5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 606:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 609:	6a 01                	push   $0x1
 60b:	e9 4c ff ff ff       	jmp    55c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 0a 00 00 00       	mov    $0xa,%ecx
 618:	6a 01                	push   $0x1
 61a:	e9 6b ff ff ff       	jmp    58a <printf+0xea>
 61f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 622:	83 ec 04             	sub    $0x4,%esp
 625:	8b 03                	mov    (%ebx),%eax
 627:	6a 01                	push   $0x1
 629:	88 45 e4             	mov    %al,-0x1c(%ebp)
 62c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 62f:	50                   	push   %eax
 630:	57                   	push   %edi
 631:	e8 0c fd ff ff       	call   342 <write>
 636:	e9 5b ff ff ff       	jmp    596 <printf+0xf6>
 63b:	66 90                	xchg   %ax,%ax
 63d:	66 90                	xchg   %ax,%ax
 63f:	90                   	nop

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 c8 0a 00 00       	mov    0xac8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 650:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 653:	39 c8                	cmp    %ecx,%eax
 655:	73 19                	jae    670 <free+0x30>
 657:	89 f6                	mov    %esi,%esi
 659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 660:	39 d1                	cmp    %edx,%ecx
 662:	72 1c                	jb     680 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 664:	39 d0                	cmp    %edx,%eax
 666:	73 18                	jae    680 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 668:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 66a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 66e:	72 f0                	jb     660 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 670:	39 d0                	cmp    %edx,%eax
 672:	72 f4                	jb     668 <free+0x28>
 674:	39 d1                	cmp    %edx,%ecx
 676:	73 f0                	jae    668 <free+0x28>
 678:	90                   	nop
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 680:	8b 73 fc             	mov    -0x4(%ebx),%esi
 683:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 686:	39 d7                	cmp    %edx,%edi
 688:	74 19                	je     6a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 68a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 693:	39 f1                	cmp    %esi,%ecx
 695:	74 23                	je     6ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 697:	89 08                	mov    %ecx,(%eax)
  freep = p;
 699:	a3 c8 0a 00 00       	mov    %eax,0xac8
}
 69e:	5b                   	pop    %ebx
 69f:	5e                   	pop    %esi
 6a0:	5f                   	pop    %edi
 6a1:	5d                   	pop    %ebp
 6a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6a3:	03 72 04             	add    0x4(%edx),%esi
 6a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a9:	8b 10                	mov    (%eax),%edx
 6ab:	8b 12                	mov    (%edx),%edx
 6ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6b0:	8b 50 04             	mov    0x4(%eax),%edx
 6b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6b6:	39 f1                	cmp    %esi,%ecx
 6b8:	75 dd                	jne    697 <free+0x57>
    p->s.size += bp->s.size;
 6ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 6bd:	a3 c8 0a 00 00       	mov    %eax,0xac8
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6ca:	5b                   	pop    %ebx
 6cb:	5e                   	pop    %esi
 6cc:	5f                   	pop    %edi
 6cd:	5d                   	pop    %ebp
 6ce:	c3                   	ret    
 6cf:	90                   	nop

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6dc:	8b 15 c8 0a 00 00    	mov    0xac8,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e2:	8d 78 07             	lea    0x7(%eax),%edi
 6e5:	c1 ef 03             	shr    $0x3,%edi
 6e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6eb:	85 d2                	test   %edx,%edx
 6ed:	0f 84 a3 00 00 00    	je     796 <malloc+0xc6>
 6f3:	8b 02                	mov    (%edx),%eax
 6f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6f8:	39 cf                	cmp    %ecx,%edi
 6fa:	76 74                	jbe    770 <malloc+0xa0>
 6fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 702:	be 00 10 00 00       	mov    $0x1000,%esi
 707:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 70e:	0f 43 f7             	cmovae %edi,%esi
 711:	ba 00 80 00 00       	mov    $0x8000,%edx
 716:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 71c:	0f 46 da             	cmovbe %edx,%ebx
 71f:	eb 10                	jmp    731 <malloc+0x61>
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 72a:	8b 48 04             	mov    0x4(%eax),%ecx
 72d:	39 cf                	cmp    %ecx,%edi
 72f:	76 3f                	jbe    770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 731:	39 05 c8 0a 00 00    	cmp    %eax,0xac8
 737:	89 c2                	mov    %eax,%edx
 739:	75 ed                	jne    728 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 73b:	83 ec 0c             	sub    $0xc,%esp
 73e:	53                   	push   %ebx
 73f:	e8 66 fc ff ff       	call   3aa <sbrk>
  if(p == (char*)-1)
 744:	83 c4 10             	add    $0x10,%esp
 747:	83 f8 ff             	cmp    $0xffffffff,%eax
 74a:	74 1c                	je     768 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 74c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 74f:	83 ec 0c             	sub    $0xc,%esp
 752:	83 c0 08             	add    $0x8,%eax
 755:	50                   	push   %eax
 756:	e8 e5 fe ff ff       	call   640 <free>
  return freep;
 75b:	8b 15 c8 0a 00 00    	mov    0xac8,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 761:	83 c4 10             	add    $0x10,%esp
 764:	85 d2                	test   %edx,%edx
 766:	75 c0                	jne    728 <malloc+0x58>
        return 0;
 768:	31 c0                	xor    %eax,%eax
 76a:	eb 1c                	jmp    788 <malloc+0xb8>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 770:	39 cf                	cmp    %ecx,%edi
 772:	74 1c                	je     790 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 774:	29 f9                	sub    %edi,%ecx
 776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 77c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 77f:	89 15 c8 0a 00 00    	mov    %edx,0xac8
      return (void*)(p + 1);
 785:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 788:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb e9                	jmp    77f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 796:	c7 05 c8 0a 00 00 cc 	movl   $0xacc,0xac8
 79d:	0a 00 00 
 7a0:	c7 05 cc 0a 00 00 cc 	movl   $0xacc,0xacc
 7a7:	0a 00 00 
    base.s.size = 0;
 7aa:	b8 cc 0a 00 00       	mov    $0xacc,%eax
 7af:	c7 05 d0 0a 00 00 00 	movl   $0x0,0xad0
 7b6:	00 00 00 
 7b9:	e9 3e ff ff ff       	jmp    6fc <malloc+0x2c>
