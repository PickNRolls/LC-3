.ORIG x3000

ST R5, SaveR5

AND R0, R0, #0
ADD R0, R0, #10
JSR PUSH

ADD R0, R0, #10
JSR PUSH

ADD R0, R0, #15
JSR PUSH

AND R0, R0, #0
JSR PUSH

JSR POP
JSR POP
JSR POP
LD R5, SaveR5
HALT

PUSH      ST R4, SaveR4
          ST R6, SaveR6
          AND R4, R4, #0
          LD R5, OverflowCheck
          LD R6, StackBase

          NOT R5, R5
          ADD R5, R5, #1
          ADD R4, R6, R5
          BRz FLOWEXCEPTION
          ADD R6, R6, #-1
          STR R0, R6, #0
          BRnzp SUCCESSEXIT

POP       ST R4, SaveR4
          ST R6, SaveR6
          AND R4, R4, #0
          LD R5, UnderflowCheck
          LD R6, StackBase

          ADD R4, R6, R5
          BRz FLOWEXCEPTION
          LDR R0, R6, #0
          ADD R6, R6, #1

SUCCESSEXIT    LD R4, SaveR4
               ST R6, StackBase
               LD R6, SaveR6
               AND R5, R5, #0
               RET

FLOWEXCEPTION  LD R4, SaveR4
               LD R6, SaveR6
               AND R5, R5, #0
               ADD R5, R5, #1
               RET

StackBase      .FILL x4000
OverflowCheck  .FILL x3FFC
UnderflowCheck .FILL xC000
SaveR4         .BLKW #1
SaveR5         .BLKW #1
SaveR6         .BLKW #1

.END