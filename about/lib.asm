include macro.inc
.model small
.stack 100h
.data
.code
                   public show
show proc
                   mov    ah, 9
                   int    21h
                   ret
show endp
    end
