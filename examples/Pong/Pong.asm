// boot
@256
D=A
@SP
M=D

// call Sys.init 0
@L_boot.0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(L_boot.0)
(L_boot.1)
@L_boot.1
0;JMP
// Ball

// function Ball.new 0
(Ball.new)

// push  15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Memory.alloc 1
@L_Ball.0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.alloc
0;JMP
(L_Ball.0)

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 10
@THIS
D=M
@10
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 3
@ARG
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 11
@THIS
D=M
@11
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 4
@ARG
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 12
@THIS
D=M
@12
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 5
@ARG
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 13
@THIS
D=M
@13
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.show 1
@L_Ball.1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.show
0;JMP
(L_Ball.1)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.dispose 0
(Ball.dispose)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Memory.deAlloc 1
@L_Ball.2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.deAlloc
0;JMP
(L_Ball.2)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.show 0
(Ball.show)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// call Screen.setColor 1
@L_Ball.3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Ball.3)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.draw 1
@L_Ball.4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.draw
0;JMP
(L_Ball.4)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.hide 0
(Ball.hide)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Screen.setColor 1
@L_Ball.5
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Ball.5)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.draw 1
@L_Ball.6
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.draw
0;JMP
(L_Ball.6)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.draw 0
(Ball.draw)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// call Screen.drawRectangle 4
@L_Ball.7
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.drawRectangle
0;JMP
(L_Ball.7)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.getLeft 0
(Ball.getLeft)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.getRight 0
(Ball.getRight)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.setDestination 3
(Ball.setDestination)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.abs 1
@L_Ball.8
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.abs
0;JMP
(L_Ball.8)

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.abs 1
@L_Ball.9
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.abs
0;JMP
(L_Ball.9)

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.10
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.11
0;JMP
(L_Ball.10)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.11)

// pop THIS 7
@THIS
D=M
@7
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE0
@SP
AM=M-1
D=M
@Ball$IF_FALSE0
D;JNE

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.12
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.13
0;JMP
(L_Ball.12)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.13)

// pop THIS 8
@THIS
D=M
@8
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.14
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.15
0;JMP
(L_Ball.14)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.15)

// pop THIS 9
@THIS
D=M
@9
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END0
@Ball$IF_END0
0;JMP

// label IF_FALSE0
(Ball$IF_FALSE0)

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.16
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.17
0;JMP
(L_Ball.16)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.17)

// pop THIS 8
@THIS
D=M
@8
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push ARG 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.18
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.19
0;JMP
(L_Ball.18)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.19)

// pop THIS 9
@THIS
D=M
@9
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END0
(Ball$IF_END0)

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.20
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.20)

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.21
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.21)

// pop THIS 5
@THIS
D=M
@5
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// call Math.multiply 2
@L_Ball.22
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.22)

// pop THIS 6
@THIS
D=M
@6
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.move 0
(Ball.move)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.hide 1
@L_Ball.23
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.hide
0;JMP
(L_Ball.23)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.24
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.25
0;JMP
(L_Ball.24)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.25)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE1
@SP
AM=M-1
D=M
@Ball$IF_FALSE1
D;JNE

// push THIS 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 5
@THIS
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END1
@Ball$IF_END1
0;JMP

// label IF_FALSE1
(Ball$IF_FALSE1)

// push THIS 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 9
@THIS
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE2
@SP
AM=M-1
D=M
@Ball$IF_FALSE2
D;JNE

// push THIS 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE3
@SP
AM=M-1
D=M
@Ball$IF_FALSE3
D;JNE

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END3
@Ball$IF_END3
0;JMP

// label IF_FALSE3
(Ball$IF_FALSE3)

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END3
(Ball$IF_END3)

// goto IF_END2
@Ball$IF_END2
0;JMP

// label IF_FALSE2
(Ball$IF_FALSE2)

// push THIS 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE4
@SP
AM=M-1
D=M
@Ball$IF_FALSE4
D;JNE

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END4
@Ball$IF_END4
0;JMP

