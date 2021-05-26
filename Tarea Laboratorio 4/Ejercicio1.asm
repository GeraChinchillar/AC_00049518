; Christian Gerardo Chinchilla Ramirez
; 00049518
        
    org     100h

    section .text
        mov CX, len
        xor AX, AX
        xor DL, DL
        xor SI, SI
        xor DI, DI
        xor BP, BP

    for:
        mov DL, [array+SI]
        mov AL, DL
        mov BL, 2d
        DIV BL
        cmp AH, 0d
        JZ par
        call impar

    next:
        inc SI
        loop for

    int 20h

    section .data
        array db 4,9,5,1,8,2,45
        len equ $-array

    par: 
        mov [0300h+BP], DL
        inc BP
        jmp next

    impar:
        mov [0320h+DI], DL
        inc DI
        ret