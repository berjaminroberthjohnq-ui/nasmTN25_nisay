

%macro PRINT_LINE 1
    mov esi, %1
    call print_string
%endmacro

section .data
    line1  db "                          I", 10, 0
    line2  db "                        wrote", 10, 0
    line3  db "                      a poem", 10, 0
    line4  db "                    in the shape", 10, 0
    line5  db "                   of a Christmas", 10, 0
    line6  db "             tree but then forgot", 10, 0
    line7  db "         to water it and only a few", 10, 0
    line8  db "                          days", 10, 0
    line9  db "                          later", 10, 10, 0

    line10 db "                       there", 10, 0
    line11 db "                were", 10, 0
    line12 db "                           words", 10, 0
    line13 db "         all", 10, 0
    line14 db "                        over", 10, 0
    line15 db "               the", 10, 0
    line16 db "                                         carpet", 10, 0

section .text
    global _start

_start:
    PRINT_LINE line1
    PRINT_LINE line2
    PRINT_LINE line3
    PRINT_LINE line4
    PRINT_LINE line5
    PRINT_LINE line6
    PRINT_LINE line7
    PRINT_LINE line8
    PRINT_LINE line9

    PRINT_LINE line10
    PRINT_LINE line11
    PRINT_LINE line12
    PRINT_LINE line13
    PRINT_LINE line14
    PRINT_LINE line15
    PRINT_LINE line16

    ; Exit the program
    mov eax, 1
    mov ebx, 0
    int 0x80

; Prints the null-terminated string whose address is in ESI
print_string:
    push esi
    push edi

    mov edi, esi
    xor edx, edx

.count_length:
    cmp byte [edi], 0
    je .write_string
    inc edi
    inc edx
    jmp .count_length

.write_string:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; standard output
    mov ecx, esi        ; address of the string
    int 0x80

    pop edi
    pop esi
    ret
