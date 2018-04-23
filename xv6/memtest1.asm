
_memtest1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
	bar(y-1);
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
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
	printf(1, "\nInitial\n");	
  11:	68 8a 07 00 00       	push   $0x78a
  16:	6a 01                	push   $0x1
  18:	e8 43 04 00 00       	call   460 <printf>
	myMemory();
  1d:	e8 88 03 00 00       	call   3aa <myMemory>
	bar(9); 
  22:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  29:	e8 12 00 00 00       	call   40 <bar>
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

00000040 <bar>:

#include "types.h"
#include "syscall.h"
#include "user.h"

int bar(int y){
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  44:	83 ec 08             	sub    $0x8,%esp
  47:	8b 5d 08             	mov    0x8(%ebp),%ebx
	int x[64*1024*4096]; // static allocations
	x[0]=1;
	x[64*1024*4095+25]=0;
	printf(1, "\nBar: %d\n", y);
  4a:	53                   	push   %ebx
  4b:	68 80 07 00 00       	push   $0x780
  50:	6a 01                	push   $0x1
  52:	e8 09 04 00 00       	call   460 <printf>
	myMemory();	//no changes in number of pages used
  57:	e8 4e 03 00 00       	call   3aa <myMemory>
	if(y==0){return x[0];}
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	85 db                	test   %ebx,%ebx
  61:	74 0f                	je     72 <bar+0x32>
	bar(y-1);
  63:	83 ec 0c             	sub    $0xc,%esp
  66:	83 eb 01             	sub    $0x1,%ebx
  69:	53                   	push   %ebx
  6a:	e8 d1 ff ff ff       	call   40 <bar>
	return x[0];
  6f:	83 c4 10             	add    $0x10,%esp
}
  72:	b8 01 00 00 00       	mov    $0x1,%eax
  77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  7a:	c9                   	leave  
  7b:	c3                   	ret    
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 45 08             	mov    0x8(%ebp),%eax
  87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcat>:

char*
strcat(char *s, char *t)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 45 08             	mov    0x8(%ebp),%eax
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while(*s++ != '\0');
  ba:	89 c2                	mov    %eax,%edx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c0:	83 c2 01             	add    $0x1,%edx
  c3:	80 7a ff 00          	cmpb   $0x0,-0x1(%edx)
  c7:	75 f7                	jne    c0 <strcat+0x10>
  c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	83 c1 01             	add    $0x1,%ecx
  d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  d7:	83 c2 01             	add    $0x1,%edx
  da:	84 db                	test   %bl,%bl
  dc:	88 5a ff             	mov    %bl,-0x1(%edx)
  df:	75 ef                	jne    d0 <strcat+0x20>
    ;
  return os;
}
  e1:	5b                   	pop    %ebx
  e2:	5d                   	pop    %ebp
  e3:	c3                   	ret    
  e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	56                   	push   %esi
  f4:	53                   	push   %ebx
  f5:	8b 55 08             	mov    0x8(%ebp),%edx
  f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fb:	0f b6 02             	movzbl (%edx),%eax
  fe:	0f b6 19             	movzbl (%ecx),%ebx
 101:	84 c0                	test   %al,%al
 103:	75 1e                	jne    123 <strcmp+0x33>
 105:	eb 29                	jmp    130 <strcmp+0x40>
 107:	89 f6                	mov    %esi,%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 110:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 113:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 116:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 119:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 11d:	84 c0                	test   %al,%al
 11f:	74 0f                	je     130 <strcmp+0x40>
 121:	89 f1                	mov    %esi,%ecx
 123:	38 d8                	cmp    %bl,%al
 125:	74 e9                	je     110 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 127:	29 d8                	sub    %ebx,%eax
}
 129:	5b                   	pop    %ebx
 12a:	5e                   	pop    %esi
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 130:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 132:	29 d8                	sub    %ebx,%eax
}
 134:	5b                   	pop    %ebx
 135:	5e                   	pop    %esi
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    
 138:	90                   	nop
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strlen>:

