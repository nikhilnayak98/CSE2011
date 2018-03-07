# Copy string to another string
.data
	msg1 : .asciiz "Enter a string - "
	msg2 : .asciiz "\nString - "
	str : .word 0
	buffer : .space 20

.text
main:
	la $a0, msg1
	li $v0, 4
	syscall
	
	li $v0, 8
	
	la $a0, buffer
	li $a1, 20
	
	move $t0, $a0
	syscall
	
	la $a0, msg2
	li $v0, 4
	syscall
	
	lw $t0, str
	
	la $a0, buffer
	move $v0, $t0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
