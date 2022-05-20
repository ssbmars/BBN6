VERBOSE equ 0

BN6F	equ 1
BN6G	equ 2
EXE6F	equ 3
EXE6G	equ 4

// GameName gets defined as a command line argument when building

// armips bbn6.asm -strequ GameName exe6f -equ AM_DEBUGGING 0 -sym out\output_exe6f.sym
// armips bbn6.asm -strequ GameName exe6g -equ AM_DEBUGGING 0 -sym out\output_exe6g.sym

ROMfldr equ "rom\\"
OUTfldr equ "out\\"
ASMfldr equ "asm\\"

INPUT_ROM	equ ROMfldr + GameName + ".gba"
OUTPUT_ROM	equ OUTfldr + "output_" + GameName + ".gba"
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