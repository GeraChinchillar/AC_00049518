org 100h
        section .text
        XOR AX, AX
        XOR SI,SI
        XOR BX,BX
        XOR CX,CX
        XOR DX,DX

        MOV SI, 0
        MOV DI, 0d
        
        MOV DH, 10
        MOV DL, 20

        call modotexto
        
        loop1:
                call cursor
                MOV cl, [cadena1+SI]
                call character
                INC SI
                INC DI
                INC DL
                cmp DI, len1
                jb loop1
                XOR AH,AH
                XOR CX,CX
                XOR AL, AL
                XOR DI,DI
                XOR DL, DL
                XOR SI, SI
                MOV DL,20
                INC DH
                jmp loop2
        loop2:
                call cursor
                MOV cl, [cadena2+SI]
                call character
                INC SI
                INC DI
                INC DL
                cmp DI, len2
                jb loop2
                XOR AH,AH
                XOR CX,CX
                XOR AL, AL
                XOR DI,DI
                XOR DL, DL
                XOR SI, SI
                MOV DL,20
                INC DH
                jmp loop3

        loop3:
                call cursor
                MOV cl, [cadena3+SI]
                call character
                INC SI
                INC DI
                INC DL
                cmp DI, len3
                jb loop3
                XOR AH,AH
                XOR CX,CX
                XOR AL, AL
                XOR DI,DI
                XOR DL, DL
                XOR SI, SI
                MOV DL,20
                INC DH
                jmp loop4

        loop4:
                call cursor
                MOV cl, [cadena4+SI]
                call character
                INC SI
                INC DI
                INC DL
                cmp DI, len4
                jb loop4
                XOR AH,AH
                XOR CX,CX
                XOR AL, AL
                XOR DI,DI
                XOR SI, SI
                XOR DL, DL
                MOV DL,20
                INC DH
                jmp waitkey

        cursor:
                MOV AH,02H
                MOV bh,0h
                int 10H
                ret
        
        modotexto:
                MOV AH,0h
                MOV AL,03h
                int 10h
                ret

        character:
                MOV AH,0AH
                MOV AL, cl
                MOV bh,0h
                MOV CX, 1h
                int 10h
                ret

        waitkey:
                MOV AH, 00h
                int 16h
        exit:
                int 20h

        section .data
        
        cadena1 DB 'Christian'
        len1 equ $-cadena1

        cadena2 DB 'Gerardo'
        len2 equ $-cadena2

        cadena3 DB 'Chinchilla'
        len3 equ $-cadena3

        cadena4 DB 'Ramirez'
        len4 equ $-cadena4