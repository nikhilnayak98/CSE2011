# sum and average of n numbers
.data
msg : .asciiz "Enter value of n\n"
msgsum : .asciiz "\nSum -\n"
msgavg :  .asciiz "\nAverage -\n"
sum : .word 0
avg : .float 0.0

.text
main:
	la $a0, msg
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $t1, 0
	
	move $t3, $t0
	
	L1:	
		li $v0, 5
		syscall
		
		move $t4, $v0
		
		add $t1, $t1, $t4
		
		addi $t3, $t3, -1
		
		bne $t3, $0, L1
		
		j Exit
	
	Exit:	
		sw $t1, sum
		
		la $a0, msgsum
		li $v0, 4
		syscall
		
		la $a0, ($t1)
		li $v0, 1
		syscall
		
		mtc1 $t1, $f1
		mtc1 $t0, $f2
		
		cvt.s.w $f3, $f1
		cvt.s.w $f4, $f2
		
		div.s $f5, $f3, $f4
		
		s.s $f5, avg
		
		la $a0, msgavg
		li $v0, 4
		syscall
		
		l.s $f12, avg
		li $v0, 2
		syscall
		
		li $v0, 10
		syscall
