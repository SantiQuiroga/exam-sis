moves macro
             mov ax, @data
             mov ds, ax
endm

exit macro x
                   mov bx, x
                   mov ah, 4ch
                   int 21h
endm

show_str macro buffer
             lea  dx, buffer
             call show
endm
