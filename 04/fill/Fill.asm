// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//R0 = counter
//R1 = White (0) or Black (1)
//R2 = Bitwise Fill Color
(MAIN)
	@KBD
	D=M
	@R1
	D=D-M
	@KEYBOARD_UP
	D;JLT
	@KEYBOARD_DOWN
	D;JGT
	@MAIN
	0;JMP	

(KEYBOARD_DOWN)
	@R0
	M=0
	@R1
	M=1
	@R2
	M=-1
	@COLOR
	0;JEQ
	
(KEYBOARD_UP)
	@R0
	M=0
	@R1
	M=0
	@R2
	M=0
	@COLOR
	0;JEQ
	
(COLOR)
	@R0
	D=M
	@8192 //Screen size
	D=D-A
	@MAIN //Check loop
	D;JEQ
	@R0
	D=M
	@SCREEN 
	D=A+D
	@R3
	M=D
	@R2
	D=M
	@R3
	A=M
	M=D
	@R0
	M=M+1
	@COLOR
	0;JMP