// label IF_FALSE4
(Ball$IF_FALSE4)

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END4
(Ball$IF_END4)

// label IF_END2
(Ball$IF_END2)

// label IF_END1
(Ball$IF_END1)

// push THIS 8
@THIS
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE5
@SP
AM=M-1
D=M
@Ball$IF_FALSE5
D;JNE

// push THIS 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE6
@SP
AM=M-1
D=M
@Ball$IF_FALSE6
D;JNE

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END6
@Ball$IF_END6
0;JMP

// label IF_FALSE6
(Ball$IF_FALSE6)

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END6
(Ball$IF_END6)

// goto IF_END5
@Ball$IF_END5
0;JMP

// label IF_FALSE5
(Ball$IF_FALSE5)

// push THIS 7
@THIS
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE7
@SP
AM=M-1
D=M
@Ball$IF_FALSE7
D;JNE

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END7
@Ball$IF_END7
0;JMP

// label IF_FALSE7
(Ball$IF_FALSE7)

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END7
(Ball$IF_END7)

// label IF_END5
(Ball$IF_END5)

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 10
@THIS
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.26
D;JGT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.27
0;JMP
(L_Ball.26)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.27)

// not
@SP
A=M-1
M=!M

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE8
@SP
AM=M-1
D=M
@Ball$IF_FALSE8
D;JNE

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 10
@THIS
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END8
@Ball$IF_END8
0;JMP

// label IF_FALSE8
(Ball$IF_FALSE8)

// label IF_END8
(Ball$IF_END8)

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 11
@THIS
D=M
@11
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.28
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.29
0;JMP
(L_Ball.28)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.29)

// not
@SP
A=M-1
M=!M

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE9
@SP
AM=M-1
D=M
@Ball$IF_FALSE9
D;JNE

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 11
@THIS
D=M
@11
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END9
@Ball$IF_END9
0;JMP

// label IF_FALSE9
(Ball$IF_FALSE9)

// label IF_END9
(Ball$IF_END9)

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 12
@THIS
D=M
@12
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.30
D;JGT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.31
0;JMP
(L_Ball.30)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.31)

// not
@SP
A=M-1
M=!M

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE10
@SP
AM=M-1
D=M
@Ball$IF_FALSE10
D;JNE

// push  3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 12
@THIS
D=M
@12
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END10
@Ball$IF_END10
0;JMP

// label IF_FALSE10
(Ball$IF_FALSE10)

// label IF_END10
(Ball$IF_END10)

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 13
@THIS
D=M
@13
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.32
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.33
0;JMP
(L_Ball.32)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.33)

// not
@SP
A=M-1
M=!M

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE11
@SP
AM=M-1
D=M
@Ball$IF_FALSE11
D;JNE

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 14
@THIS
D=M
@14
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 13
@THIS
D=M
@13
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END11
@Ball$IF_END11
0;JMP

// label IF_FALSE11
(Ball$IF_FALSE11)

// label IF_END11
(Ball$IF_END11)

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.show 1
@L_Ball.34
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.show
0;JMP
(L_Ball.34)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 14
@THIS
D=M
@14
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Ball.bounce 5
(Ball.bounce)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Math.divide 2
@L_Ball.35
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.divide
0;JMP
(L_Ball.35)

// pop LCL 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Math.divide 2
@L_Ball.36
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.divide
0;JMP
(L_Ball.36)

// pop LCL 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.37
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.38
0;JMP
(L_Ball.37)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.38)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE12
@SP
AM=M-1
D=M
@Ball$IF_FALSE12
D;JNE

// push  10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END12
@Ball$IF_END12
0;JMP

// label IF_FALSE12
(Ball$IF_FALSE12)

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.39
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.40
0;JMP
(L_Ball.39)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.40)

// not
@SP
A=M-1
M=!M

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.41
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.42
0;JMP
(L_Ball.41)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.42)

