; Christian Gerardo Chinchilla Ramirez
; 00049518

org         100h

            MOV byte[0200h], 05d
            MOV CL, [0200h]
            MOV AH, 00d
            MOV AL, 01d
            CMP CL, 00d
            JZ final
condic:
            MUL CX
            loop condic

final:      
            mov[20Bh], AX

            int 20h