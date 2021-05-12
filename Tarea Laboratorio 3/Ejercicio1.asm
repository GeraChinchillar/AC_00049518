; Christian Gerardo Chinchilla Ramirez
; 00049518
        
        org     100

    section .text

        XOR SI, SI
        XOR AX, AX

        MOV byte[200h], 0d
        MOV byte[201h], 0d
        MOV byte[202h], 0d
        MOV byte[203h], 4d
        MOV byte[204h], 9d
        MOV byte[205h], 5d
        MOV byte[206h], 1d
        MOV byte[207h], 8d

        MOV CL, 8d
        jmp iterar

    iterar:
        ADD AL, [200h + SI]
        ; ADD AL, [carnet + SI]
        ;Trate de hacerlo con un arreglo que contiene mi carnet 
        ; pero no me colocaba los numeros correctos
        INC SI
        LOOP iterar

    promedio:
        MOV BL, 8d
        DIV BX
        MOV [20Ah], AL

        int 20h

    ; section .data
    ;     carnet DB 0,0,0,4,9,5,1,8


