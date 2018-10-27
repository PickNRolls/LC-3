.ORIG x3000

ST R1, SaveR1
ST R2, SaveR2
ST R3, SaveR3

Start LD    R2, Newline
      D1    LDI R1, DSR
                BRzp D1
      STI   R2, DDR
      LEA   R1, Prompt

Loop  LDR   R0, R1, #0
      BRz   Input
      D2    LDI R3, DSR
                BRzp D2
      STI   R0, DDR
      ADD   R1, R1, #1
      BRnzp Loop

Input LDI   R3, KBSR
      BRzp  Input
      LDI   R0, KBDR

D3    LDI   R3, DSR
      BRzp  D3
      STI   R0, DDR

D4    LDI   R3, DSR
      BRzp  D4
      STI   R2, DDR
      LD    R1, SaveR1
      LD    R2, SaveR2
      LD    R3, SaveR3

HALT

SaveR1 .BLKW #1
SaveR2 .BLKW #1
SaveR3 .BLKW #1

DDR  .FILL xFE06
DSR  .FILL xFE04
KBDR .FILL xFE02
KBSR .FILL xFE00

Newline .FILL x000A
Prompt  .STRINGZ "Input> "

.END