# surface area and volume
.data
pi : .float 3.14
surfacearea : .float 0.0
volume : .float 0.0
radius : .float 2.2
four : .float 4.0
three : .float 3.0

.text
main:
	l.s $f0, radius
	l.s $f1, pi
	l.s $f2, four
	l.s $f3, three
			
	mul.s $f4, $f0, $f0
	mul.s $f4, $f1, $f4
	mul.s $f4, $f4, $f2
	
	s.s $f4, surfacearea
	
	mul.s $f5, $f4, $f0
	div.s $f5, $f5, $f3
	
	s.s $f5, volume
	
	li $v0, 10
	syscall 
