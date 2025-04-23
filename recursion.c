#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

extern uint32_t fib(uint32_t n);
extern uint32_t pow2(uint32_t a, uint32_t b);

uint32_t GetUint(const char* arg)
{
	int32_t ni = atoi(arg);
	if (ni < 0)
	{
		printf("%s is not a natural number\n", arg);
		exit(1);
	}

	return (uint32_t)ni;
}

int main(int argc, char* argv[])
{
	if (argc < 3)
	{
		printf("usage: %s <a> <b>\n", argv[0]);
		exit(1);
	}

	uint32_t a = GetUint(argv[1]);
	uint32_t b = GetUint(argv[2]);
    uint32_t f = fib(a);
	uint32_t p = pow2(a, b);

	printf("F(%u) = %u\n%u^%u = %u\n", a, f, a, b, p);
}
