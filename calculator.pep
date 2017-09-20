; Mimi Schirm
; CS/IS 165 Lab1


br                main

input:            .ascii "\nInput number: \x00"
num:              .block 2
num2:             .block 2 
result:           .block 2
ans:              .ascii "\nAns = \x00"    


menu:             .ascii "\nCalculator\n"
                  .ascii "\n A - ADD"
                  .ascii "\n S - SUB"
                  .ascii "\n N - NEG"
                  .ascii "\n Q - Quit\n\x00"
choice:           .ascii "\n\nInput Option: \x00"
invalid:          .ascii "\nInvalid!\x00"


ch:               .block 1
chari:            .equate 0xfc15 ; point to input character


main:             stro menu,d


loop:             stro choice,d
                  ldba chari,d ; input a character
                  stba ch, d   ; save character
                  ldba chari,d ; eat newline
                  ldba ch,d    ; restore character
                  cpba 'a', i  ; if (ch == 'a')
                  brne endif1  ; not equal, skip block
                  stro input, d ; equal to, start block of code 
                  deci num2, d
                  ldwa result, d
                  adda num2, d
                  stwa result, d
                  stro ans, d
                  deco result, d
                  br loop


         
endif1:           cpba 's', i  ; if (ch == 's')
                  brne endif2  ; not equal, skip block
                  stro input, d ; equal to, start block of code
                  ldba '\n', d
                  deci num2, d
                  ldba '\n', d
                  stbx num2, d
                  ldba '\n', i
                  ldwa result, d
                  suba num2, d
                  stwa result, d
                  stro ans, d
                  deco result, d
                  br loop
     

endif2:           cpba 'n', i  ; if (ch == 'n')
                  brne endif3
                  ldwa result, d
                  nega
                  stwa result, d
                  stro ans, d
                  deco result, d
                  br loop
         
endif3:           stro invalid,d ; print error
                  br loop

                  .end         
