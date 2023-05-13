.data
/* Definicion de datos */
mapa: .ascii "#-------------------------------------------------#\n|          ***  MEMOTEST * Grupo 11  ***          |\n|  ***  Barrientos * Schenfeld * Sotomayor  ***   |\n#-------------------------------------------------#\n|          |---0---1---2---3---4---5---|          |\n|        0 |-- ? - ? - ? - ? - ? - ? --|          |\n|          |---------------------------|          |\n|        1 |-- ? - ? - ? - ? - ? - ? --|          |\n|          |---------------------------|          |\n|        2 |-- ? - ? - ? - ? - ? - ? --|          |\n|          |---------------------------|          |\n|        3 |-- ? - ? - ? - ? - ? - ? --|          |\n|          |---------------------------|          |\n|        4 |-- ? - ? - ? - ? - ? - ? --|          |\n|          |---------------------------|          |\n#-------------------------------------------------#\n"

longitud = . - mapa
/* Diseno del juego 
#-------------------------------------------------#\n
|          ***  MEMOTEST * Grupo 11  ***          |\n
|  ***  Barrientos * Schenfeld * Sotomayor  ***   |\n
#-------------------------------------------------#\n
|          |---0---1---2---3---4---5---|          |\n
|        0 |-- ? - ? - ? - ? - ? - ? --|          |\n
|          |---------------------------|          |\n
|        1 |-- ? - ? - ? - ? - ? - ? --|          |\n
|          |---------------------------|          |\n
|        2 |-- ? - ? - ? - ? - ? - ? --|          |\n
|          |---------------------------|          |\n
|        3 |-- ? - ? - ? - ? - ? - ? --|          |\n
|          |---------------------------|          |\n
|        4 |-- ? - ? - ? - ? - ? - ? --|          |\n
|          |---------------------------|          |\n
#-------------------------------------------------#\n
*/
/* Diseno del juego - Sin incognitas
#-------------------------------------------------#\n 00000000
|          ***  MEMOTEST * Grupo 11  ***          |\n 00000034
|  ***  Barrientos * Schenfeld * Sotomayor  ***   |\n 00000068
#-------------------------------------------------#\n 0000009c
|          |---0---1---2---3---4---5---|          |\n 000000d0
|        0 |-- g - o - k - u - b - c --|          |\n 00000104
|          |---------------------------|          |\n 00000138
|        1 |-- m - a - e - w - u - s --|          |\n 0000016c
|          |---------------------------|          |\n 000001a0
|        2 |-- l - o - g - b - m - v --|          |\n 000001d4
|          |---------------------------|          |\n 00000208
|        3 |-- z - k - l - c - j - z --|          |\n 0000023c
|          |---------------------------|          |\n 00000270
|        4 |-- w - e - v - j - a - s --|          |\n 000002a4
|          |---------------------------|          |\n 000002d8
#-------------------------------------------------#\n
*/

respuestas: .asciz "#-------------------------------------------------#\n|          ***  MEMOTEST * Grupo 11  ***          |\n|  ***  Barrientos * Schenfeld * Sotomayor  ***   |\n#-------------------------------------------------#\n|          |---0---1---2---3---4---5---|          |\n|        0 |-- g - o - k - u - b - c --|          |\n|          |---------------------------|          |\n|        1 |-- m - a - e - w - u - s --|          |\n|          |---------------------------|          |\n|        2 |-- l - o - g - b - m - v --|          |\n|          |---------------------------|          |\n|        3 |-- z - k - l - c - j - z --|          |\n|          |---------------------------|          |\n|        4 |-- w - e - v - j - a - s --|          |\n|          |---------------------------|          |\n#-------------------------------------------------#\n"
longitudrespuestas = . - respuestas

nuevalin: .asciz "\n"
longitudnuevalin = . - nuevalin


/*------Primera Ficha------*/
coordX1: .asciz "Ingrese una fila (0-4) para la ficha 1: "
longitudCoordX1 = . - coordX1

coordY1: .asciz "Ingrese una columna (0-5) para la ficha 1: "
longitudCoordY1 = . - coordY1

fila1: .asciz " "
longitudfil1 = . - fila1
valorfila1: .int 0

col1: .asciz " "
longitudcol1 = . - col1
valorcol1: .int 0

/*------Segunda Ficha------*/
coordX2: .asciz "Ingrese una fila (0-4) para la ficha 2: "
longitudCoordX2 = . - coordX2

coordY2: .asciz "Ingrese una columna (0-5) para la ficha 2: "
longitudCoordY2 = . - coordY2

