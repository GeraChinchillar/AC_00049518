; Christian Gerardo Chinchilla Ramirez
; 00049518
        
        org     100

        section .text

        mov byte[200h], "C"
        mov byte[201h], "G"
        mov byte[202h], "C"
        mov byte[203h], "R"

        ; Direccionamiento Directo
        mov AL, [200h]

        ; Doreccionamiento indirecto por registro
        mov BX, 201h
        mov CL, [BX]

        ; Direccionamiento indirecto base + indice
        mov BX, 200h
        mov SI, 0002h
        mov DL, [BX + SI]

        ; Direccionamiento relativo por registro
        mov DI, [BX + 003h]


