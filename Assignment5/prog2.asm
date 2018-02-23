# Counting the number of ones present in a data byte
.data
data1: .byte 0
msg : .asciiz "Enter a byte data\n"
msgt: .asciiz "\nNumber of 1s - \n"

.text
main:
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $t3, 0
	li $t7, 1
	li $t8, 10
	
	L1:
		beq $t0, $zero, Exit
		rem $t2, $t0, $t8
		div $t0, $t0, $t8
		beq $t2, $t7, CTR
		j L1

	CTR:
		addi $t3, $t3, 1
		j L1
	
	Exit:
		la $a0, msgt
		li $v0, 4
		syscall
		
		la $a0, ($t3)
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
