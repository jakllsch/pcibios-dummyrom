
#define PCI_VID 0x0000
#define PCI_DID 0x0000
#define PCI_CLASS 0x00

	.text
	.code16
textstart:
	.word	0xaa55
	.byte	1
entry:
	lret

	. = 0x18
	.word	(pcidata - textstart)
pcidata:
	.ascii	"PCIR"
	.word	PCI_VID
	.word	PCI_DID
	.word	0			/* pointer to vital product data */
	.word	(pcidataend - pcidata)
	.long	(0 + (PCI_CLASS << 8))	/* class, revision */
	.word	1			/* no. of 512B blocks
	.word	0			/* revision */
	.byte	0			/* code type */
	.byte	0x80			/* "indicator" - last image */
	.word	0			/* reserved */
pcidataend:

	. = 511
checksum:
	.byte 0x100 - 0xaa
end:
