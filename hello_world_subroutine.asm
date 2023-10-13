; Hello World Program (Subroutines)

SECTION .data
msg	db	"Hello, brave new world!", 0Ah

SECTION .text
global _start

_start:
	
	mov	eax, msg	; move the address of our message string into EAX
	call	strlen	; call our string length function

	mov	edx, eax	; our function leaves the result in EAX
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	80h

	mov	ebx, 0
	mov	eax, 1
	int	80h

strlen:				; this is our first function declaration
	push	ebx		; push the value in EBX on the stack to preserve it while EBX is used
	mov	ebx, eax	; move the address in EAX into EBX (EAX = EBX for now)

nextchar:			; same as lesson 3
	cmp	byte [eax], 0	; cmp the byte against string delimiter
	jz	finished	; jmp to finished if zero flag is true
	inc	eax		    ; increment eax
	jmp	nextchar	; jmp back to the start of function

finished:
	sub	eax, ebx	; subtract EBX from EAX to get the length
	pop	ebx		    ; pop the value on the stack back to EBX
	ret			    ; return to where the function was called.