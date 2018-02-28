# Simple calculation using procedures
.data
mes : .asciiz "\n1 : Addition \n2 : Subtraction\n3 : Multiplication\n4 : Division\n5 : Power"
mes1 : .asciiz "\nEnter z : "
mes2 : .asciiz "\nOut of bound"
mes3 : .asciiz "\nEnter x : "
mes4 : .asciiz "\nEnter y : "
ans :  .word 0
mes5 : .asciiz "\nResult : "

.text
.globl main
.ent main
main:	
	li $t3, 1
	li $t4, 2
	li $t5, 3
	li $t6, 4
	li $t7, 5

	li $v0, 4
	la $a0, mes
	syscall

	li $v0, 4
	la $a0, mes1
	syscall

	li $v0, 5
	syscall 
	move $t0, $v0
	
	blez $t0, label1
	bgt $t0, $t7, label1

	li $v0, 4
	la $a0, mes3
	syscall

	li $v0, 5
	syscall 
	move $t1, $v0

	li $v0, 4
	la $a0, mes4
	syscall

	li $v0, 5
	syscall 
	move $t2, $v0
	
	beq $t0, $t3, label2
	beq $t0, $t4, label3
	beq $t0, $t5, label4
	beq $t0, $t6, label5
	beq $t0, $t7, label6
	
label2: 
	jal addition
	
	li $v0, 4
	la $a0, mes5
	syscall
	
	move $a0, $s0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
label3: 
	jal subtract
	
	sw $s0, ans
	
	li $v0, 4
	la $a0, mes5
	syscall
	
	move $a0, $s0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
label4: 
	jal multiply
	
	sw $s0, ans
	
	li $v0, 4
	la $a0, mes5
	syscall
	
	move $a0, $s0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
label5: 
	jal divide
	
	sw $s0, ans
	
	li $v0, 4
	la $a0, mes5
	syscall
	
	move $a0, $s0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

label6: 
	jal power
	
	sw $s2, ans
	
	li $v0, 4
	la $a0, mes5
	syscall
	
	move $a0, $s2
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

label1: 
	li $v0, 4
	la $a0, mes2
	syscall

.globl addition
.ent addition
addition:
	add $s0, $t1, $t2
	jr $ra
.end addition

.globl subtract
.ent subtract
subtract:
	sub $s0, $t1, $t2
	jr $ra
.end subtract

.globl multiply
.ent multiply
multiply:
	mul $s0, $t1, $t2
	jr $ra
.end multiply
		
.globl divide
.ent divide
divide:
	div $s0, $t1, $t2
	jr $ra
.end divide
		
.globl power
.ent power
power:
	li $s2, 1
	li $s1, 0

	l1:
		mul $s2, $s2, $t1
		addi $s1, $s1, 1
		blt $s1, $t2, l1
		jr $ra
.end power
