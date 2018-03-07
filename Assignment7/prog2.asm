# Convert string to 10 digit number
.data
	msg : .asciiz "Enter a 10 digit number - "
	convertednumber : .word 0
	buffer : .space 11

.text
.globl main
.ent main
main:
	li $t1, 48
	li $t2, 0
	li $t3, 10
	li $t5, 0
	
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 8
	
	la $a0, buffer
	li $a1, 11
	
	move $t9, $a0
	syscall
	
	lb $t0, ($a0)

L0:	
	bne $t0, $t1, L1
	
	sub $t3, $t3, 1
	
	li $s0, 1
	li $s1, 1

L4:
	ble $s0, $t3, L3
	
	mul $t4, $t2, $s1
	
	add $t5, $t5, $t4
	
	bnez $t3, L2
	
	j EXIT

L3:
	mul $s1, $s1, 10
	
	add $s0, $s0, 1
	
	j L4

L1:
	add $t1, $t1, 1
	add $t2, $t2, 1
	
	ble $t2, 10, L0

L2:
	add $a0, $a0, 1
	
	lb $t0, ($a0)
	
	li $t1, 48
	li $t2, 0
	
	j L0
		
EXIT:
	sw $t5, convertednumber
	
	li $v0, 10
	syscall
