OUTPUT_FORMAT(elf32-i386)
ENTRY(_start)

MEMORY {
	TEXT (rx) : ORIGIN = 0x4000000, LENGTH = 0x100
}

SECTIONS {
	. = 0x4000000;

	.text : {
		_start = .;
		*(.text)
	} > TEXT
}
