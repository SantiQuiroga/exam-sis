include macro.inc
.model small
     extrn show:near
     extrn read:near
     extrn atoi:near
.stack 100h
.data
    title_str db "Guess My Number It's Between 1 - 100", 10, 13
              db "$"
    enter_str db 10, 13, "Enter Your Number: $"
    won       db 10, 13, "You Won", 10, 13
              db "$"
    answer    db 10 dup ("$")
.code
    main:     
              moves
              call     guess
              exit     0

guess proc
              show_str title_str
              call     random
              push     dx

    game:     
              show_str enter_str
              number   answer
              pop      ax
              cmp      al, dl
              je       exit_loop
              push     ax
              jmp      game

    exit_loop:
              show_str won
              ret
guess endp

random proc
              time
              mov      ax, dx
              and      ax, 0FFh
              xor      dx, dx
              mov      bl, 100
              div      bl
              mov      dl, ah
              add      dl, 1
              ret
random endp
    end main