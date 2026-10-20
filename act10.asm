

section .data
    menu        db '----------------------------------', 10
                db '[A]dd', 10
                db '[S]ubtract', 10
                db '[M]ultiply', 10
                db '[D]ivide', 10
                db '----------------------------------', 10
                db 'Enter your choice: '
    menu_len    equ $ - menu

    first_prompt    db 'Enter first number : '
    first_len       equ $ - first_prompt
    second_prompt   db 'Enter second number : '
    second_len      equ $ - second_prompt
    invalid_num     db 'Invalid input. Enter a whole number from 0 to 99.', 10
    invalid_num_len equ $ - invalid_num
    invalid_choice  db 'Invalid choice. Choose A, S, M, or D.', 10
    invalid_choice_len equ $ - invalid_choice
    zero_error      db 'Cannot divide by zero.', 10
    zero_error_len  equ $ - zero_error

    sum_msg         db 'The sum is '
    sum_len         equ $ - sum_msg
    difference_msg  db 'The difference is '
    difference_len  equ $ - difference_msg
    product_msg     db 'The product is '
    product_len     equ $ - product_msg
    quotient_msg    db 'The quotient is '
    quotient_len    equ $ - quotient_msg

    again_prompt    db 10, 'Do you want to try again (Y/N): '
    again_len       equ $ - again_prompt
    newline         db 10
    newline_len     equ $ - newline
    clear_screen    db 27, '[2J', 27, '[H'
    clear_len       equ $ - clear_screen

section .bss
    input       resb 16
    parsed      resd 1
    first_num   resd 1
    second_num  resd 1
    answer      resd 1
    message_length resd 1
    outbuf      resb 12

section .text
    global _start

_start:
menu_loop:
    mov ecx, menu
    mov edx, menu_len
    call print_string

    call read_line
    mov al, [input]
    ; Accept lowercase menu letters as well.
    cmp al, 'a'
    jb .check_choice
    cmp al, 'z'
    ja .check_choice
    sub al, 32

.check_choice:
    cmp al, 'A'
    je do_add
    cmp al, 'S'
    je do_subtract
    cmp al, 'M'
    je do_multiply
    cmp al, 'D'
    je do_divide

    mov ecx, invalid_choice
    mov edx, invalid_choice_len
    call print_string
    jmp ask_again

do_add:
    mov ecx, sum_msg
    mov edx, sum_len
    mov eax, add_numbers
    jmp get_operands

do_subtract:
    mov ecx, difference_msg
    mov edx, difference_len
    mov eax, subtract_numbers
    jmp get_operands

do_multiply:
    mov ecx, product_msg
    mov edx, product_len
    mov eax, multiply_numbers
    jmp get_operands

do_divide:
    mov ecx, quotient_msg
    mov edx, quotient_len
    mov eax, divide_numbers
    jmp get_operands

; Save the operation's output label and procedure address while reading inputs.
get_operands:
    push eax                    ; operation procedure
    push ecx                    ; result label
    push edx                    ; result label length

    mov ecx, first_prompt
    mov edx, first_len
    call read_number
    mov [first_num], eax

    mov ecx, second_prompt
    mov edx, second_len
    call read_number
    mov [second_num], eax

    ; Restore output label length, label, and operation procedure.
    pop edx
    mov [message_length], edx
    pop ecx
    pop esi

    cmp esi, divide_numbers
    jne .run_operation
    cmp dword [second_num], 0
    je .division_by_zero

.run_operation:
    mov eax, [first_num]
    mov ebx, [second_num]
    call esi
    mov [answer], eax

    mov edx, [message_length]
    call print_string
    mov eax, [answer]
    call print_number
    mov ecx, newline
    mov edx, newline_len
    call print_string
    jmp ask_again

.division_by_zero:
    mov ecx, zero_error
    mov edx, zero_error_len
    call print_string
    jmp ask_again

ask_again:
    mov ecx, again_prompt
    mov edx, again_len
    call print_string
    call read_line
    mov al, [input]
    cmp al, 'y'
    je repeat_menu
    cmp al, 'Y'
    je repeat_menu
    cmp al, 'n'
    je exit_program
    cmp al, 'N'
    je exit_program
    jmp ask_again

repeat_menu:
    mov ecx, clear_screen
    mov edx, clear_len
    call print_string
    jmp menu_loop

exit_program:
    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80

; Prints ECX address, EDX byte count. Preserves registers.
print_string:
    push eax
    push ebx
    push ecx
    push edx
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    int 0x80
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret

; Reads one line into input.
read_line:
    push ebx
    push ecx
    push edx
    mov eax, 3                  ; sys_read
    mov ebx, 0                  ; stdin
    mov ecx, input
    mov edx, 16
    int 0x80
    pop edx
    pop ecx
    pop ebx
    ret

; ECX/EDX contain the prompt. Returns a valid number in EAX.
read_number:
    push ecx
    push edx
.try_again:
    mov ecx, [esp + 4]
    mov edx, [esp]
    call print_string
    call read_line
    call parse_number
    cmp eax, 1
    je .number_ok
    mov ecx, invalid_num
    mov edx, invalid_num_len
    call print_string
    jmp .try_again
.number_ok:
    mov eax, [parsed]
    add esp, 8
    ret

; Parses one or two decimal digits. Returns EAX=1 if valid, otherwise 0.
parse_number:
    push ebx
    push esi
    mov esi, input
    xor eax, eax
    xor ecx, ecx
.parse_loop:
    mov bl, [esi]
    cmp bl, 10                  ; newline
    je .parse_done
    cmp bl, 13                  ; carriage return
    je .parse_done
    cmp bl, '0'
    jb .parse_bad
    cmp bl, '9'
    ja .parse_bad
    inc ecx
    cmp ecx, 2
    ja .parse_bad
    imul eax, 10
    sub bl, '0'
    movzx ebx, bl
    add eax, ebx
    inc esi
    jmp .parse_loop
.parse_done:
    cmp ecx, 0
    je .parse_bad
    mov [parsed], eax
    mov eax, 1
    pop esi
    pop ebx
    ret
.parse_bad:
    xor eax, eax
    pop esi
    pop ebx
    ret

; Arithmetic procedures: EAX=first operand, EBX=second operand; result in EAX.
add_numbers:
    add eax, ebx
    ret

subtract_numbers:
    sub eax, ebx
    ret

multiply_numbers:
    imul eax, ebx
    ret

divide_numbers:
    xor edx, edx
    div ebx                      ; integer quotient in EAX
    ret

; Prints signed integer in EAX, including two-digit and larger results.
print_number:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edi, outbuf + 12
    xor esi, esi                 ; sign flag
    test eax, eax
    jns .convert
    neg eax
    mov esi, 1
.convert:
    mov ebx, 10
    xor ecx, ecx
    cmp eax, 0
    jne .digit_loop
    dec edi
    mov byte [edi], '0'
    inc ecx
    jmp .add_sign
.digit_loop:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    inc ecx
    test eax, eax
    jne .digit_loop
.add_sign:
    cmp esi, 0
    je .write_number
    dec edi
    mov byte [edi], '-'
    inc ecx
.write_number:
    mov edx, ecx
    mov ecx, edi
    call print_string
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
