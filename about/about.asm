include macro.inc
.model small
     extrn show:near
.stack 100h
.data
    about_str db 10, 13, "Made By: Santiago Quiroga", 10, 13
              db "$"
.code
    main: 
          moves
          call     about
          exit     0

about proc
          show_str about_str
          ret
about endp
    end main
