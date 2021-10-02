	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"1part.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Incorrect usage, please fix\000"
	.align	2
.LC1:
	.ascii	"Make sure there are 5 values\000"
	.align	2
.LC2:
	.ascii	"Should be either a 1 or a 0\000"
	.text
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	str	r0, [fp, #-48]	// argc
	str	r1, [fp, #-52]	// *argv[]
	ldr	r3, [fp, #-48] 	// load argc into r3
	cmp	r3, #6			// compair argc to 6
	beq	.L2				// if argc is equal to 6 jump to .l2
	ldr	r0, .L14
	bl	puts
	ldr	r0, .L14+4
	bl	puts
	mvn	r3, #0
	b	.L13			// exit code -1
.L2:					// create for loop
	mov	r3, #1			// r3 = i
	str	r3, [fp, #-16]	// fp, #-16 = i
	b	.L4
.L6:					
	ldr	r3, [fp, #-16]	// load i into r3
	lsl	r3, r3, #2		// logical shift left twice
	ldr	r2, [fp, #-52]	// take address of argv
	add	r3, r2, r3		// add r3 to address of argv (create offset)
	ldr	r2, [r3]		// put value of argv[i] into r2
	ldr	r3, [fp, #-16]	// place i into r3
	sub	r4, r3, #1		// i - 1
	mov	r0, r2
	bl	atoi			// call atoi
	mov	r2, r0
	lsl	r3, r4, #2
	sub	r1, fp, #12		// address of vals
	add	r3, r1, r3		// get offset of vals[i - 1]
	str	r2, [r3, #-28]	// place value from atoi into vals[i - 1]
	ldr	r3, [fp, #-16]	// place i into r3
	sub	r3, r3, #1		// i - 1
	lsl	r3, r3, #2		// create offset
	sub	r2, fp, #12		// address of vals
	add	r3, r2, r3		// address of vals[i - 1]
	ldr	r3, [r3, #-28]	// load vals[i - 1]
	cmp	r3, #0			// compare vals[i - 1] to 0
	beq	.L5				// if equal jump to .L5
	ldr	r3, [fp, #-16]	// same as above {
	sub	r3, r3, #1
	lsl	r3, r3, #2
	sub	r2, fp, #12
	add	r3, r2, r3
	ldr	r3, [r3, #-28]	// }
	cmp	r3, #1			// compare vals[i - 1] to 1
	beq	.L5				// if equal jump to .L5
	ldr	r0, .L14		// print error and exit program {
	bl	puts
	ldr	r0, .L14+8
	bl	puts
	mvn	r3, #0
	b	.L13			// }
.L5:
	ldr	r3, [fp, #-16]	// increment i {
	add	r3, r3, #1
	str	r3, [fp, #-16]	// }
.L4:
	ldr	r2, [fp, #-16]	// load i into r2
	ldr	r3, [fp, #-48]	// load argc into r3
	cmp	r2, r3			// compair i to argc
	blt	.L6				// While i is less than argc take jump to .L6
	ldr	r3, [fp, #-40]	// load vals[4]
	cmp	r3, #0			// compair vals[4] to 0
	beq	.L7				// if vals[4] == 0 jump to .L7
	ldr	r3, [fp, #-24]	// load vals[0]
	cmp	r3, #0			// compair to 0
	bne	.L8				// if vals[0] jump to .L8
.L7:
	ldr	r3, [fp, #-28]	// load vals[1]
	ldr	r2, [fp, #-32]	// load vals[2]
	cmp	r2, #0
	beq	.L9				// if vals[2] == 0 jump to .L9
	ldr	r2, [fp, #-36]	// load vals[3]
	cmp	r2, #0
	beq	.L9				// if vals[3] == 0 jump to .L9
	mov	r2, #1			// r2 = 1
	b	.L10			// jump to .L10
.L9:
	mov	r2, #0
.L10:
	cmp	r2, r3			// compare r2 to r3, r3 is vals[1]
	beq	.L11			// if r3 != r2 statement is true, otherwise take jump
.L8:					// .L8 is used when both vals[4] && vals[0] are true or above
	mov	r3, #1			// r3 is true
	b	.L12			// jump to .L12
.L11:
	mov	r3, #0			// r3 is false
.L12:					// current state if r3 is the output
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
.L13:
	mov	r0, r3			// r0 = output
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
