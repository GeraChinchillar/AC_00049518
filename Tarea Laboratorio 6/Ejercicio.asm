;CHRISTIAN GERARDO CHINCHILLA RAMIREZ
;00049518

;Usuario cualquiera
;Contraseña: a1234a

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

        xor si, si
        call    verificar

    ; FUNCIONES

    verificar:
        mov bh, frase4[si]
        mov bl, frase2[si]
        cmp bh, bl
        jz correcto
        cmp bh, '$'
        jnz incorrecto
        inc si
        jmp verificar

    correcto:
        mov 	DX, strcorrecto
        call 	EscribirCadena
        jmp Fin

    incorrecto:
        mov 	DX, strincorrecto
        call 	EscribirCadena
        jmp Fin

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

    EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

    EscribirCadena:
        mov 	AH, 09h
        int 	21h
        ret

    Fin:
        int 	20h

    section	.data

        str1	db	"Escriba su usuario: ", "$"
        str2 	db 	"Ingrese su contrasenia: ", "$"
        frase1 	times 	20  	db	"$" 	
        frase2 	times 	20  	db	"$" 
        frase4  db  "a1234a"
        strcorrecto 	db "CORRECTO", "$"
        strincorrecto 	db "INCORRECTO", "$"