# just another program
.data
datay : .float 0.0
data1 : .float 2.0
data2 : .float 3.0
datam : .float 3.14
datan : .float 1.45

.text
main:
	l.s $f0, data1
	l.s $f1, data2
	l.s $f2, datam
	l.s $f3, datan
	
	mul.s $f4, $f2, $f0
	div.s $f5, $f3, $f1
	add.s $f4, $f4, $f5
	
	s.s $f4, datay
	
	li $v0, 10
	syscall
