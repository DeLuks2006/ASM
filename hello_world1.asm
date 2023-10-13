SECTION .data
msg	db	'Hello World!', 0Ah

SECTION .text
global _start

_start:

	mov	edx, 13 ; str length
	mov	ecx, msg; message to be printed
	mov	ebx, 1	; write to STDOUT (everything in UNIX is a file)
	mov	eax, 4  ; sys_write
	int	80h

	mov	ebx, 0	; return zero
	mov	eax, 1	; sys_exit
	int	80h
