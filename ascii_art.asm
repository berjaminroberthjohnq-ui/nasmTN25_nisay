
section .data

    
    flower db 10
           db "                         .-''''-.", 10
           db "                    _.-'          '-._", 10
           db "                 .-'    .------.      '-.", 10
           db "               .'     .'  .--.  '.       '.", 10
           db "              /     .'  .'    '.  '.       \", 10
           db "             /     /   /  /\    \   \       \", 10
           db "            |     |   |  /  \    |   |       |", 10
           db "            |     |   |  \__/    |   |       |", 10
           db "            |      \   \        /   /        |", 10
           db "             \      '.  '.___.'  .'         /", 10
           db "          _.-'\       '-------'         _.-/'-._", 10
           db "       .-'     '-._                 _.-'        '-.", 10
           db "      /            '----.......----'               \", 10
           db "     |       .--._                       _.--.       |", 10
           db "      \     /     '---------------------'     \     /", 10
           db "       '.  |                                 |   .'", 10
           db "         '-._                             _.-'", 10
           db "             '----.._____________..----'", 10
           db "                       \  ||||  /", 10
           db "                        \ |||| /", 10
           db "                         \||||/", 10
    flowerLen equ $ - flower

   
    stemLine db "                          ||||", 10
    stemLineLen equ $ - stemLine

    leaves db "                  ________||||", 10
           db "              _.-'        ||||", 10
           db "           .-'            ||||", 10
           db "         .'       ________||||", 10
           db "        /     _.-'        ||||", 10
           db "       |   .-'            ||||", 10
           db "        \-'                ||||", 10
           db "         '----------------||||", 10
           db "                            ||||________", 10
           db "                            ||||        '-._", 10
           db "                            ||||            '-.", 10
           db "                            ||||     ______     \", 10
           db "                            ||||_.--'      '-.   |", 10
           db "                            ||||             \  |", 10
           db "                            ||||              \_/", 10
    leavesLen equ $ - leaves

  
    thorns db "                      <----||||", 10
           db "                            ||||---->", 10
    thornsLen equ $ - thorns

    
    roots db "                           /||||\", 10
          db "                          / |||| \", 10
          db "                     ____/  ||||  \____", 10
          db "                  __/      /    \      \__", 10
          db "               __/       _/      \_       \__", 10
          db "              /______.--'          '--.______\", 10
          db 10
    rootsLen equ $ - roots

section .text

    global _start


_start:

   
    mov ecx, flower
    mov edx, flowerLen
    call printString

    
    mov esi, 5
    call printStem

    
    mov ecx, leaves
    mov edx, leavesLen
    call printString

    
    mov esi, 4
    call printStem

    ; Print the thorns
    mov ecx, thorns
    mov edx, thornsLen
    call printString

    
    mov esi, 6
    call printStem

    
    mov ecx, roots
    mov edx, rootsLen
    call printString

    ; Exit
    mov eax, 1
    mov ebx, 0
    int 0x80



printString:

    mov eax, 4
    mov ebx, 1
    int 0x80

    ret



printStem:

stemLoop:

    mov ecx, stemLine
    mov edx, stemLineLen
    call printString

    dec esi
    jnz stemLoop

    ret

