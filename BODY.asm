VERBOSE equ 0

// GameName gets defined as a command line argument when building

ROMfldr equ "rom\\ONCE\\"
OUTfldr equ "out\\"
ASMfldr equ "asm\\"

INPUT_ROM	equ ROMfldr + GameName + "rek" + ".gba"
OUTPUT_ROM	equ OUTfldr + "output_" + GameName + "rek" + ".gba"
ADDR_LIST	equ ASMfldr + GameName + "_addr.asm"

.open INPUT_ROM, OUTPUT_ROM, 0x8000000
.include ADDR_LIST

.macro symoff
	.if VERBOSE == 0 :: .sym off :: .endif
.endmacro

.macro poool
	.sym off
	.pool
	.sym on
.endmacro


.include ASMfldr+ "bbn6.asm"

.close