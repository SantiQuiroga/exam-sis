include macro.inc
.model small
    extrn read:near
    extrn show:near
    extrn itoa:near
    extrn atoi:near
    extrn square:near
    extrn triangle:near
.stack 100h
.data
    title_str  db "Calculate The Area:", 10, 13
               db "$"
    a_str      db "A: $"
    b_str      db "B: $"
    c_str      db "C: $"
    ans_str    db "The Area: $"
    number_str db 50 dup ("$")
    area       db 50 dup ("$")
.code
    main:
         moves
         show_str title_str
         show_str a_str
         number   number_str
         push     dx ; a to stack
         show_str b_str
         number   number_str
         push     dx ; b to stack
         show_str c_str
         number   number_str ; c to dx
         pop      bx ; b to bx
         pop      ax ; a to ax
         push     bx ; b to stack
         push     dx ; c to stack
         call     triangle ; calculates triangle area to dx
         pop      bx ; b to bx
         pop      ax ; a to ax
         push     dx ; triangle area to stack
         call     square ; calculates square area to ax
         pop      dx ; triangle area to dx
         add      dl, al ; adds triangle area to square area
         ascii    area ; converts area to ascii
         show_str ans_str
         show_str area ; shows area
         exit     0
  end main
