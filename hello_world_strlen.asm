; Hello World Program (Calculating string length)

SECTION .data
msg	db	'Hello, brave new world!', 0Ah	; we can modify this now without having to update anywhere else in the program

SECTION	.text
global	_start

_start:
	mov	ebx, msg	; move the address of our message string into EBX
	mov	eax, ebx	; move the address in EBX into EAX as well (Both now point to the same segment in memory)

nextchar:
	cmp	byte [eax], 0	; cmp the byte pointed to by EAX at this address against zero (zero is an end of string delimiter)
	jz	finished	; jump (if the ZF has been set) to the point in the code labeled 'finished'
	inc	eax		; inc the address in EAX by one byte (if the ZF has NOT been set)
	jmp	nextchar	; jump to the point in the code labeled 'nextchar'

finished:
	sub	eax, ebx	; subtract the address in EBX from the address in EAX
				; remember both registers startef pointing to the same 
				; address but EAX has been incremented one byte for each 
				; address from another of the same type. when you subtract
				; one memory address from another of the same type the
				; result is number of segments between them - in this case
				; bytes

	mov	edx, eax	; EAX now equals the number of bytes in our string
	mov	ecx, msg	; the rest of the code should be familiar by now
	mov	ebx, 1
	mov	eax, 4
	int	80h

	mov	ebx, 0
	mov	eax, 1
	int	80h
