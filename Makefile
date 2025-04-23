all: hello.bin hello.o hello.elf recursion

clean:
	rm -f hello.bin hello.o hello.elf recursion.o fib.o fib.bin

%.bin: %.bin.xxd
	xxd -r $< $@

%.o: %.bin
	as --32 -o $@ $<.S

hello.elf: hello.o
	ld.lld -o $@ $< -T hello.ld

TARGET="--target=i686-pc-linux-gnu"

%.o: %.c
	clang $(TARGET) -g -c -o $@ $<

recursion: fib.o recursion.o
	clang $(TARGET) -fuse-ld=lld -o $@ $^
