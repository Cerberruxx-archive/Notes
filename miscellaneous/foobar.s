	.file	"foobar.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%s%s\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	movl	$7303014, -4(%rbp)
	movl	$7496034, -8(%rbp)
	leaq	-8(%rbp), %rdx
	leaq	-4(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	printf
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
