.main: @CS17BTECH11036
  movu r0,777

  cmp r0,0 @0 is not dudeney/factorian number since it is not a positive integer/natural number by definiton.
  beq .exception
  b .factorion

.factorion:
  mov r3,r0 @r3 copies r1
  mov r4,0 @r4 will have sum of factorials of digits
  mov r5,0 @individual factorials will be stored
  .loop_f:
    add r4,r4,r5 @factorials of digits stored in r5 will be added to that of r4's value
    mod r5,r3,10 @r5 has last digit of r3
    mov r6,r5 @copy of r5
    cmp r3,0 @if any digits are left
    beq .final_f
    div r3,r3,10
    .factorial:
      cmp r6,0
      beq .zero_fac @calculate factorial of next digit if done
      cmp r6,1
      beq .loop_f @calculate factorial of next digit if done
      sub r6,r6,1
      mul r5,r5,r6
      b .factorial

  @check factorian number condition
  .final_f:
    cmp r4,r0
    beq .answer_f
    mov r1,0 @if not factorion
    b .dudeney @ now check if given number is a dudeney number
    .answer_f:
      mov r1,1 @number is factorion
      b .dudeney @ now check if given number is a dudeney number

.zero_fac:
  mov r5,1
  b .loop_f @continue after assigning 0!

.dudeney:
  mov r3,r0 @r3 copies r1
  mov r4,0 @will contain the sum of digits
  mov r5,0 @initialize
  .loop_d:
    mod r5,r3,10 @get last digit in r5
    add r4,r4,r5
    div r3,r3,10 @remove last digit
    cmp r3,0 @check if number is still greater than 0
    bgt .loop_d
    @now r3 is 0 and r4 contains sum of digits

  @get cube of the number
  mov r5,r4 @since r5 was a dummy variable we can replace it with a copy of r4
  mul r4,r4,r4 @r4 has the square
  mul r4,r4,r5 @r4 has the cube

  @check dudeney number condition
  cmp r4,r0
  beq .answer_d
  mov r2,0 @ if not dudeney number
  b .final_d
  .answer_d:
    mov r2,1
    b .final_d

.exception:
  mov r1,0
  mov r2,0
  b .final_d

.final_d:
  .print r1,r2
