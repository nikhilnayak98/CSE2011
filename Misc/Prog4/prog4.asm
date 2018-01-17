# B[8] = A[i] + A[j]

.data
arrayB : .half 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arrayA : .half 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
datai : .half 2
dataj : .half 3

.text
main:
	lh $s2, datai
	lh $s3, dataj

	la $s0, arrayA
	la $s1, arrayB

	mul $t0, $s2, 2
	mul $t2, $s3, 2

	add $t0, $t0, $s0
	add $t2, $t2, $s1

	lh $t3, ($t0)
	lh $t4, ($t2)

	add $t5, $t3, $t4

	sh $t5, 32($s1)

	li $v0, 10
	syscall
