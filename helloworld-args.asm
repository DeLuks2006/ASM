; Hello World Program (passing arguments from the cmd)

%include	'functions.asm'

section .text
global	_start

_start:
	
	pop	ecx		; first value on the stack is the number of arguments

nextArg:
	cmp	ecx, 0h		; check if we have any args left
	jz	noMoreArgs	; if zf is set jmp to noMoreArgs label
	pop	eax		; pop the next argument off the stack
	call 	sprintLF	; call our print with linefeed function
	dec	ecx		; decrease ecx (no. of arguments left)
	jmp	nextArg		; jmp back to the top of function

noMoreArgs:
	call	quit 