fila2: .asciz " "
longitudfila2 = . - fila2
valorfila2: .int 0

col2: .asciz " "
longitudcol2 = . - col2
valorcol2: .int 0

letrasutilizadas: .asciz "gokubcmaewslovzj"
longitudletrasutilizadas = . - letrasutilizadas


/*-----Contadores-----*/
msjencontrar: .asciz "Pares a encontrar: "
msjencontrarlongitud = . - msjencontrar
encontrar: .asciz "  "
encontrarlongitud = . - encontrar
valorencontrar: .int 15

msjaciertos: .asciz "Aciertos: "
longitudmsjaciertos = . - msjaciertos
aciertos: .asciz "  "
longitudaciertos = . - aciertos
valoraciertos: .int 0

msjerrores: .asciz "Errores: "
longitudmsjerrores = . - msjerrores
errores: .asciz "  "
longituderrores = . - errores
valorerrores: .int 0

msjvidas: .asciz "Vidas restantes: "
longitudmsjvidas = . - msjvidas
vidas: .asciz "  "
longitudvidas = . - vidas
valorvidas: .int 30

msjindices: .asciz "Por favor ingrese coordenadas distintas\n"
longitudmsjindices = . - msjindices

msjganaste: .asciz "Felicidades encontraste todos los pares!! Ganaste el juego!!!"
longitudmsjganaste = . - msjganaste

msjperdiste: .asciz "Se te acabaron las vidas! Perdiste :(("
longitudmsjperdiste = . - msjperdiste

msjyaingresado: .asciz "Coordenadas invalidas o ya ingresadas, por favor elija otras\n"
longitudmsjyaingresado = . - msjyaingresado

msjerror: .asciz "ERROR\nPor favor ingrese numeros dentro del rango permitido\n"
longitudmsjerror = . - msjerror

/*------------------------------------------------*/
.text
/*------------------------------------------------*/
imprimir:
    .fnstart
        push {lr}
        mov r7, #4      /*Salida por pantalla*/
        mov r0, #1
        swi 0           /*Interrupcion*/
        pop {lr}
        bx lr           /*Salgo de la funcion*/
    .fnend
/*--------------------------------------------------*/
pedirinput:
    .fnstart
        push {lr}
        mov r7, #3 
        mov r0, #0
        mov r2, #2
        swi 0
        pop {lr}
        bx lr
    .fnend
/*--------------------------------------------------*/
leerCoords:
    .fnstart
        push {lr}
/*------Primera Ficha------*/
    /*Pide la primer fila*/
        ldr r1, =coordX1
        ldr r2, =longitudCoordX1
        bl imprimir
        ldr r1, =fila1 
        bl pedirinput
        ldr r3, =valorfila1
        bl cadenaAnro
        ldr r3, =valorfila1
        bl nuevalinea
    /*Pide la primer columna*/
        ldr r1, =coordY1
        ldr r2, =longitudCoordY1
        bl imprimir
        ldr r1, =col1
        bl pedirinput
        ldr r3, =valorcol1
        bl cadenaAnro
        ldr r3, =valorfila1
        bl nuevalinea
        bl reemplazarficha1
        mov r6, r8            /*Guardo el puntero en otro registro*/
/*------Segunda Ficha------*/
    /*Pide la segunda fila*/
        ldr r1, =coordX2
        ldr r2, =longitudCoordX2
        bl imprimir
        ldr r1, =fila2 
        bl pedirinput
        ldr r3, =valorfila2
        bl cadenaAnro
        ldr r3, =valorfila1
        bl nuevalinea
    /*Pide la segunda columna*/
        ldr r1, =coordY2
        ldr r2, =longitudCoordY2
        bl imprimir
        ldr r1, =col2 
        bl pedirinput
        ldr r3, =valorcol2
        bl cadenaAnro
        ldr r3, =valorfila1
        bl nuevalinea
        bl reemplazarficha2ycomparar
        pop {lr}
        bx lr
    .fnend
/*--------------------------------------------------*/
cadenaAnro:                     /*Esta función permite pasar los inputs del ususario a enteros restándoles 30 a su bit*/
    .fnstart        
	    push {lr}
        eor r9, r9
        ldrb r8, [r1]
        sub r8, #0x30
        add r9, r8
        str r9, [r3]
        pop {lr}
        bx lr
	.fnend
