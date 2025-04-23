BITS 32

SECTION .text

GLOBAL _start
_start:
	; sys_write
	mov eax, 4
	mov ebx, 0
	lea ecx, msg
	mov edx, [msg_len]
	int 80h

	; sys_exit
	mov eax, 1
	xor ebx, ebx
	int 80h

SECTION .data
msg: db "Hello, world", 0ah, 00h
msg_len: dd $ - msg