// and
@SP
AM=M-1
D=M
@SP
A=M-1
M=D&M

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.43
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.44
0;JMP
(L_Ball.43)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.44)

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// neg
@SP
A=M-1
M=-M

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.45
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.46
0;JMP
(L_Ball.45)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.46)

// and
@SP
AM=M-1
D=M
@SP
A=M-1
M=D&M

// or
@SP
AM=M-1
D=M
@SP
A=M-1
M=D|M

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE13
@SP
AM=M-1
D=M
@Ball$IF_FALSE13
D;JNE

// push  20
@20
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END13
@Ball$IF_END13
0;JMP

// label IF_FALSE13
(Ball$IF_FALSE13)

// push  5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END13
(Ball$IF_END13)

// label IF_END12
(Ball$IF_END12)

// push THIS 14
@THIS
D=M
@14
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.47
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.48
0;JMP
(L_Ball.47)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.48)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE14
@SP
AM=M-1
D=M
@Ball$IF_FALSE14
D;JNE

// push  506
@506
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1

// neg
@SP
A=M-1
M=-M

// call Math.multiply 2
@L_Ball.49
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.49)

// push LCL 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.divide 2
@L_Ball.50
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.divide
0;JMP
(L_Ball.50)

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.51
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.51)

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END14
@Ball$IF_END14
0;JMP

// label IF_FALSE14
(Ball$IF_FALSE14)

// push THIS 14
@THIS
D=M
@14
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.52
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.53
0;JMP
(L_Ball.52)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.53)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE15
@SP
AM=M-1
D=M
@Ball$IF_FALSE15
D;JNE

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.54
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.54)

// push LCL 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.divide 2
@L_Ball.55
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.divide
0;JMP
(L_Ball.55)

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.56
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.56)

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END15
@Ball$IF_END15
0;JMP

// label IF_FALSE15
(Ball$IF_FALSE15)

// push THIS 14
@THIS
D=M
@14
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Ball.57
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Ball.58
0;JMP
(L_Ball.57)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Ball.58)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE16
@SP
AM=M-1
D=M
@Ball$IF_FALSE16
D;JNE

// push  250
@250
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1

// neg
@SP
A=M-1
M=-M

// call Math.multiply 2
@L_Ball.59
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.59)

// push LCL 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.divide 2
@L_Ball.60
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.divide
0;JMP
(L_Ball.60)

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.61
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.61)

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END16
@Ball$IF_END16
0;JMP

// label IF_FALSE16
(Ball$IF_FALSE16)

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.62
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.62)

// push LCL 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.divide 2
@L_Ball.63
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.divide
0;JMP
(L_Ball.63)

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Math.multiply 2
@L_Ball.64
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Math.multiply
0;JMP
(L_Ball.64)

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END16
(Ball$IF_END16)

// label IF_END15
(Ball$IF_END15)

// label IF_END14
(Ball$IF_END14)

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.setDestination 3
@L_Ball.65
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@3
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.setDestination
0;JMP
(L_Ball.65)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP
(L_Ball.66)
@L_Ball.66
0;JMP
// Bat

// function Bat.new 0
(Bat.new)

