# B[8] = A[i] + A[j]

.data
arrayB : .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arrayA : .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
datai : .word 2
dataj : .word 3

.text
main:
	lw $s2, datai
	lw $s3, dataj

	la $s0, arrayA
	la $s1, arrayB

	mul $t0, $s2, 4
	mul $t2, $s3, 4

	add $t0, $t0, $s0
	add $t2, $t2, $s1

	lw $t3, ($t0)
	lw $t4, ($t2)

	add $t5, $t3, $t4

	sw $t5, 32($s1)

	li $v0, 10
	syscall
