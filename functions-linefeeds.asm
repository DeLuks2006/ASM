;----------------------------------
; int slen (string message)

slen:
	push	ebx
	mov 	ebx, eax

nextchar:
	cmp 	byte [eax], 0
	jz  	finished
	inc 	eax
	jmp 	nextchar

finished:
	sub 	eax, ebx
	pop 	ebx
	ret

;----------------------------------
; void sprint (string message)

sprint:
	push	edx
	push	ecx
	push	ebx
	push	eax      ; pushes all values to the stack so we can preserve them
	call	slen     ; calculate the string length - return in EAX
	
	mov	edx, eax     ; mov value from eax to edx
	pop  	eax          ; get old eax value back
	
	mov 	ecx, eax     ; move message from eax to ecx
	mov 	ebx, 1       ; call to stdout
	mov 	eax, 4       ; sys_write
	int 	80h
	
	pop 	ebx
	pop 	ecx
	pop 	edx          ; get all old values back
	ret

;----------------------------------
; WARNING NEW & CHANGED CODE
; void sprintLF(String message)
; String printing with line feed function

sprintLF:
	call	sprint
	
	push	eax		; push eax onto the stack to preserver it while we use eax in this function
	mov	eax, 0Ah	; mov 0Ah into eax
	push	eax		; push the linefeed onto the stack so we can get the address
	mov	eax, esp	; mov the address of the current SP into eax for sprint
	call	sprint		; call sprint
	pop	eax		; remove linefeed character from stack
	pop	eax		; restore the original value of eax before our function was called
	ret

;----------------------------------
; void exit()

quit:
	mov	ebx, 0
	mov	eax, 1
	int	80h
	ret
