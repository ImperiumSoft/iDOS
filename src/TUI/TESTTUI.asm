%include "src/core.asm"
%include "src/functions/clear.asm"

section .data
    cmd_tui_test: db `tui\0`
    full_line: db `********************************************************************************\0`
    empty_line: db `                                                                                \0`
    triple_asterisk: db `***\0`
    triple_asterisk_empty: db `                                                                          \0`
    asterisk: db `*\0`
    asterisk_empty: db `                                                                              \0`
    title: db ` iDOS TUI Test                                                            \0`
    option_one: db ` <Option 1>                                                                   \0`
    option_two: db ` <Option 2>                                                                   \0`

section .text
    tui_run:
        call func_clear
        mov dl, 0
        mov dh, 0
        jmp .run

        .run:
            cmp dh, 0
            je .renderZero

            mov ah, 0h
            int 16h

            cmp ah, 1
            je .ret

            cmp ah, 17
            je .w

            cmp ah, 31
            je .s

            jmp .run


        .ret:
            call func_clear
            ret

        .w:
            ;write text_one
            ;jmp .run

            jmp .upHandle

        .s:
            ;write text_two
            ;jmp .run

            jmp .downHandle

        .upHandle:
            cmp dl, 1
            je .setZero

            cmp dl, 0
            je .setOne

        .downHandle:
            cmp dl, 0
            je .setOne

            cmp dl, 1
            je .setZero

        .setZero:
            mov dl, 0
            jmp .renderZero

        .setOne:
            mov dl, 1
            jmp .renderOne

        .renderZero:
            call func_clear
            cwrite full_line, 2
            cwrite triple_asterisk, 2
            write title
            cwrite triple_asterisk, 2
            cwrite full_line, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2

            cwrite asterisk, 2
            cwrite option_one, 3
            cwrite asterisk, 2

            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2

            cwrite asterisk, 2
            write option_two
            cwrite asterisk, 2

            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite full_line, 2

            cmp dh, 0
            je .firstHandle

            jmp .run

        .firstHandle
            mov dh, 1
            jmp .run

        .renderOne:
            call func_clear
            cwrite full_line, 2
            cwrite triple_asterisk, 2
            write title
            cwrite triple_asterisk, 2
            cwrite full_line, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2

            cwrite asterisk, 2
            write option_one
            cwrite asterisk, 2

            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2

            cwrite asterisk, 2
            cwrite option_two, 3
            cwrite asterisk, 2

            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite asterisk, 2
            write asterisk_empty
            cwrite asterisk, 2
            cwrite full_line, 2

            jmp .run