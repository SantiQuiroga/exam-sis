include macro.inc
.model small
.stack 100h
.data
.code
                   public show
                   public read
                   public atoi
read_char proc
                   mov    ah, 1
                   int    21h
                   ret
read_char endp

atoi proc
                   xor    ax, ax
                   xor    dx, dx
                   mov    bl, 10

    convert_loop:
                   mov    dl, [si]
                   sub    dl, 30h
                   imul   bl
                   add    al, dl
                   inc    si
                   loop   convert_loop

                   mov    dl, al
                   ret
atoi endp

read proc
                   xor    cx, cx

    read_loop:
                   call   read_char
                   cmp    al,13
                   je     exit_read
                   cmp    al,'0'
                   jl     read_loop
                   cmp    al,'9'
                   jg     read_loop
                   mov    [si], al
                   inc    si
                   inc    cx
                   jmp    read_loop

    exit_read:
                   mov  byte ptr [si], "$"
                   ret
read endp

show proc
                   mov    ah, 9
                   int    21h
                   ret
show endp
    end
