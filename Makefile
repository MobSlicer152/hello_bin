all: hello.bin hello.o hello.elf

clean:
	rm hello.bin hello.o hello.elf

hello.bin: hello.bin.xxd
	xxd -r $< $@

hello.o: hello.bin
	as --32 -o $@ $<.S

hello.elf: hello.o
	ld.lld -o $@ $< -T hello.ld

