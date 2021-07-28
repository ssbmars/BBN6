.gba




.ifdef		IS_BN6F
	.open "rom\bn6f.gba","rom\output_f.gba",0x8000000

.elseifdef	IS_BN6G
	.open "rom\bn6g.gba","rom\output_g.gba",0x8000000


.elseifdef	IS_EXE6F
.elseifdef	IS_EXE6G
.endif

.ifdef	AM_DEBUGGING
	.include "asm\debugging.asm"
.endif

.ifdef IS_ROLLBACK
	.include "asm\rollback.asm"
.endif


//	run all other asm files here 
//.include "asm\file.asm"






//  ============  //	Hooks and small edits

//	.org 0x08000000












//	Free Space

.org 0x0803D340

.area 0x0803DC30 - 0x0803D340, 0x0


/*

This defines a chunk of free space in the middle of the rom where I can place original code.
Each instruction one after another is just written to the next available byte in the free space.

Nothing that branches to any of this code uses hardcoded addresses, instead they're assigned to labels like " HiThisIsALabel: ". When you see a label like this with a colon right after it, it just broadcasted its address at whatever position it was written, so then other instructions can say something like "branch to HiThisIsALabel" and the compiler will know what that address is supposed to be.

*/




//  ============  //	new routines go here



















.endarea

.close