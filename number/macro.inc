moves macro
             mov ax, @data
             mov ds, ax
endm

exit macro status
                   mov bx, status
                   mov ah, 4ch
                   int 21h
endm

show_str macro str
             lea  dx, str
             call show
endm

number macro buffer
                   lea  si, buffer
                   call read
                   lea  si, buffer
                   call atoi
endm

time macro
                mov ah, 00h
                int 1AH
endm
