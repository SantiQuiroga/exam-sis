include macro.inc
.model small
.data
.code
                   public  read
                   public  show
                   public  triangle
                   public  square
                   public  atoi
                   public  itoa
read_char proc
                   mov     ah, 1
                   int     21h
                   ret
read_char endp

read proc
                   xor     cx, cx

    read_loop:      
                   call    read_char
                   cmp     al,13
                   je      exit_read
                   cmp     al,'0'
                   jl      read_loop
                   cmp     al,'9'
                   jg      read_loop
                   mov     [si], al
                   inc     si
                   inc     cx
                   jmp     read_loop

    exit_read:      
                   ret
read endp

show proc
                   mov     ah, 9
                   int     21h
                   ret
show endp

triangle proc
                   sub     al, dl
                   mov     cl, al
                   mov     dl, bl
                   dec     cl

    triangle_loop:  
                   add     bl, dl
                   loop    triangle_loop

                   mov     ax, bx
                   mov     bl, 2
                   div     bl
                   mov     dl, al

                   ret
triangle endp

square proc
                   mov     cl, bl
                   mov     dl, al
                   dec     cl

    square_loop:     
                   add     al, dl
                   loop    square_loop
                   ret
square endp

atoi proc
                   xor     ax, ax
                   xor     dx, dx
                   mov     bl, 10

    convert:  
                   mov     dl, [si]
                   sub     dl, 30h
                   imul    bl
                   add     al, dl
                   inc     si
                   loop    convert

                   mov     dl, al
                   ret
atoi endp

itoa proc
                   xor     cx, cx
                   push    dx
    count:  
                   inc     cx
                   mov     ax, dx
                   mov     bl, 10
                   div     bl
                   mov     dl, al
                   cmp     dx, 0
                   jnz     count
                   pop     dx
                   add     si, cx
                   mov     byte ptr [si], '$'
    continue:       
                   dec     si
                   mov     ax, dx
                   mov     bl, 10
                   div     bl
                   add     ah, 30h
                   mov     [si], ah
                   mov     dl, al
                   cmp     dx, 0
                   jnz     continue
                   ret
itoa endp
end