uint
strlen(char *s)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 146:	80 39 00             	cmpb   $0x0,(%ecx)
 149:	74 12                	je     15d <strlen+0x1d>
 14b:	31 d2                	xor    %edx,%edx
 14d:	8d 76 00             	lea    0x0(%esi),%esi
 150:	83 c2 01             	add    $0x1,%edx
 153:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 157:	89 d0                	mov    %edx,%eax
 159:	75 f5                	jne    150 <strlen+0x10>
    ;
  return n;
}
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 15d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret    
 161:	eb 0d                	jmp    170 <memset>
 163:	90                   	nop
 164:	90                   	nop
 165:	90                   	nop
 166:	90                   	nop
 167:	90                   	nop
 168:	90                   	nop
 169:	90                   	nop
 16a:	90                   	nop
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	89 d7                	mov    %edx,%edi
 17f:	fc                   	cld    
 180:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 182:	89 d0                	mov    %edx,%eax
 184:	5f                   	pop    %edi
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	89 f6                	mov    %esi,%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 19a:	0f b6 10             	movzbl (%eax),%edx
 19d:	84 d2                	test   %dl,%dl
 19f:	74 1d                	je     1be <strchr+0x2e>
    if(*s == c)
 1a1:	38 d3                	cmp    %dl,%bl
 1a3:	89 d9                	mov    %ebx,%ecx
 1a5:	75 0d                	jne    1b4 <strchr+0x24>
 1a7:	eb 17                	jmp    1c0 <strchr+0x30>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b0:	38 ca                	cmp    %cl,%dl
 1b2:	74 0c                	je     1c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1b4:	83 c0 01             	add    $0x1,%eax
 1b7:	0f b6 10             	movzbl (%eax),%edx
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1be:	31 c0                	xor    %eax,%eax
}
 1c0:	5b                   	pop    %ebx
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
 1d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 1d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 1db:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1de:	eb 29                	jmp    209 <gets+0x39>
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	6a 01                	push   $0x1
 1e5:	57                   	push   %edi
 1e6:	6a 00                	push   $0x0
 1e8:	e8 2d 01 00 00       	call   31a <read>
    if(cc < 1)
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	85 c0                	test   %eax,%eax
 1f2:	7e 1d                	jle    211 <gets+0x41>
      break;
    buf[i++] = c;
 1f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1f8:	8b 55 08             	mov    0x8(%ebp),%edx
 1fb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 1fd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 203:	74 1b                	je     220 <gets+0x50>
 205:	3c 0d                	cmp    $0xd,%al
 207:	74 17                	je     220 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 209:	8d 5e 01             	lea    0x1(%esi),%ebx
 20c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20f:	7c cf                	jl     1e0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 218:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21b:	5b                   	pop    %ebx
 21c:	5e                   	pop    %esi
 21d:	5f                   	pop    %edi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 220:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 223:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 225:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 229:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	eb 0d                	jmp    240 <stat>
 233:	90                   	nop
 234:	90                   	nop
 235:	90                   	nop
 236:	90                   	nop
 237:	90                   	nop
 238:	90                   	nop
 239:	90                   	nop
 23a:	90                   	nop
 23b:	90                   	nop
 23c:	90                   	nop
 23d:	90                   	nop
 23e:	90                   	nop
 23f:	90                   	nop

00000240 <stat>:

int
stat(char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	56                   	push   %esi
 244:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 245:	83 ec 08             	sub    $0x8,%esp
 248:	6a 00                	push   $0x0
 24a:	ff 75 08             	pushl  0x8(%ebp)
 24d:	e8 f0 00 00 00       	call   342 <open>
  if(fd < 0)
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	78 27                	js     280 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 259:	83 ec 08             	sub    $0x8,%esp
 25c:	ff 75 0c             	pushl  0xc(%ebp)
 25f:	89 c3                	mov    %eax,%ebx
 261:	50                   	push   %eax
 262:	e8 f3 00 00 00       	call   35a <fstat>
 267:	89 c6                	mov    %eax,%esi
  close(fd);
 269:	89 1c 24             	mov    %ebx,(%esp)
 26c:	e8 b9 00 00 00       	call   32a <close>
  return r;
 271:	83 c4 10             	add    $0x10,%esp
 274:	89 f0                	mov    %esi,%eax
}
 276:	8d 65 f8             	lea    -0x8(%ebp),%esp
 279:	5b                   	pop    %ebx
 27a:	5e                   	pop    %esi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 280:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 285:	eb ef                	jmp    276 <stat+0x36>
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	53                   	push   %ebx
 294:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 297:	0f be 11             	movsbl (%ecx),%edx
 29a:	8d 42 d0             	lea    -0x30(%edx),%eax
 29d:	3c 09                	cmp    $0x9,%al
 29f:	b8 00 00 00 00       	mov    $0x0,%eax
 2a4:	77 1f                	ja     2c5 <atoi+0x35>
 2a6:	8d 76 00             	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2b3:	83 c1 01             	add    $0x1,%ecx
 2b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ba:	0f be 11             	movsbl (%ecx),%edx
 2bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2c0:	80 fb 09             	cmp    $0x9,%bl
 2c3:	76 eb                	jbe    2b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2c5:	5b                   	pop    %ebx
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	90                   	nop
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 db                	test   %ebx,%ebx
 2e0:	7e 14                	jle    2f6 <memmove+0x26>
 2e2:	31 d2                	xor    %edx,%edx
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f2:	39 da                	cmp    %ebx,%edx
 2f4:	75 f2                	jne    2e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fa:	b8 01 00 00 00       	mov    $0x1,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <exit>:
