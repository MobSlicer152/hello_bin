Basically, I wrote some programs in assembly and then manually assembled them. I use xxd to convert plaintext files into
binary, then add an ELF header around them using assembly stubs, and then link it all. xxd's parsing of hexdump-like
output seems to allow for adding comments where the ASCII representation would normally be, since only the hex numbers
and offsets are actually parsed, and anything after a pipe character is ignored.