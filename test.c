#include <stdio.h>

__attribute__((section(".text"))) char add_code[] = {
    "\x55"         // push ebp
    "\x8b\xec"     // mov ebp, esp
    "\x8b\x45\x08" // mov eax, [ebp + 8]
    "\x8b\x4d\x0c" // mov ecx, [ebp + 12]
    "\x01\xc8"     // add eax, ecx
    "\xcc"         // int3
    "\x5d"         // pop ebp
    "\xc3"         // ret
};

int (*add)(int a, int b) = (int (*)(int, int))add_code;

int main(void)
{
    printf("%d\n", add(5, 10));
}