// push  5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Memory.alloc 1
@L_Bat.0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.alloc
0;JMP
(L_Bat.0)

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 2
@ARG
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 3
@ARG
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.show 1
@L_Bat.1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.show
0;JMP
(L_Bat.1)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.dispose 0
(Bat.dispose)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Memory.deAlloc 1
@L_Bat.2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.deAlloc
0;JMP
(L_Bat.2)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.show 0
(Bat.show)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// call Screen.setColor 1
@L_Bat.3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Bat.3)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.draw 1
@L_Bat.4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.draw
0;JMP
(L_Bat.4)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.hide 0
(Bat.hide)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Screen.setColor 1
@L_Bat.5
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Bat.5)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.draw 1
@L_Bat.6
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.draw
0;JMP
(L_Bat.6)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.draw 0
(Bat.draw)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// call Screen.drawRectangle 4
@L_Bat.7
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.drawRectangle
0;JMP
(L_Bat.7)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.setDirection 0
(Bat.setDirection)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.getLeft 0
(Bat.getLeft)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.getRight 0
(Bat.getRight)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.setWidth 0
(Bat.setWidth)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.hide 1
@L_Bat.8
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.hide
0;JMP
(L_Bat.8)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push ARG 1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.show 1
@L_Bat.9
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.show
0;JMP
(L_Bat.9)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function Bat.move 0
(Bat.move)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Bat.10
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Bat.11
0;JMP
(L_Bat.10)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Bat.11)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE0
@SP
AM=M-1
D=M
@Bat$IF_FALSE0
D;JNE

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Bat.12
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Bat.13
0;JMP
(L_Bat.12)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Bat.13)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE1
@SP
AM=M-1
D=M
@Bat$IF_FALSE1
D;JNE

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END1
@Bat$IF_END1
0;JMP

// label IF_FALSE1
(Bat$IF_FALSE1)

// label IF_END1
(Bat$IF_END1)

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Screen.setColor 1
@L_Bat.14
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Bat.14)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// call Screen.drawRectangle 4
@L_Bat.15
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.drawRectangle
0;JMP
(L_Bat.15)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// call Screen.setColor 1
@L_Bat.16
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Bat.16)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// call Screen.drawRectangle 4
@L_Bat.17
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.drawRectangle
0;JMP
(L_Bat.17)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END0
@Bat$IF_END0
0;JMP

// label IF_FALSE0
(Bat$IF_FALSE0)

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push  511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_Bat.18
D;JGT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_Bat.19
0;JMP
(L_Bat.18)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_Bat.19)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE2
@SP
AM=M-1
D=M
@Bat$IF_FALSE2
D;JNE

// push  511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END2
@Bat$IF_END2
0;JMP

// label IF_FALSE2
(Bat$IF_FALSE2)

// label IF_END2
(Bat$IF_END2)

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Screen.setColor 1
@L_Bat.20
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Bat.20)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// call Screen.drawRectangle 4
@L_Bat.21
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.drawRectangle
0;JMP
(L_Bat.21)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// call Screen.setColor 1
@L_Bat.22
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.setColor
0;JMP
(L_Bat.22)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push  3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// call Screen.drawRectangle 4
@L_Bat.23
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.drawRectangle
0;JMP
(L_Bat.23)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label IF_END0
(Bat$IF_END0)

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP
(L_Bat.24)
@L_Bat.24
0;JMP
// Main

// function Main.main 1
(Main.main)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// call PongGame.newInstance 0
@L_Main.0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@PongGame.newInstance
0;JMP
(L_Main.0)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// call PongGame.getInstance 0
@L_Main.1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@PongGame.getInstance
0;JMP
(L_Main.1)

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call PongGame.run 1
@L_Main.2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@PongGame.run
0;JMP
(L_Main.2)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call PongGame.dispose 1
@L_Main.3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@PongGame.dispose
0;JMP
(L_Main.3)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP
(L_Main.4)
@L_Main.4
0;JMP
// PongGame

// function PongGame.new 0
(PongGame.new)

// push  7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Memory.alloc 1
@L_PongGame.0
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.alloc
0;JMP
(L_PongGame.0)

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// call Screen.clearScreen 0
@L_PongGame.1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.clearScreen
0;JMP
(L_PongGame.1)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 6
@THIS
D=M
@6
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  230
@230
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  229
@229
D=A
@SP
A=M
M=D
@SP
M=M+1

// push THIS 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Bat.new 4
@L_PongGame.2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.new
0;JMP
(L_PongGame.2)

// pop THIS 0
@THIS
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  253
@253
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  222
@222
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  229
@229
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Ball.new 6
@L_PongGame.3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@6
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.new
0;JMP
(L_PongGame.3)

