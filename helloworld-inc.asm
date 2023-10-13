; hello world program (external file include)
; helloworld-inc.asm

%include	'functions.asm'		; include our external file

SECTION .data
msg1	db	'Hello, brave new world!', 0Ah
msg2	db	'This is how we recycle in NASM.', 0AH

SECTION .text
global	_start

_start:
	mov	eax, msg1
	call	sprint

	mov	eax, msg2
	call	sprint

	call 	quit

; ERROR - message is outputted twice