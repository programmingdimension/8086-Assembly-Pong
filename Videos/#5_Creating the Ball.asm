STACK SEGMENT PARA STACK
	DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

	BALL_X DW 0Ah ;X position (column) of the ball
	BALL_Y DW 0Ah ;Y position (line) of the ball

DATA ENDS

CODE SEGMENT PARA 'CODE'

	MAIN PROC FAR
	ASSUME CS:CODE,DS:DATA,SS:STACK ;assume as code,data and stack segments the respective registers
	PUSH DS							;push to the stack the DS segment
	SUB AX,AX                       ;clean the AX registers
	PUSH AX							;push AX to the stack
	MOV AX,DATA 					;save on the AX register the contents of the DATA segment
	MOV DS,AX                       ;save on the DS segment the contents of AX

		MOV AH,00h ;set the configuration to video mode
		MOV AL,13h ;choose the video mode
		INT 10h    ;execute the configuration 
		
		MOV AH,0Bh ;set the configuration
		MOV BH,00h ;to the background color
		MOV BL,00h ;choose black as background color
		INT 10h    ;execute the configuration
		
		MOV AH,0Ch ;set the configuration to writing a pixel
		MOV AL,0Fh ;choose white as color
		MOV BH,00h ;set the page number 
		MOV CX,BALL_X ;set the column (X)
		MOV DX,BALL_Y ;set the line (Y)
		INT 10h    ;execute the configuration
		
		RET
	MAIN ENDP

CODE ENDS
END