
section .data

    ; The top flower shape is stored as a block of ASCII text.
    ; Each line is a separate string ending with a newline.
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

    ; One stem segment used repeatedly to build the flower stem.
    stemLine db "                          ||||", 10
    stemLineLen equ $ - stemLine

    ; The leaves are printed as a separate shaped block.
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

  
    ; Thorns are attached to the stem as decorative spikes.
    thorns db "                      <----||||", 10
           db "                            ||||---->", 10
    thornsLen equ $ - thorns

    ; Root lines are printed at the bottom to complete the flower image.
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

    ; Print the flower head first.
    mov ecx, flower
    mov edx, flowerLen
    call printString

    ; Draw the first section of the stem.
    mov esi, 5
    call printStem

    ; Print the leaves after the stem.
    mov ecx, leaves
    mov edx, leavesLen
    call printString

    ; Add more stem after the leaves.
    mov esi, 4
    call printStem

    ; Print the decorative thorns.
    mov ecx, thorns
    mov edx, thornsLen
    call printString

    ; Draw the final stem section.
    mov esi, 6
    call printStem

    ; Finish with the roots.
    mov ecx, roots
    mov edx, rootsLen
    call printString

    ; Exit the program cleanly.
    mov eax, 1
    mov ebx, 0
    int 0x80



printString:

    ; syscall write: prints the memory block in ECX with length in EDX.
    mov eax, 4
    mov ebx, 1
    int 0x80

    ret


printStem:

    ; Repeat the stem segment `esi` times.
stemLoop:

    mov ecx, stemLine
    mov edx, stemLineLen
    call printString

    dec esi
    jnz stemLoop

    ret

