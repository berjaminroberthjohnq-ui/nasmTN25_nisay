section .data
    digit db '0', 10

section .text
    global _start

_start:
    
    mov eax, 3
    mov ebx, 8

    
    call swap_numbers

   
    mov esi, eax
    mov edi, ebx

   
    mov eax, esi
    add al, '0'
    mov [digit], al

    mov eax, 4          
    mov ebx, 1          
    mov ecx, digit
    mov edx, 2          
    int 0x80

   
    mov eax, edi
    add al, '0'
    mov [digit], al

    mov eax, 4
    mov ebx, 1
    mov ecx, digit
    mov edx, 2
    int 0x80

   
    mov eax, 1         
    xor ebx, ebx
    int 0x80



    push eax            ; Save the first value
    push ebx            ; Save the second value

    pop eax             ; EAX gets the original EBX value
    pop ebx             ; EBX gets the original EAX value

    ret