SYSCALL(exit)
 302:	b8 02 00 00 00       	mov    $0x2,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <wait>:
SYSCALL(wait)
 30a:	b8 03 00 00 00       	mov    $0x3,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <pipe>:
SYSCALL(pipe)
 312:	b8 04 00 00 00       	mov    $0x4,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <read>:
SYSCALL(read)
 31a:	b8 05 00 00 00       	mov    $0x5,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <write>:
SYSCALL(write)
 322:	b8 10 00 00 00       	mov    $0x10,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <close>:
SYSCALL(close)
 32a:	b8 15 00 00 00       	mov    $0x15,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <kill>:
SYSCALL(kill)
 332:	b8 06 00 00 00       	mov    $0x6,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <exec>:
SYSCALL(exec)
 33a:	b8 07 00 00 00       	mov    $0x7,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <open>:
SYSCALL(open)
 342:	b8 0f 00 00 00       	mov    $0xf,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <mknod>:
SYSCALL(mknod)
 34a:	b8 11 00 00 00       	mov    $0x11,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <unlink>:
SYSCALL(unlink)
 352:	b8 12 00 00 00       	mov    $0x12,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <fstat>:
SYSCALL(fstat)
 35a:	b8 08 00 00 00       	mov    $0x8,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <link>:
SYSCALL(link)
 362:	b8 13 00 00 00       	mov    $0x13,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mkdir>:
SYSCALL(mkdir)
 36a:	b8 14 00 00 00       	mov    $0x14,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <chdir>:
SYSCALL(chdir)
 372:	b8 09 00 00 00       	mov    $0x9,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <dup>:
SYSCALL(dup)
 37a:	b8 0a 00 00 00       	mov    $0xa,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <getpid>:
SYSCALL(getpid)
 382:	b8 0b 00 00 00       	mov    $0xb,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <sbrk>:
SYSCALL(sbrk)
 38a:	b8 0c 00 00 00       	mov    $0xc,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <sleep>:
SYSCALL(sleep)
 392:	b8 0d 00 00 00       	mov    $0xd,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <uptime>:
SYSCALL(uptime)
 39a:	b8 0e 00 00 00       	mov    $0xe,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getcallcount>:
SYSCALL(getcallcount)
 3a2:	b8 16 00 00 00       	mov    $0x16,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <myMemory>:
SYSCALL(myMemory)
 3aa:	b8 17 00 00 00       	mov    $0x17,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    
 3b2:	66 90                	xchg   %ax,%ax
 3b4:	66 90                	xchg   %ax,%ax
 3b6:	66 90                	xchg   %ax,%ax
 3b8:	66 90                	xchg   %ax,%ax
 3ba:	66 90                	xchg   %ax,%ax
 3bc:	66 90                	xchg   %ax,%ax
 3be:	66 90                	xchg   %ax,%ax

