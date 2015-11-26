.data
CipherText:
.word 0x615d3e2c
.word 0x32473f58
.word 0x3246391e
.word 0x60413901
.word 0x774d3358
.word 0x7c5b760b
.word 0x121a2f14

Buffer:
.space 32

SymmetricKey:
.word 0x12345678


.text
la	$a0, CipherText		#the address of the encoded message
li	$a1, 28			#length of the message
la	$a2, Buffer		#address of the Output buffer
la	$t0, SymmetricKey	#the key
lw	$a3, 0($t0)
jal EncryptDecrypt		#call the subroutine

la	$a0, Buffer		#print out the output string
li	$v0, 4
syscall

li	$v0, 10			#terminate nicely
syscall

EncryptDecrypt:
#initializes the iterator and length of loop in memory
.data
i: .word 0
length: .word 6

.text 
#loads iterator and length into $t1 and $t2 respectively 
lw $t1, i
lw $t2, length

##la	$t3, CipherText		#pointer to the the encoded message
##la	$t4, Buffer		#pointer to the Output buffer

loopStart:
bgt $t1, $t2  exitLoop  # exits the loop if iterator is greater than length

lw $t3, 0($a0) # load the value of the memory at address $a0 into $t3
xor $t3,$a3,$t3 # XOR ($a3)(the key) with ($t3)(the ciphertext) and store it back into $t3
sw $t3 0($a2) # store the dectypted $t3 into the output buffer (memory address of $a2)

addi $a0, $a0, 4  # increases the location of the pointer to the cipher text by 4 words
addi $a2, $a2, 4  # increases the location of the pointer to the output buffer by 4 words

addi $t1, $t1, 1   # increments the iterator


j loopStart #restarts the loop

exitLoop:
jr $ra
