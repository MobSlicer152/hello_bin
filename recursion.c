#include <stdint.h>
#include <stdio.h>

extern uint32_t fib(uint32_t n);

int main(int argc, char* argv[])
{
    uint32_t x = fib(6);
}
