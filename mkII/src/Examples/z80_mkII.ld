OUTPUT_FORMAT("coff-z80");
OUTPUT_ARCH("z80");
/* ENTRY(start); */
MEMORY
{
    ram (wx) : ORIGIN = 0x0000, LENGTH = 32K
}

SECTIONS
{
.isr :	{
	 __Labs = .;
	*(.isr)
	*(isr)
	 __Habs = .;
	}
.text :	{
	 __Ltext = .;
	*(.text)
	*(text)
	 __Htext = .;
	}
.data :	{
	 __Ldata = .;
	*(.data)
	*(data)
	 __Hdata = .;
	}
.bss :	{
	 __Lbss = .;
	*(.bss)
	*(bss)
	 __Hbss = .;
	}
}
