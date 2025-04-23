BITS 32

SECTION .text

GLOBAL fib
; uint fib(uint n)
fib:
    ; stack frame
    push ebp
    mov ebp, esp

    mov ecx, [ebp + 8] ; ecx = n

    ; check base case
    cmp ecx, 1 ; if ecx == 1 goto one
    je .one
    cmp ecx, 0 ; if ecx <= 0 goto zero
    jle .zero

    ; recurse

    ; F(n - 1)
    dec ecx ; ecx--
    push ecx
    call fib
    pop ecx ; restore ecx (since this is recursion it's known that the on-stack one won't be changed)
    mov ebx, eax ; store the result to add to the other one

    ; F(n - 2)
    dec ecx ; ecx--
    push ebx
    push ecx
    call fib
    pop ecx
    pop ebx

    ; F(n - 1) + F(n - 2)
    add eax, ebx
    jmp .done

.one:
    mov eax, 1 ; return 1
    jmp .done
.zero:
    xor eax, eax ; return 0
    jmp .done

.done:
    pop ebp
    ret