// pop THIS 1
@THIS
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  400
@400
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Ball.setDestination 3
@L_PongGame.4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@3
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.setDestination
0;JMP
(L_PongGame.4)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  238
@238
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  240
@240
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Screen.drawRectangle 4
@L_PongGame.5
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@4
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Screen.drawRectangle
0;JMP
(L_PongGame.5)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Output.moveCursor 2
@L_PongGame.6
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.moveCursor
0;JMP
(L_PongGame.6)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.new 1
@L_PongGame.7
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.new
0;JMP
(L_PongGame.7)

// push  83
@83
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.8
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.8)

// push  99
@99
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.9
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.9)

// push  111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.10
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.10)

// push  114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.11
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.11)

// push  101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.12
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.12)

// push  58
@58
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.13
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.13)

// push  32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.14
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.14)

// push  48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.15
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.15)

// call Output.printString 1
@L_PongGame.16
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.printString
0;JMP
(L_PongGame.16)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 5
@THIS
D=M
@5
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function PongGame.dispose 0
(PongGame.dispose)

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.dispose 1
@L_PongGame.17
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.dispose
0;JMP
(L_PongGame.17)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.dispose 1
@L_PongGame.18
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.dispose
0;JMP
(L_PongGame.18)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Memory.deAlloc 1
@L_PongGame.19
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Memory.deAlloc
0;JMP
(L_PongGame.19)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function PongGame.newInstance 0
(PongGame.newInstance)

// call PongGame.new 0
@L_PongGame.20
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@PongGame.new
0;JMP
(L_PongGame.20)

// pop STATIC 0
@PongGame.0
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function PongGame.getInstance 0
(PongGame.getInstance)

// push STATIC 0
@PongGame.0
D=M
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function PongGame.run 1
(PongGame.run)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// label WHILE_EXP0
(PongGame$WHILE_EXP0)

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// not
@SP
A=M-1
M=!M

// if-goto WHILE_END0
@SP
AM=M-1
D=M
@PongGame$WHILE_END0
D;JNE

// label WHILE_EXP1
(PongGame$WHILE_EXP1)

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.21
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.22
0;JMP
(L_PongGame.21)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.22)

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// and
@SP
AM=M-1
D=M
@SP
A=M-1
M=D&M

// not
@SP
A=M-1
M=!M

// if-goto WHILE_END1
@SP
AM=M-1
D=M
@PongGame$WHILE_END1
D;JNE

// call Keyboard.keyPressed 0
@L_PongGame.23
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Keyboard.keyPressed
0;JMP
(L_PongGame.23)

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.move 1
@L_PongGame.24
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.move
0;JMP
(L_PongGame.24)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call PongGame.moveBall 1
@L_PongGame.25
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@PongGame.moveBall
0;JMP
(L_PongGame.25)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Sys.wait 1
@L_PongGame.26
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.wait
0;JMP
(L_PongGame.26)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto WHILE_EXP1
@PongGame$WHILE_EXP1
0;JMP

// label WHILE_END1
(PongGame$WHILE_END1)

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  130
@130
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.27
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.28
0;JMP
(L_PongGame.27)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.28)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE0
@SP
AM=M-1
D=M
@PongGame$IF_FALSE0
D;JNE

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Bat.setDirection 2
@L_PongGame.29
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.setDirection
0;JMP
(L_PongGame.29)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END0
@PongGame$IF_END0
0;JMP

// label IF_FALSE0
(PongGame$IF_FALSE0)

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  132
@132
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.30
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.31
0;JMP
(L_PongGame.30)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.31)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE1
@SP
AM=M-1
D=M
@PongGame$IF_FALSE1
D;JNE

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Bat.setDirection 2
@L_PongGame.32
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.setDirection
0;JMP
(L_PongGame.32)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END1
@PongGame$IF_END1
0;JMP