000003c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	89 c6                	mov    %eax,%esi
 3c8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3ce:	85 db                	test   %ebx,%ebx
 3d0:	74 7e                	je     450 <printint+0x90>
 3d2:	89 d0                	mov    %edx,%eax
 3d4:	c1 e8 1f             	shr    $0x1f,%eax
 3d7:	84 c0                	test   %al,%al
 3d9:	74 75                	je     450 <printint+0x90>
    neg = 1;
    x = -xx;
 3db:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3dd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 3e4:	f7 d8                	neg    %eax
 3e6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3e9:	31 ff                	xor    %edi,%edi
 3eb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3ee:	89 ce                	mov    %ecx,%esi
 3f0:	eb 08                	jmp    3fa <printint+0x3a>
 3f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3f8:	89 cf                	mov    %ecx,%edi
 3fa:	31 d2                	xor    %edx,%edx
 3fc:	8d 4f 01             	lea    0x1(%edi),%ecx
 3ff:	f7 f6                	div    %esi
 401:	0f b6 92 9c 07 00 00 	movzbl 0x79c(%edx),%edx
  }while((x /= base) != 0);
 408:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 40a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 40d:	75 e9                	jne    3f8 <printint+0x38>
  if(neg)
 40f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 412:	8b 75 c0             	mov    -0x40(%ebp),%esi
 415:	85 c0                	test   %eax,%eax
 417:	74 08                	je     421 <printint+0x61>
    buf[i++] = '-';
 419:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 41e:	8d 4f 02             	lea    0x2(%edi),%ecx
 421:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 425:	8d 76 00             	lea    0x0(%esi),%esi
 428:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 42b:	83 ec 04             	sub    $0x4,%esp
 42e:	83 ef 01             	sub    $0x1,%edi
 431:	6a 01                	push   $0x1
 433:	53                   	push   %ebx
 434:	56                   	push   %esi
 435:	88 45 d7             	mov    %al,-0x29(%ebp)
 438:	e8 e5 fe ff ff       	call   322 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 43d:	83 c4 10             	add    $0x10,%esp
 440:	39 df                	cmp    %ebx,%edi
 442:	75 e4                	jne    428 <printint+0x68>
    putc(fd, buf[i]);
}
 444:	8d 65 f4             	lea    -0xc(%ebp),%esp
 447:	5b                   	pop    %ebx
 448:	5e                   	pop    %esi
 449:	5f                   	pop    %edi
 44a:	5d                   	pop    %ebp
 44b:	c3                   	ret    
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 450:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 452:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 459:	eb 8b                	jmp    3e6 <printint+0x26>
 45b:	90                   	nop
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 466:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 469:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 46c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 46f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 472:	89 45 d0             	mov    %eax,-0x30(%ebp)
 475:	0f b6 1e             	movzbl (%esi),%ebx
 478:	83 c6 01             	add    $0x1,%esi
 47b:	84 db                	test   %bl,%bl
 47d:	0f 84 b0 00 00 00    	je     533 <printf+0xd3>
 483:	31 d2                	xor    %edx,%edx
 485:	eb 39                	jmp    4c0 <printf+0x60>
 487:	89 f6                	mov    %esi,%esi
 489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 490:	83 f8 25             	cmp    $0x25,%eax
 493:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 496:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 49b:	74 18                	je     4b5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 49d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4a0:	83 ec 04             	sub    $0x4,%esp
 4a3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4a6:	6a 01                	push   $0x1
 4a8:	50                   	push   %eax
 4a9:	57                   	push   %edi
 4aa:	e8 73 fe ff ff       	call   322 <write>
 4af:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4b2:	83 c4 10             	add    $0x10,%esp
 4b5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4bc:	84 db                	test   %bl,%bl
 4be:	74 73                	je     533 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 4c0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4c2:	0f be cb             	movsbl %bl,%ecx
 4c5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4c8:	74 c6                	je     490 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4ca:	83 fa 25             	cmp    $0x25,%edx
 4cd:	75 e6                	jne    4b5 <printf+0x55>
      if(c == 'd'){
 4cf:	83 f8 64             	cmp    $0x64,%eax
 4d2:	0f 84 f8 00 00 00    	je     5d0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4d8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4de:	83 f9 70             	cmp    $0x70,%ecx
 4e1:	74 5d                	je     540 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4e3:	83 f8 73             	cmp    $0x73,%eax
 4e6:	0f 84 84 00 00 00    	je     570 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4ec:	83 f8 63             	cmp    $0x63,%eax
 4ef:	0f 84 ea 00 00 00    	je     5df <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4f5:	83 f8 25             	cmp    $0x25,%eax
 4f8:	0f 84 c2 00 00 00    	je     5c0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 501:	83 ec 04             	sub    $0x4,%esp
 504:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 508:	6a 01                	push   $0x1
 50a:	50                   	push   %eax
 50b:	57                   	push   %edi
 50c:	e8 11 fe ff ff       	call   322 <write>
 511:	83 c4 0c             	add    $0xc,%esp
 514:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 517:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 51a:	6a 01                	push   $0x1
 51c:	50                   	push   %eax
 51d:	57                   	push   %edi
 51e:	83 c6 01             	add    $0x1,%esi
 521:	e8 fc fd ff ff       	call   322 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 526:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 52a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 52d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 52f:	84 db                	test   %bl,%bl
 531:	75 8d                	jne    4c0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 533:	8d 65 f4             	lea    -0xc(%ebp),%esp
 536:	5b                   	pop    %ebx
 537:	5e                   	pop    %esi
 538:	5f                   	pop    %edi
 539:	5d                   	pop    %ebp
 53a:	c3                   	ret    
 53b:	90                   	nop
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 10 00 00 00       	mov    $0x10,%ecx
 548:	6a 00                	push   $0x0
 54a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 54d:	89 f8                	mov    %edi,%eax
 54f:	8b 13                	mov    (%ebx),%edx
 551:	e8 6a fe ff ff       	call   3c0 <printint>
        ap++;
 556:	89 d8                	mov    %ebx,%eax
 558:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 55b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 55d:	83 c0 04             	add    $0x4,%eax
 560:	89 45 d0             	mov    %eax,-0x30(%ebp)
 563:	e9 4d ff ff ff       	jmp    4b5 <printf+0x55>
 568:	90                   	nop
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 570:	8b 45 d0             	mov    -0x30(%ebp),%eax
 573:	8b 18                	mov    (%eax),%ebx
        ap++;
 575:	83 c0 04             	add    $0x4,%eax
 578:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 57b:	b8 94 07 00 00       	mov    $0x794,%eax
 580:	85 db                	test   %ebx,%ebx
 582:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 585:	0f b6 03             	movzbl (%ebx),%eax
 588:	84 c0                	test   %al,%al
 58a:	74 23                	je     5af <printf+0x14f>
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 590:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 593:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 596:	83 ec 04             	sub    $0x4,%esp
 599:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 59b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 59e:	50                   	push   %eax
 59f:	57                   	push   %edi
 5a0:	e8 7d fd ff ff       	call   322 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5a5:	0f b6 03             	movzbl (%ebx),%eax
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	84 c0                	test   %al,%al
 5ad:	75 e1                	jne    590 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5af:	31 d2                	xor    %edx,%edx
 5b1:	e9 ff fe ff ff       	jmp    4b5 <printf+0x55>
 5b6:	8d 76 00             	lea    0x0(%esi),%esi
 5b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5c6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5c9:	6a 01                	push   $0x1
 5cb:	e9 4c ff ff ff       	jmp    51c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d8:	6a 01                	push   $0x1
 5da:	e9 6b ff ff ff       	jmp    54a <printf+0xea>
 5df:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5e2:	83 ec 04             	sub    $0x4,%esp
 5e5:	8b 03                	mov    (%ebx),%eax
 5e7:	6a 01                	push   $0x1
 5e9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5ec:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5ef:	50                   	push   %eax
 5f0:	57                   	push   %edi
 5f1:	e8 2c fd ff ff       	call   322 <write>
 5f6:	e9 5b ff ff ff       	jmp    556 <printf+0xf6>
 5fb:	66 90                	xchg   %ax,%ax
 5fd:	66 90                	xchg   %ax,%ax
 5ff:	90                   	nop

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 84 0a 00 00       	mov    0xa84,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 610:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 613:	39 c8                	cmp    %ecx,%eax
 615:	73 19                	jae    630 <free+0x30>
 617:	89 f6                	mov    %esi,%esi
 619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 620:	39 d1                	cmp    %edx,%ecx
 622:	72 1c                	jb     640 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 624:	39 d0                	cmp    %edx,%eax
 626:	73 18                	jae    640 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 628:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62e:	72 f0                	jb     620 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 630:	39 d0                	cmp    %edx,%eax
 632:	72 f4                	jb     628 <free+0x28>
 634:	39 d1                	cmp    %edx,%ecx
 636:	73 f0                	jae    628 <free+0x28>
 638:	90                   	nop
 639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 640:	8b 73 fc             	mov    -0x4(%ebx),%esi
 643:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 646:	39 d7                	cmp    %edx,%edi
 648:	74 19                	je     663 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 64a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 64d:	8b 50 04             	mov    0x4(%eax),%edx
 650:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 653:	39 f1                	cmp    %esi,%ecx
 655:	74 23                	je     67a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 657:	89 08                	mov    %ecx,(%eax)
  freep = p;
 659:	a3 84 0a 00 00       	mov    %eax,0xa84
}
 65e:	5b                   	pop    %ebx
 65f:	5e                   	pop    %esi
 660:	5f                   	pop    %edi
 661:	5d                   	pop    %ebp
 662:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 663:	03 72 04             	add    0x4(%edx),%esi
 666:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 669:	8b 10                	mov    (%eax),%edx
 66b:	8b 12                	mov    (%edx),%edx
 66d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 670:	8b 50 04             	mov    0x4(%eax),%edx
 673:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 676:	39 f1                	cmp    %esi,%ecx
 678:	75 dd                	jne    657 <free+0x57>
    p->s.size += bp->s.size;
 67a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 67d:	a3 84 0a 00 00       	mov    %eax,0xa84
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 682:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 685:	8b 53 f8             	mov    -0x8(%ebx),%edx
 688:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 68a:	5b                   	pop    %ebx
 68b:	5e                   	pop    %esi
 68c:	5f                   	pop    %edi
 68d:	5d                   	pop    %ebp
 68e:	c3                   	ret    
 68f:	90                   	nop

