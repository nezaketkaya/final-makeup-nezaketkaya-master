;Student Number 2020555037
;Student Name and Surname nezaket Kaya
;Github Username nezaketkaya


mov ax, 0100h
mov ds, ax
mov es, ax
mov di, 2000h

lea si, number 

call Store   

mov ax, 0200h
mov es, ax
mov si, 2000h
mov di, 2000h 

call Move     

mov di,2000h
lea bx, [di]
mov ah, 0eh  

call Display 


finish:
mov ah, 4ch
int 21h

Store proc 
    
    push ax
    push bx
    pushf
    
    str:
    mov cx, 10
    lodsb
    stosb
    cmp al, 0
    jne str  
    
    pop bx
    pop ax
    popf
    ret
Store endp





Move proc
    push ax
    push bx
    pushf
    
    mov cx, 10
    rep movsb 
    
    pop bx
    pop ax
    popf
    ret
    
Move endp

Display proc
    
    push ax
    push bx
    pushf
    
    dnum:
    mov al, [bx]
    cmp al, 0
    je Comparison
    int 10h
    inc bx
    jmp dnum
    
    Comparison:
    mov di, 2006h
    lea bx, [di]
    mov al, [bx]
    cmp al, '6'
    je E2
    jne E1
    
    E1: 
    
    lea bx, morning
    
    DE1:
    mov al, [bx]
    cmp al, 0
    je finish
    int 10h
    inc bx
    jmp DE1 
    
    E2:
    
    lea bx, evening 
    
    DE2:
    mov al, [bx]
    cmp al, 0
    je finish
    int 10h
    inc bx
    jmp DE2
    
    pop bx
    pop ax
    popf
    ret
    
Display endp   

number db '2020555037', 0
morning db ' Morning', 0
evening db ' Evening', 0