// label IF_FALSE1
(PongGame$IF_FALSE1)

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  140
@140
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.33
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.34
0;JMP
(L_PongGame.33)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.34)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE2
@SP
AM=M-1
D=M
@PongGame$IF_FALSE2
D;JNE

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// pop THIS 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END2
@PongGame$IF_END2
0;JMP

// label IF_FALSE2
(PongGame$IF_FALSE2)

// label IF_END2
(PongGame$IF_END2)

// label IF_END1
(PongGame$IF_END1)

// label IF_END0
(PongGame$IF_END0)

// label WHILE_EXP2
(PongGame$WHILE_EXP2)

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.35
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.36
0;JMP
(L_PongGame.35)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.36)

// not
@SP
A=M-1
M=!M

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// and
@SP
AM=M-1
D=M
@SP
A=M-1
M=D&M

// not
@SP
A=M-1
M=!M

// if-goto WHILE_END2
@SP
AM=M-1
D=M
@PongGame$WHILE_END2
D;JNE

// call Keyboard.keyPressed 0
@L_PongGame.37
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Keyboard.keyPressed
0;JMP
(L_PongGame.37)

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.move 1
@L_PongGame.38
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.move
0;JMP
(L_PongGame.38)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push POINTER 0
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1

// call PongGame.moveBall 1
@L_PongGame.39
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@PongGame.moveBall
0;JMP
(L_PongGame.39)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Sys.wait 1
@L_PongGame.40
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sys.wait
0;JMP
(L_PongGame.40)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto WHILE_EXP2
@PongGame$WHILE_EXP2
0;JMP

// label WHILE_END2
(PongGame$WHILE_END2)

// goto WHILE_EXP0
@PongGame$WHILE_EXP0
0;JMP

// label WHILE_END0
(PongGame$WHILE_END0)

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE3
@SP
AM=M-1
D=M
@PongGame$IF_FALSE3
D;JNE

// push  10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Output.moveCursor 2
@L_PongGame.41
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.moveCursor
0;JMP
(L_PongGame.41)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.new 1
@L_PongGame.42
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.new
0;JMP
(L_PongGame.42)

// push  71
@71
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.43
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.43)

// push  97
@97
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.44
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.44)

// push  109
@109
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.45
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.45)

// push  101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.46
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.46)

// push  32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.47
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.47)

// push  79
@79
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.48
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.48)

// push  118
@118
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.49
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.49)

// push  101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.50
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.50)

// push  114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1

// call String.appendChar 2
@L_PongGame.51
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@String.appendChar
0;JMP
(L_PongGame.51)

// call Output.printString 1
@L_PongGame.52
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.printString
0;JMP
(L_PongGame.52)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END3
@PongGame$IF_END3
0;JMP

// label IF_FALSE3
(PongGame$IF_FALSE3)

// label IF_END3
(PongGame$IF_END3)

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP

// function PongGame.moveBall 5
(PongGame.moveBall)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// push ARG 0
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop POINTER 0
@THIS
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.move 1
@L_PongGame.53
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.move
0;JMP
(L_PongGame.53)

// pop THIS 2
@THIS
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.54
D;JGT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.55
0;JMP
(L_PongGame.54)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.55)

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 5
@THIS
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.56
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.57
0;JMP
(L_PongGame.56)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.57)

// not
@SP
A=M-1
M=!M

// and
@SP
AM=M-1
D=M
@SP
A=M-1
M=D&M

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE4
@SP
AM=M-1
D=M
@PongGame$IF_FALSE4
D;JNE

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// pop THIS 5
@THIS
D=M
@5
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.getLeft 1
@L_PongGame.58
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.getLeft
0;JMP
(L_PongGame.58)

// pop LCL 1
@LCL
D=M
@1
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.getRight 1
@L_PongGame.59
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.getRight
0;JMP
(L_PongGame.59)

// pop LCL 2
@LCL
D=M
@2
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.getLeft 1
@L_PongGame.60
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.getLeft
0;JMP
(L_PongGame.60)

