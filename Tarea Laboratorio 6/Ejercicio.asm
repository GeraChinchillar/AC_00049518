;CHRISTIAN GERARDO CHINCHILLA RAMIREZ
;00049518

	org 	100h

	section	.text

        ; print str1
        mov 	DX, str1
        call  	EscribirCadena

        ; input frase1
        mov 	BP, frase1
        call  	LeerCadena

        ; print str2
        mov 	DX, str2
        call 	EscribirCadena

        ; input frase2
        mov 	BP, frase2
        call  	LeerCadena

        ; print frase3
        mov 	DX, frase3
        call 	EscribirCadena

        call	EsperarTecla

        int 	20h

    ; FUNCIONES
    EsperarTecla:
            mov     AH, 01h         
            int     21h
            ret

    LeerCadena:
            xor     SI, SI          
    while:  
            call    EsperarTecla    
            cmp     AL, 0x0D        
            je      exit            
            mov     [BP+SI], AL   	
            inc     SI           
            jmp     while         
    exit:
        mov 	byte [BP+SI], "$"	
            ret

    EscribirCadena:
        mov 	AH, 09h
        int 	21h
        ret

    section	.data

        str1	db	"Escriba su usuario: ", "$"
        str2 	db 	"Ingrese su contraseña: ", "$"
        frase1 	times 	20  	db	" " 	
        frase2 	times 	20  	db	" " 
        frase3 	db "CORRECTO", "$"