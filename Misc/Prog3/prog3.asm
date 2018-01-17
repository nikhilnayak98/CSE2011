# C[4] = A[4] + B[4]

.data
arrayC : .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arrayB : .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arrayA : .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
main:
	la $s0, arrayA
	la $s1, arrayB
	la $s2, arrayC

	lw $t0, 16($s0)
	lw $t1, 16($s1)

	add $t2, $t0, $t1

	sw $t3, 16($t2)

	li $v0, 10
	syscall
