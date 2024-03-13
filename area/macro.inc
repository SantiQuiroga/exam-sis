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

number macro str_number
                    lea  si, str_number
                    call read
                    lea  si, str_number
                    call atoi
endm

ascii macro buffer
                    lea  si, buffer
                    call itoa
endm