/*--------------------------------------------------*/
reemplazarficha1:
    .fnstart
        push {lr}
        ldr r10, =respuestas
        ldr r11, =mapa
        ldr r4, =valorfila1     /*Fila -> coord.x*/
        ldrb r4, [r4]
        ldr r1, =valorcol1      /*Columna -> coord.y*/
        ldrb r1, [r1]
        mov r9, #0x2
        mul r4, r9              /*Multiplicamos por 2 para saltear las filas que no tienen elementos*/
        mov r2, #0x34           /*Cant elementos por fila*/
        mov r8, #0              /*Puntero del elemento*/
        mul r8, r4, r2          /*r8 = nro de fila * cantidad de elementos*/
        mov r9, #0x113          /*Sumamos filas y columnas que no forman parte de los signos*/
        add r8, r9
        mov r9, #0x4
        mul r1, r9              /*Multiplicamos por 4 para pasar los espacios de decoracion*/
        add r8, r1              /*puntero a fila + coord columna*/
        add r10, r8             /*Sumamos valor final al puntero de la matriz destapada*/
        ldrb r3, [r10]          /*Cargamos el byte que apunta*/
        add r11, r8             /*Sumamos valor final al puntero de la matriz tapada*/
        strb r3, [r11]          /*Guardamos el byte al que cargamos antes*/
        mov r12, r3
        ldr r1, =mapa
        ldr r2, =longitud
        bl imprimir
        bl nuevalinea
        pop {lr}
        bx lr
    .fnend
/*--------------------------------------------------*/
reemplazarficha2ycomparar:
    .fnstart
        push {lr}
        push {r11}
        ldr r10, =respuestas
        ldr r11, =mapa
        ldr r5, =valorfila2     /*Fila -> coord.x*/
        ldrb r5, [r5]
        ldr r1, =valorcol2      /*Columna -> coord.y*/
        ldrb r1, [r1]
        mov r9, #0x2
        mul r5, r9              /*Multiplicamos por 2 para saltear las filas que no tienen elementos*/
        mov r2, #0x34           /*Cant elementos por fila*/
        mov r8, #0              /*Puntero del elemento*/
        mul r8, r5, r2          /*r8 = nro de fila * cantidad de elementos*/
        mov r9, #0x113          /*Sumamos filas y columnas que no forman parte de los signos*/
        add r8, r9
        mov r9, #0x4
        mul r1, r9              /*Multiplicamos por 4 para pasar los espacios de decoracion*/
        add r8, r1              /*puntero a fila + coord columna*/
        add r10, r8             /*Sumamos valor final al puntero de la matriz destapada*/
        ldrb r4, [r10]          /*Cargamos el byte que apunta*/
        add r11, r8             /*Sumamos valor final al puntero de la matriz tapada*/
        strb r4, [r11]          /*Guardamos el byte al que cargamos antes*/
        ldr r1, =mapa
        ldr r2, =longitud
        bl imprimir
        bl nuevalinea
    /*-----Comparar Fichas-----*/
        cmp r6, r8
        beq indicesiguales
        cmp r12, r4
        beq comparacioninicial
        bne distintos

    comparacioninicial:
        ldr r1, =letrasutilizadas
        ldr r2, =longitudletrasutilizadas
        mov r6, #0
        bal compararanteriores

    iguales:
        pop {r11}
        ldr r0, =valorencontrar
        ldr r12, [r0]
        sub r12, #1
        str r12, [r0]
        ldr r0, =valoraciertos
        ldr r12, [r0]
        add r12, #1
        str r12, [r0]
        bal fin

    compararanteriores:
        mov r8, #0x78
        ldrb r7, [r1, r6]
        cmp r12, r7
        beq reemplazarvector
        cmp r4, r7
        beq reemplazarvector

    ciclo:
        add r6, #1
        cmp r2, r6
        beq yaingresado
        bal compararanteriores

    reemplazarvector:
        strb r8, [r1, r6]
        bal iguales

    yaingresado:
        pop {r11}
        ldr r1, =msjyaingresado
        ldr r2, =longitudmsjyaingresado
        bl imprimir
        bl nuevalinea
        bal fin

    distintos:
        mov r12, #0x3f //"?"
        strb r12, [r11]
        pop {r11}
        strb r12, [r11]
        ldr r0, =valorvidas
        ldr r12, [r0]
        sub r12, #1
        str r12, [r0]
        ldr r0, =valorerrores
        ldr r12, [r0]
        add r12, #1
        str r12, [r0]
        bal fin

    indicesiguales:
        mov r12, #0x3f //"?"
        strb r12, [r11]
        pop {r11}
        strb r12, [r11]
        ldr r1, =msjindices
        ldr r2, =longitudmsjindices
        bl imprimir
        bl nuevalinea
        bal fin

    fin:
        pop {lr}
        bx lr
    .fnend