00000690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 699:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 69c:	8b 15 84 0a 00 00    	mov    0xa84,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a2:	8d 78 07             	lea    0x7(%eax),%edi
 6a5:	c1 ef 03             	shr    $0x3,%edi
 6a8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 6ab:	85 d2                	test   %edx,%edx
 6ad:	0f 84 a3 00 00 00    	je     756 <malloc+0xc6>
 6b3:	8b 02                	mov    (%edx),%eax
 6b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6b8:	39 cf                	cmp    %ecx,%edi
 6ba:	76 74                	jbe    730 <malloc+0xa0>
 6bc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6c2:	be 00 10 00 00       	mov    $0x1000,%esi
 6c7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 6ce:	0f 43 f7             	cmovae %edi,%esi
 6d1:	ba 00 80 00 00       	mov    $0x8000,%edx
 6d6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 6dc:	0f 46 da             	cmovbe %edx,%ebx
 6df:	eb 10                	jmp    6f1 <malloc+0x61>
 6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6ea:	8b 48 04             	mov    0x4(%eax),%ecx
 6ed:	39 cf                	cmp    %ecx,%edi
 6ef:	76 3f                	jbe    730 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6f1:	39 05 84 0a 00 00    	cmp    %eax,0xa84
 6f7:	89 c2                	mov    %eax,%edx
 6f9:	75 ed                	jne    6e8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6fb:	83 ec 0c             	sub    $0xc,%esp
 6fe:	53                   	push   %ebx
 6ff:	e8 86 fc ff ff       	call   38a <sbrk>
  if(p == (char*)-1)
 704:	83 c4 10             	add    $0x10,%esp
 707:	83 f8 ff             	cmp    $0xffffffff,%eax
 70a:	74 1c                	je     728 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 70c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 70f:	83 ec 0c             	sub    $0xc,%esp
 712:	83 c0 08             	add    $0x8,%eax
 715:	50                   	push   %eax
 716:	e8 e5 fe ff ff       	call   600 <free>
  return freep;
 71b:	8b 15 84 0a 00 00    	mov    0xa84,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 721:	83 c4 10             	add    $0x10,%esp
 724:	85 d2                	test   %edx,%edx
 726:	75 c0                	jne    6e8 <malloc+0x58>
        return 0;
 728:	31 c0                	xor    %eax,%eax
 72a:	eb 1c                	jmp    748 <malloc+0xb8>
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 730:	39 cf                	cmp    %ecx,%edi
 732:	74 1c                	je     750 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 734:	29 f9                	sub    %edi,%ecx
 736:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 739:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 73c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 73f:	89 15 84 0a 00 00    	mov    %edx,0xa84
      return (void*)(p + 1);
 745:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 748:	8d 65 f4             	lea    -0xc(%ebp),%esp
 74b:	5b                   	pop    %ebx
 74c:	5e                   	pop    %esi
 74d:	5f                   	pop    %edi
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 750:	8b 08                	mov    (%eax),%ecx
 752:	89 0a                	mov    %ecx,(%edx)
 754:	eb e9                	jmp    73f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 756:	c7 05 84 0a 00 00 88 	movl   $0xa88,0xa84
 75d:	0a 00 00 
 760:	c7 05 88 0a 00 00 88 	movl   $0xa88,0xa88
 767:	0a 00 00 
    base.s.size = 0;
 76a:	b8 88 0a 00 00       	mov    $0xa88,%eax
 76f:	c7 05 8c 0a 00 00 00 	movl   $0x0,0xa8c
 776:	00 00 00 
 779:	e9 3e ff ff ff       	jmp    6bc <malloc+0x2c>
