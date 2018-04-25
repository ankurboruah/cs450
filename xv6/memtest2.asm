
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
  11:	68 a9 07 00 00       	push   $0x7a9
  16:	6a 01                	push   $0x1
  18:	e8 63 04 00 00       	call   480 <printf>
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
  50:	e8 5b 06 00 00       	call   6b0 <malloc>
  55:	89 c6                	mov    %eax,%esi
	printf(1, "\nFoo %d\n", 10-y);
  57:	b8 0a 00 00 00       	mov    $0xa,%eax
  5c:	83 c4 0c             	add    $0xc,%esp
  5f:	29 d8                	sub    %ebx,%eax
  61:	50                   	push   %eax
  62:	68 a0 07 00 00       	push   $0x7a0
  67:	6a 01                	push   $0x1
  69:	e8 12 04 00 00       	call   480 <printf>
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

000003d2 <fsop>:
SYSCALL(fsop)
 3d2:	b8 18 00 00 00       	mov    $0x18,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    
 3da:	66 90                	xchg   %ax,%ax
 3dc:	66 90                	xchg   %ax,%ax
 3de:	66 90                	xchg   %ax,%ax

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	89 c6                	mov    %eax,%esi
 3e8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3ee:	85 db                	test   %ebx,%ebx
 3f0:	74 7e                	je     470 <printint+0x90>
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	c1 e8 1f             	shr    $0x1f,%eax
 3f7:	84 c0                	test   %al,%al
 3f9:	74 75                	je     470 <printint+0x90>
    neg = 1;
    x = -xx;
 3fb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3fd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 404:	f7 d8                	neg    %eax
 406:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 409:	31 ff                	xor    %edi,%edi
 40b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 40e:	89 ce                	mov    %ecx,%esi
 410:	eb 08                	jmp    41a <printint+0x3a>
 412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 418:	89 cf                	mov    %ecx,%edi
 41a:	31 d2                	xor    %edx,%edx
 41c:	8d 4f 01             	lea    0x1(%edi),%ecx
 41f:	f7 f6                	div    %esi
 421:	0f b6 92 bc 07 00 00 	movzbl 0x7bc(%edx),%edx
  }while((x /= base) != 0);
 428:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 42a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 42d:	75 e9                	jne    418 <printint+0x38>
  if(neg)
 42f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 432:	8b 75 c0             	mov    -0x40(%ebp),%esi
 435:	85 c0                	test   %eax,%eax
 437:	74 08                	je     441 <printint+0x61>
    buf[i++] = '-';
 439:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 43e:	8d 4f 02             	lea    0x2(%edi),%ecx
 441:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 445:	8d 76 00             	lea    0x0(%esi),%esi
 448:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 44b:	83 ec 04             	sub    $0x4,%esp
 44e:	83 ef 01             	sub    $0x1,%edi
 451:	6a 01                	push   $0x1
 453:	53                   	push   %ebx
 454:	56                   	push   %esi
 455:	88 45 d7             	mov    %al,-0x29(%ebp)
 458:	e8 e5 fe ff ff       	call   342 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45d:	83 c4 10             	add    $0x10,%esp
 460:	39 df                	cmp    %ebx,%edi
 462:	75 e4                	jne    448 <printint+0x68>
    putc(fd, buf[i]);
}
 464:	8d 65 f4             	lea    -0xc(%ebp),%esp
 467:	5b                   	pop    %ebx
 468:	5e                   	pop    %esi
 469:	5f                   	pop    %edi
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 470:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 472:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 479:	eb 8b                	jmp    406 <printint+0x26>
 47b:	90                   	nop
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000480 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 486:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 489:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 48c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 48f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 492:	89 45 d0             	mov    %eax,-0x30(%ebp)
 495:	0f b6 1e             	movzbl (%esi),%ebx
 498:	83 c6 01             	add    $0x1,%esi
 49b:	84 db                	test   %bl,%bl
 49d:	0f 84 b0 00 00 00    	je     553 <printf+0xd3>
 4a3:	31 d2                	xor    %edx,%edx
 4a5:	eb 39                	jmp    4e0 <printf+0x60>
 4a7:	89 f6                	mov    %esi,%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4b0:	83 f8 25             	cmp    $0x25,%eax
 4b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4b6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4bb:	74 18                	je     4d5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4bd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4c0:	83 ec 04             	sub    $0x4,%esp
 4c3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4c6:	6a 01                	push   $0x1
 4c8:	50                   	push   %eax
 4c9:	57                   	push   %edi
 4ca:	e8 73 fe ff ff       	call   342 <write>
 4cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4d2:	83 c4 10             	add    $0x10,%esp
 4d5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4dc:	84 db                	test   %bl,%bl
 4de:	74 73                	je     553 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 4e0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4e2:	0f be cb             	movsbl %bl,%ecx
 4e5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4e8:	74 c6                	je     4b0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4ea:	83 fa 25             	cmp    $0x25,%edx
 4ed:	75 e6                	jne    4d5 <printf+0x55>
      if(c == 'd'){
 4ef:	83 f8 64             	cmp    $0x64,%eax
 4f2:	0f 84 f8 00 00 00    	je     5f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4f8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4fe:	83 f9 70             	cmp    $0x70,%ecx
 501:	74 5d                	je     560 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 503:	83 f8 73             	cmp    $0x73,%eax
 506:	0f 84 84 00 00 00    	je     590 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 50c:	83 f8 63             	cmp    $0x63,%eax
 50f:	0f 84 ea 00 00 00    	je     5ff <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 515:	83 f8 25             	cmp    $0x25,%eax
 518:	0f 84 c2 00 00 00    	je     5e0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 51e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 521:	83 ec 04             	sub    $0x4,%esp
 524:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 528:	6a 01                	push   $0x1
 52a:	50                   	push   %eax
 52b:	57                   	push   %edi
 52c:	e8 11 fe ff ff       	call   342 <write>
 531:	83 c4 0c             	add    $0xc,%esp
 534:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 537:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 53a:	6a 01                	push   $0x1
 53c:	50                   	push   %eax
 53d:	57                   	push   %edi
 53e:	83 c6 01             	add    $0x1,%esi
 541:	e8 fc fd ff ff       	call   342 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 546:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 54d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 54f:	84 db                	test   %bl,%bl
 551:	75 8d                	jne    4e0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 553:	8d 65 f4             	lea    -0xc(%ebp),%esp
 556:	5b                   	pop    %ebx
 557:	5e                   	pop    %esi
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret    
 55b:	90                   	nop
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 10 00 00 00       	mov    $0x10,%ecx
 568:	6a 00                	push   $0x0
 56a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 56d:	89 f8                	mov    %edi,%eax
 56f:	8b 13                	mov    (%ebx),%edx
 571:	e8 6a fe ff ff       	call   3e0 <printint>
        ap++;
 576:	89 d8                	mov    %ebx,%eax
 578:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 57d:	83 c0 04             	add    $0x4,%eax
 580:	89 45 d0             	mov    %eax,-0x30(%ebp)
 583:	e9 4d ff ff ff       	jmp    4d5 <printf+0x55>
 588:	90                   	nop
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 590:	8b 45 d0             	mov    -0x30(%ebp),%eax
 593:	8b 18                	mov    (%eax),%ebx
        ap++;
 595:	83 c0 04             	add    $0x4,%eax
 598:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 59b:	b8 b3 07 00 00       	mov    $0x7b3,%eax
 5a0:	85 db                	test   %ebx,%ebx
 5a2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 5a5:	0f b6 03             	movzbl (%ebx),%eax
 5a8:	84 c0                	test   %al,%al
 5aa:	74 23                	je     5cf <printf+0x14f>
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5b6:	83 ec 04             	sub    $0x4,%esp
 5b9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 5bb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5be:	50                   	push   %eax
 5bf:	57                   	push   %edi
 5c0:	e8 7d fd ff ff       	call   342 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5c5:	0f b6 03             	movzbl (%ebx),%eax
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	84 c0                	test   %al,%al
 5cd:	75 e1                	jne    5b0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5cf:	31 d2                	xor    %edx,%edx
 5d1:	e9 ff fe ff ff       	jmp    4d5 <printf+0x55>
 5d6:	8d 76 00             	lea    0x0(%esi),%esi
 5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5e0:	83 ec 04             	sub    $0x4,%esp
 5e3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5e9:	6a 01                	push   $0x1
 5eb:	e9 4c ff ff ff       	jmp    53c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f8:	6a 01                	push   $0x1
 5fa:	e9 6b ff ff ff       	jmp    56a <printf+0xea>
 5ff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 602:	83 ec 04             	sub    $0x4,%esp
 605:	8b 03                	mov    (%ebx),%eax
 607:	6a 01                	push   $0x1
 609:	88 45 e4             	mov    %al,-0x1c(%ebp)
 60c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 60f:	50                   	push   %eax
 610:	57                   	push   %edi
 611:	e8 2c fd ff ff       	call   342 <write>
 616:	e9 5b ff ff ff       	jmp    576 <printf+0xf6>
 61b:	66 90                	xchg   %ax,%ax
 61d:	66 90                	xchg   %ax,%ax
 61f:	90                   	nop

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 a8 0a 00 00       	mov    0xaa8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 630:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 633:	39 c8                	cmp    %ecx,%eax
 635:	73 19                	jae    650 <free+0x30>
 637:	89 f6                	mov    %esi,%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 640:	39 d1                	cmp    %edx,%ecx
 642:	72 1c                	jb     660 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	39 d0                	cmp    %edx,%eax
 646:	73 18                	jae    660 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 648:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64e:	72 f0                	jb     640 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 650:	39 d0                	cmp    %edx,%eax
 652:	72 f4                	jb     648 <free+0x28>
 654:	39 d1                	cmp    %edx,%ecx
 656:	73 f0                	jae    648 <free+0x28>
 658:	90                   	nop
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 660:	8b 73 fc             	mov    -0x4(%ebx),%esi
 663:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 666:	39 d7                	cmp    %edx,%edi
 668:	74 19                	je     683 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 66a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 66d:	8b 50 04             	mov    0x4(%eax),%edx
 670:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 673:	39 f1                	cmp    %esi,%ecx
 675:	74 23                	je     69a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 677:	89 08                	mov    %ecx,(%eax)
  freep = p;
 679:	a3 a8 0a 00 00       	mov    %eax,0xaa8
}
 67e:	5b                   	pop    %ebx
 67f:	5e                   	pop    %esi
 680:	5f                   	pop    %edi
 681:	5d                   	pop    %ebp
 682:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 683:	03 72 04             	add    0x4(%edx),%esi
 686:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 689:	8b 10                	mov    (%eax),%edx
 68b:	8b 12                	mov    (%edx),%edx
 68d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 690:	8b 50 04             	mov    0x4(%eax),%edx
 693:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 696:	39 f1                	cmp    %esi,%ecx
 698:	75 dd                	jne    677 <free+0x57>
    p->s.size += bp->s.size;
 69a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 69d:	a3 a8 0a 00 00       	mov    %eax,0xaa8
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6a2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6aa:	5b                   	pop    %ebx
 6ab:	5e                   	pop    %esi
 6ac:	5f                   	pop    %edi
 6ad:	5d                   	pop    %ebp
 6ae:	c3                   	ret    
 6af:	90                   	nop

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6bc:	8b 15 a8 0a 00 00    	mov    0xaa8,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c2:	8d 78 07             	lea    0x7(%eax),%edi
 6c5:	c1 ef 03             	shr    $0x3,%edi
 6c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6cb:	85 d2                	test   %edx,%edx
 6cd:	0f 84 a3 00 00 00    	je     776 <malloc+0xc6>
 6d3:	8b 02                	mov    (%edx),%eax
 6d5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6d8:	39 cf                	cmp    %ecx,%edi
 6da:	76 74                	jbe    750 <malloc+0xa0>
 6dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6e2:	be 00 10 00 00       	mov    $0x1000,%esi
 6e7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 6ee:	0f 43 f7             	cmovae %edi,%esi
 6f1:	ba 00 80 00 00       	mov    $0x8000,%edx
 6f6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 6fc:	0f 46 da             	cmovbe %edx,%ebx
 6ff:	eb 10                	jmp    711 <malloc+0x61>
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 708:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 70a:	8b 48 04             	mov    0x4(%eax),%ecx
 70d:	39 cf                	cmp    %ecx,%edi
 70f:	76 3f                	jbe    750 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 711:	39 05 a8 0a 00 00    	cmp    %eax,0xaa8
 717:	89 c2                	mov    %eax,%edx
 719:	75 ed                	jne    708 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 71b:	83 ec 0c             	sub    $0xc,%esp
 71e:	53                   	push   %ebx
 71f:	e8 86 fc ff ff       	call   3aa <sbrk>
  if(p == (char*)-1)
 724:	83 c4 10             	add    $0x10,%esp
 727:	83 f8 ff             	cmp    $0xffffffff,%eax
 72a:	74 1c                	je     748 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 72c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 72f:	83 ec 0c             	sub    $0xc,%esp
 732:	83 c0 08             	add    $0x8,%eax
 735:	50                   	push   %eax
 736:	e8 e5 fe ff ff       	call   620 <free>
  return freep;
 73b:	8b 15 a8 0a 00 00    	mov    0xaa8,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 741:	83 c4 10             	add    $0x10,%esp
 744:	85 d2                	test   %edx,%edx
 746:	75 c0                	jne    708 <malloc+0x58>
        return 0;
 748:	31 c0                	xor    %eax,%eax
 74a:	eb 1c                	jmp    768 <malloc+0xb8>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 750:	39 cf                	cmp    %ecx,%edi
 752:	74 1c                	je     770 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 754:	29 f9                	sub    %edi,%ecx
 756:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 759:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 75c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 75f:	89 15 a8 0a 00 00    	mov    %edx,0xaa8
      return (void*)(p + 1);
 765:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 768:	8d 65 f4             	lea    -0xc(%ebp),%esp
 76b:	5b                   	pop    %ebx
 76c:	5e                   	pop    %esi
 76d:	5f                   	pop    %edi
 76e:	5d                   	pop    %ebp
 76f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 770:	8b 08                	mov    (%eax),%ecx
 772:	89 0a                	mov    %ecx,(%edx)
 774:	eb e9                	jmp    75f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 776:	c7 05 a8 0a 00 00 ac 	movl   $0xaac,0xaa8
 77d:	0a 00 00 
 780:	c7 05 ac 0a 00 00 ac 	movl   $0xaac,0xaac
 787:	0a 00 00 
    base.s.size = 0;
 78a:	b8 ac 0a 00 00       	mov    $0xaac,%eax
 78f:	c7 05 b0 0a 00 00 00 	movl   $0x0,0xab0
 796:	00 00 00 
 799:	e9 3e ff ff ff       	jmp    6dc <malloc+0x2c>