// pop LCL 3
@LCL
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.getRight 1
@L_PongGame.61
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.getRight
0;JMP
(L_PongGame.61)

// pop LCL 4
@LCL
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1

// eq
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.62
D;JEQ
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.63
0;JMP
(L_PongGame.62)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.63)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE5
@SP
AM=M-1
D=M
@PongGame$IF_FALSE5
D;JNE

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// gt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.64
D;JGT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.65
0;JMP
(L_PongGame.64)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.65)

// push LCL 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.66
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.67
0;JMP
(L_PongGame.66)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.67)

// or
@SP
AM=M-1
D=M
@SP
A=M-1
M=D|M

// pop THIS 3
@THIS
D=M
@3
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 3
@THIS
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// not
@SP
A=M-1
M=!M

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE6
@SP
AM=M-1
D=M
@PongGame$IF_FALSE6
D;JNE

// push LCL 4
@LCL
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.68
D;JLT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.69
0;JMP
(L_PongGame.68)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.69)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE7
@SP
AM=M-1
D=M
@PongGame$IF_FALSE7
D;JNE

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// neg
@SP
A=M-1
M=-M

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END7
@PongGame$IF_END7
0;JMP

// label IF_FALSE7
(PongGame$IF_FALSE7)

// push LCL 3
@LCL
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 2
@LCL
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// gt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@SP
M=M-1
@L_PongGame.70
D;JGT
D=0
@SP
A=M
M=D
@SP
M=M+1
@L_PongGame.71
0;JMP
(L_PongGame.70)
D=-1
@SP
A=M
M=D
@SP
M=M+1
(L_PongGame.71)

// not
@SP
A=M-1
M=!M

// if-goto IF_FALSE8
@SP
AM=M-1
D=M
@PongGame$IF_FALSE8
D;JNE

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop LCL 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END8
@PongGame$IF_END8
0;JMP

// label IF_FALSE8
(PongGame$IF_FALSE8)

// label IF_END8
(PongGame$IF_END8)

// label IF_END7
(PongGame$IF_END7)

// push THIS 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D

// pop THIS 6
@THIS
D=M
@6
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push THIS 6
@THIS
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Bat.setWidth 2
@L_PongGame.72
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Bat.setWidth
0;JMP
(L_PongGame.72)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push  1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M

// pop THIS 4
@THIS
D=M
@4
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push  22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1

// push  7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1

// call Output.moveCursor 2
@L_PongGame.73
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.moveCursor
0;JMP
(L_PongGame.73)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// push THIS 4
@THIS
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Output.printInt 1
@L_PongGame.74
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Output.printInt
0;JMP
(L_PongGame.74)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END6
@PongGame$IF_END6
0;JMP

// label IF_FALSE6
(PongGame$IF_FALSE6)

// label IF_END6
(PongGame$IF_END6)

// goto IF_END5
@PongGame$IF_END5
0;JMP

// label IF_FALSE5
(PongGame$IF_FALSE5)

// label IF_END5
(PongGame$IF_END5)

// push THIS 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// push LCL 0
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1

// call Ball.bounce 2
@L_PongGame.75
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@2
D=D-A
@5
D=D-A
@ARG
M=D
@SP
D=M
@LCL
M=D
@Ball.bounce
0;JMP
(L_PongGame.75)

// pop TEMP 5
@R5
D=A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D

// goto IF_END4
@PongGame$IF_END4
0;JMP

// label IF_FALSE4
(PongGame$IF_FALSE4)

// label IF_END4
(PongGame$IF_END4)

// push  0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
@1
A=D-A
D=M
@THAT
M=D
@R13
D=M
@2
A=D-A
D=M
@THIS
M=D
@R13
D=M
@3
A=D-A
D=M
@ARG
M=D
@R13
D=M
@4
A=D-A
D=M
@LCL
M=D
@R14
A=M
0;JMP
(L_PongGame.76)
@L_PongGame.76
0;JMP
