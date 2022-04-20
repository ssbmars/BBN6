.gba

BN6F	equ 1
BN6G	equ 2
EXE6F	equ 3
EXE6G	equ 4

VERBOSE equ 0
.macro symoff
	.if VERBOSE == 0 :: .sym off :: .endif
.endmacro

.if VERSION == BN6F
	.open "rom\bn6f.gba","out\output_bn6f.gba",0x8000000
	.include "asm\bn6f_sym.asm"

.elseif VERSION == BN6G
	.open "rom\bn6g.gba","out\output_bn6g.gba",0x8000000
	.include "asm\bn6g_sym.asm"

.elseif VERSION == EXE6F
	.open "rom\exe6f.gba","out\output_exe6f.gba",0x8000000
	.include "asm\exe6f_sym.asm"

.elseif VERSION == EXE6G
	.open "rom\exe6g.gba","out\output_exe6g.gba",0x8000000
	.include "asm\exe6g_sym.asm"

.endif


.if	AM_DEBUGGING
	.include "asm\debugging.asm"
.endif

//	run all other asm files here 
//.include "asm\file.asm"



.macro poool
	.sym off
	.pool
	.sym on
.endmacro



//  ============  //	Hooks and small edits

//	.org 0x08000000


// windrack: delay the movement of the invisible gusts so that players will get moved by the gusts regardless of their entity update order if they're hit point blank while they are being protected by a barrier

	// point to a new table of routines for windrack's logic
	.org RedirectWindrack
		.dw WindrackJumpTable
	
// endrack

// BDT and Thunder: when the targeted character is on the same panel as the thunder ball, make the ball move in a relative "forward" direction instead of moving in a hardcoded direction that ignores which side spawned the thunder
	
	.org ThunderHook
	// the skipped bytes are a push r14 and an important routine, 
	// easier to leave those intact
	.skip 0x2*3
	ldr		r2,=ThunderMove|1
	bx		r2
	poool
	nop
	freedspace1:	// the remaining space is now unused, so it can be repurposed for holding new functions
// thunder doneder



//  ============  //	Freed up space (from repointing existing functions)


// this space is from the Thunder code
.org freedspace1
	.sym off :: .area 0x080C95E6 - 0x080C957C, 0x0	:: .sym on
	/*
	.definelabel func2, 0x08007004

	push	r4-r7,r14
	mov		r7,r0
	bl
	mov		r0,r7
	ldr		r5,=
	mov		r4,r0
	bl		
	bne		@@b2
	mov		r0,r4
	mov		r1,0ABh
	bl		
	ldr		r3,=
	ldrh	r1,[r3,2Ah]
	add		r0,r0,r1
	cmp		r0,50h
	bgt		@@b1
	strh	r0,[r3,2Ah]
	ldrb	r0,[r3]
	mov		r1,r0
	add		r1,1h
	strb	r1,[r3]
	mov		r1,r4
	bl		
	mov		r0,0h
	b		@@exit
	@@b2:
	mov		r0,2h
	b		@@exit
	@@b1:
	mov		r0,1h
	@@exit:
	pop		r4-r7,r15


	func1:
	push	r14
	sub		r1,r0,1h
	bl		func2
	pop		r15
	*/


	.sym off :: .endarea :: .sym on
// end of freedspace1



// End of ROM

.org 0x08801000

//  ============  //	new routines go here





// the entire function is taken directly from the game and pasted here so it can be modified more freely
ThunderMove:
	symoff
	// r0 has target x
	// r1 has target y
	// return address is already pushed to stack
		@@xpos	equ [r5,12h]
		@@ypos	equ [r5,13h]
		@@level	equ r2,[r5,4h]
		@@xdir	equ r0,[r5,40h]
		@@ydir	equ r0,[r5,44h]

	cmp		r0,0h
	bne		@@targetfound
	@@checkfacing:
	bl		tmGetFacing
	b		@@GoHorizontal
	@@targetfound:
	ldrb	r3,@@ypos	// y of self
	cmp		r1,r3
	beq		@@samey

	ldrb	r2,@@xpos	// x of self
	cmp		r0,r2
	beq		@@samex

	@@samey:
	ldrb	r2,@@xpos
	cmp		r0,r2
	blt		@@xflip
	// new check, is x equal?
	cmp		r0,r2
	bne		@@difx
	b		@@checkfacing

	@@difx:
	mov		r0,1h
	b		@@GoHorizontal

	@@xflip:
	mov		r0,0h
	sub		r0,1h
	b		@@GoHorizontal

	@@samex:
	ldrb	r2,@@ypos
	cmp		r1,r2
	blt		@@yflip
	mov		r0,1h
	b		@@GoVertical
	@@yflip:
	mov		r0,0h
	sub		r0,1h

	@@GoVertical:
	ldr		r1,=6666h	// normal vertical speed
	ldrb	@@level
	cmp		r2,2h
	bne		@@LVcheck3
	ldr		r1,=999Ah	// faster vertical speed
	@@LVcheck3:
	mul		r0,r1
	str		@@ydir
	mov		r0,0h
	str		@@xdir
	b		@@setmovetime

	@@GoHorizontal:
	ldr		r1,=0AAABh	// normal horizontal speed
	ldrb	@@level
	cmp		r2,2h
	bne		@@LVcheck1
	ldr		r1,=10000h	// faster horizontal speed
	@@LVcheck1:
	mul		r0,r1
	str		@@xdir
	mov		r0,0h
	str		@@ydir

	@@setmovetime:
	mov		r0,3Ch		// normal move time (yes they hardcoded this info)
	ldrb	@@level
	cmp		r2,2h
	bne		@@LVcheck2
	mov		r0,28h		// faster move time
	@@LVcheck2:
	strh	r0,[r5,20h]
	pop		r15
	.sym on

// this routine will allow us to flip the movement direction if it was used by a player on the right side of the field
tmGetFacing:
	ldrb	r0,[r5,16h]
	ldrb	r1,[r5,17h]
	eor		r0,r1
	lsl		r0,1h
	sub		r0,1h
	neg		r0,r0
	mov		r15,r14
	poool


.align 0x4
WindrackJumpTable:
	.dw WindRWaitStep|1
	.dw WindRStep2|1
	.dw DeleteSpell|1
	.dw WindRStep1|1


WindRWaitStep:
	// this just exists to stall the windrack gust logic for a frame before it starts moving
	push	r14
	// advance to next step
	mov		r0,0Ch
	str		r0,[r5,8h]

	pop		r15




//	Free Space in the middle of the rom
	//	(I don't actually know for certain that this space isn't used for something)
	//	(whenever possible, use expanded space at the end of the rom instead)
	
	.org 0x0803D340
	
	.area 0x0803DC30 - 0x0803D340, 0x0
	
	//  ============  //	new routines go here
	
	
	
	
	.endarea
// end of mid-rom freespace zone


.close