/*--------------------------------------------------*/
estadocontadores:               /*Carga las variables de los contadores con sus valores y las imprime en pantalla*/
	.fnstart
        push {lr}
        ldr r1, =msjencontrar
        ldr r2, =msjencontrarlongitud
        bl imprimir
        ldr r9, =valorencontrar
        ldr r9, [r9]
        ldr r7, =encontrar
        bl nroAcadena
        ldr r1, =encontrar
        ldr r2, =encontrarlongitud
        bl imprimir
        bl nuevalinea
        ldr r1, =msjaciertos
        ldr r2, =longitudmsjaciertos
        bl imprimir
        ldr r9, =valoraciertos
        ldr r9, [r9]
        ldr r7, =aciertos
        bl nroAcadena
        ldr r1, =aciertos
        ldr r2, =longitudaciertos
        bl imprimir
        bl nuevalinea
        ldr r1, =msjerrores
        ldr r2, =longitudmsjerrores
        bl imprimir
        ldr r9, =valorerrores
        ldr r9, [r9]
        ldr r7, =errores
        bl nroAcadena
        ldr r1, =errores
        ldr r2, =longituderrores
        bl imprimir
        bl nuevalinea
        ldr r1, =msjvidas
        ldr r2, =longitudmsjvidas
        bl imprimir
        ldr r9, =valorvidas
        ldr r9, [r9]
        ldr r7, =vidas
        bl nroAcadena
        ldr r1, =vidas
        ldr r2, =longitudvidas
        bl imprimir
        bl nuevalinea
        bl nuevalinea
        pop {lr}
        bx lr
	.fnend
/*--------------------------------------------------*/
nroAcadena:             /*Sirve para pasar un entero a byte y poder imprimirlo en pantalla*/
	.fnstart     
        push {lr}
        mov r5, #0      /*Puntero para guardar los nuevos valores en byte de los enteros*/
        mov r6, #10
        mov r4, #0      /*Puntero para recorrer el entero recibido y pasarlo a cadena*/
        mov r10, #0 
        bal dividir

    ciclodivision:
        add r9, #0x30
        push {r9} 
        add r4, #1 
        mov r9, r10
        mov r10, #0
        cmp r9, #0
        beq cifras
    
    dividir:            /*Divide sucesivamente al entero recibido hasta que sea menor que 10*/
        cmp r9, r6
        blt ciclodivision
        sub r9, r6
        add r10, #1
        bal dividir

    cifras:
        cmp r4, #1
        bne finalizar
        mov r12, #0x30
        strb r12, [r7, r5] /*Esto es para cuando el entero es 0, se pueda mostrar en pantalla apropiadamente*/  
        add r5, #1

    finalizar:
        cmp r4, #0
        beq findiv
        pop {r9}
        strb r9, [r7, r5] /*Guarda en la variable que corresponda el nuevo valor de los enteros a cadena*/
        add r5, #1
        sub r4, #1
        bal finalizar
    findiv:
        pop {lr}
        bx lr
	.fnend
/*--------------------------------------------------*/
nuevalinea:
   .fnstart
        push {lr}
        ldr r2, =longitudnuevalin /*Tamano de la cadena*/
        ldr r1, =nuevalin
        mov r7, #4                /* Salida por pantalla */
        mov r0, #1
        swi 0
        pop {lr}
        bx lr
   .fnend
/*------------------------------------------------*/

.global main
main:
        ldr r1, =mapa       /*Imprimo mapa*/
        ldr r2, =longitud
        bl imprimir
        bl estadocontadores
    jugar:
        bl leerCoords       /*Pide coords de cada ficha y luego reemplaza en mapa*/
        bl estadocontadores /*Imprime todos los contadores, como vidas, errores, etc*/
        ldr r1, =valorvidas 
        ldr r1, [r1]
        cmp r1, #0          /*Verifica si pierde*/
        beq perdiste
        ldr r1, =valorencontrar 
	    ldr r1, [r1]
        cmp r1, #0          /*Verifica si gana*/
        beq ganaste
        bal jugar

    perdiste:
        ldr r1, =msjperdiste
        ldr r2, =longitudmsjperdiste
        bl imprimir
        bl nuevalinea
        bal final

    ganaste:
        ldr r1, =msjganaste
        ldr r2, =longitudmsjganaste
        bl imprimir
        bl nuevalinea
        bal final

final:
    mov r7, #1 /*Salida del sistema*/
    swi 0
