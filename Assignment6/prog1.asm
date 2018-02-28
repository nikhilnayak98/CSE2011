# Reverse the elements in an array using stack
.data
array : .word 1, 2, 3, 4

.text
.globl main
.ent main
main:
	la $a0, array
	
	li $t2, 0
	li $t1, 4
	
	L0:
		sll $t3, $t2, 2
		add $a2, $t3, $a0
		lw $a1, ($a2)
		blt $t2, $t1, L2
		
	L1:
		sub $t2, $t2, 1
		lw $s0, ($sp)
		sw $s0, ($a0)
		add $a0, $a0, 4
		addi $sp, $sp, 4
		bnez $t2, L1
		
		j EXIT
	
	L2:
		addi $sp, $sp, -4
		sw $a1, ($sp)
		add $t2, $t2, 1
		
		j L0 
	
	EXIT:
		li $v0, 10
		syscall
	
		  
