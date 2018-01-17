# B[8] = A[i - j]

.data
arrayB : .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arrayA : .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
datai : .word 4
dataj : .word 2

.text
main:
	lw $s2, datai
	lw $s3, dataj

	sub $s4, $s2, $s3

	la $s0, arrayA
	la $s1, arrayB

	mul $t0, $s4, 4
	add $t0, $t0, $s0
	
	lw $t3, ($t0)
	sw $t4, 32($s1)
	
	li $v0, 10
	syscall
	
