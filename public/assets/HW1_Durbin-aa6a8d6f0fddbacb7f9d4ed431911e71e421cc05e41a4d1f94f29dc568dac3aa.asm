.data
anData:
	.space 40
strBadAddr:
	.asciiz "The string address in $a0 has been changed."
strBada1:
	.asciiz "the value of $a1 has been changed."
strBada2:
	.asciiz "the value of $a2 has been changed."
strBadArray:
	.asciiz "The values in the array are not correct"
strDone:	
	.asciiz "Good Job!  You're done."
	
.text
la	$a0, anData
li	$a1, 10
li	$a2, 'A'
jal aryfill
#check results
li	$t4, 0
la	$t0, anData
beq	$a0, $t0, L1
li	$t4, 1
la	$a0, strBadAddr
li	$v0, 4
syscall
L1:
li	$t1, 10
beq	$a1, $t1, L2
li	$t4, 1
la	$a0, strBada1
li	$v0, 4
syscall
L2:
li	$t2, 'A'
beq	$a2, $t2, L3
li	$t4, 1
la	$a0, strBada2
li	$v0, 4
syscall
L3:
la	$t0, anData
la	$t1, anData
addi	$t1, $t1, 40
li	$t2, 'A'
L4:
lw	$t3, 0($t0)
beq	$t2, $t3, L5
li	$t4, 1
la	$a0, strBadArray
li	$v0, 4
syscall

L5:
addi	$t0, $t0, 4
bne	$t0, $t1, L4
bne	$t4, $0, L6
la	$a0, strDone
li	$v0, 4
syscall
L6:
li	$v0, 10 # terminate the program
syscall


aryfill:
#your code here
#Base idea for code comes from https://www.youtube.com/watch?v=ls4QpZD2Cow 
# and rewritten for this project

#initializes the iterator and length of loop in memory
.data
i: .word 0 
length: .word 9

.text 
#loads iterator and length into $t1 and $t2 respectively 
lw $t1, i
lw $t2, length
la $t3, anData # sets $t3 register to the memory address of .space

loopStart:
bgt $t1, $t2  exitLoop  # exits the loop if iterator is greater than length
sw $a2, 0($t3) #stores 'A' into $t3 which is the location of the pointer in the array 
addi $t3, $t3, 4  # increases the location of the pointer by 4 words
addi $t1, $t1, 1   # increments the iterator


j loopStart #restarts the loop

exitLoop:

jr $ra # exit the subroutine
