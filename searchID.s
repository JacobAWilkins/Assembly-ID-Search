/*H**************************************************************************
* FILENAME :        searchID.s
*
* DESCRIPTION :
*       Given a range of IDs, prints the names of people in that range 
*
* NOTES :
*       First, type the start ID
*       Next, type the end ID
*
*       Copyright 2017, Jacob Wilkins.  All rights reserved.
* 
* AUTHOR :    Jacob Wilkins        START DATE :    28 Apr 17
*
*H*/

  .global _start

_start:
  mov r3, #1
  mov r6, #10
  mov r10, #0
  mov r11, #0
  mov r4, #0
  mov r5, #0

  bl getNums
  bl convNums
  bl printNames

  bal _exit

_exit:
  mov r7, #1
  swi 0

getNums:
  mov r7, #3
  mov r0, #0
  mov r2, #4
  ldr r1, =numberA
  swi 0
  mov r10, r0

  mov r0, #0
  ldr r1, =numberB
  swi 0
  mov r11, r0

  bx lr

convNums:
  ldr r1, =numberA

_loopA: 
  cmp r3, r10
  beq _loopB
  ldrb r2, [r1], #1
  sub r2, r2, #48
  cmp r10, #4
  beq _hundredsA
  cmp r10, #3
  beq _tensA
  cmp r10, #2
  beq _onesA
  
_loopB:
  cmp r3, r11
  beq _return1
  ldrb r2, [r1], #1
  sub r2, r2, #48
  cmp r11, #4
  beq _hundredsB
  cmp r11, #3
  beq _tensB
  cmp r11, #2
  beq _onesB

_return1:
  mov r3, #0
  bx lr

_hundredsA:
  mul r9, r2, r6
  mov r12, r9
  mul r9, r12, r6
  add r4, r4, r9
  sub r10, r10, #1
  bal _loopA

_tensA:
  mul r9, r2, r6
  add r4, r4, r9
  sub r10, r10, #1
  bal _loopA

_onesA:
  add r4, r4, r2
  sub r10, r10, #1
  ldr r1, =numberB
  bal _loopA

_hundredsB:
  mul r9, r2, r6
  mov r12, r9
  mul r9, r12, r6
  add r5, r5, r9
  sub r11, r11, #1
  bal _loopB

_tensB:
  mul r9, r2, r6
  add r5, r5, r9
  sub r11, r11, #1
  bal _loopB

_onesB:
  add r5, r5, r2
  sub r11, r11, #1
  bal _loopB

printNames:
  ldr r1, =structures
  ldr r7, [r1, #12]
  ldr r8, [r1]

_loopC:
  cmp r3, #34
  beq _return2
  cmp r7, r4
  bge _greater

  add r1, r1, #16
  ldr r7, [r1, #12]
  ldr r8, [r1]
  add r3, r3, #1
  bal _loopC

_greater:
  cmp r7, r5
  ble _lesser

  add r1, r1, #16
  ldr r7, [r1, #12]
  ldr r8, [r1]
  add r3, r3, #1
  bal _loopC

_lesser:
  mov r7, #4
  mov r0, #1
  mov r2, #12
  swi 0
  mov r9, r1
  mov r2, #1
  ldr r1, =newLine
  mov r0, #1
  swi 0
  mov r1, r9

  add r1, r1, #16
  ldr r7, [r1, #12]
  ldr r8, [r1]
  add r3, r3, #1
  bal _loopC
  
_return2:
  bx lr

.data

numberA:
  .space 4

numberB:
  .space 4

newLine:
  .ascii "\n"

structures:
    .asciz "Aishwarya  "
    .word 20
    .asciz "Alexis     "
    .word 614
    .asciz "Andrew     "
    .word 500
    .asciz "Bora       "
    .word 275
    .asciz "Caleb      "
    .word 957
    .asciz "Carlos     "
    .word 999
    .asciz "Christopher"
    .word 64
    .asciz "Daniel     "
    .word 807
    .asciz "Francisco  "
    .word 420
    .asciz "George     "
    .word 16
    .asciz "Gerve-endy "
    .word 80
    .asciz "Gustavo    "
    .word 89
    .asciz "Hai        "
    .word 203
    .asciz "Irving     "
    .word 507
    .asciz "Ivan       "
    .word 188
    .asciz "Jacob      "
    .word 597
    .asciz "Jake       "
    .word 430
    .asciz "James      "
    .word 929
    .asciz "Jamie      "
    .word  7
    .asciz "Jeovanni   "
    .word 117
    .asciz "Kashif     "
    .word 386
    .asciz "Kenny      "
    .word 649
    .asciz "Kevan      "
    .word 21
    .asciz "Kyra       "
    .word 289
    .asciz "Luis       "
    .word 179
    .asciz "Matthew    "
    .word  4
    .asciz "Micah      "
    .word 851
    .asciz "Nhan       "
    .word 117
    .asciz "Nicholas   "
    .word 790
    .asciz "Phuoc      "
    .word 33
    .asciz "Thomas     "
    .word 130
    .asciz "Travis     "
    .word 429
    .asciz "Warren     "
    .word  1
    .asciz "William    "
    .word 123
