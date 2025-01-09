org 0x7C00
bits 16


%define ENDL 0x0D, 0x0A


start:
    jmp main


;
; prints a string to the screen
; paramters:
;  > ds:si points to string
;
;
puts:
    ;
    push si
    push ax

.loop:
    lodsb           ;
    or al, al       ;
    jz .done

    mov ah, 0x0e
    int 0x10

    jmp .loop

.done:
    pop ax
    pop si
    ret

main:

    ; setup data segments
    mov ax, 0       ;
    mov ds, ax
    mov es, ax

    ; setup stack
    mov ss, ax
    mov sp, 0x7C00

    ; write
    mov si, msg_one
    call puts
    
    mov si, msg_two
    call puts

    mov si, msg_three
    call puts

    hlt

.halt:
    jmp .halt


msg_one: db 'Hello, World!', ENDL, 0
msg_two: db 'This will soon be a cool operating system (maybe)', ENDL, 0
msg_three: db 'Atleast it is already better than Windows 11.', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h