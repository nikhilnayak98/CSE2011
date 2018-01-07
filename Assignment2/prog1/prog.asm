.data
aside: .word 1
bside: .word 2
cside: .word 3

.text
main:
lw $t0,aside
lw $t1,bside
lw $t2,cside
mul $t3,$t1,$t0
mul $t4,$t2,$t1
mul $t5,$t0,$t2
add $t7,$t3,$t4
add $t8,$t5,$t7
mul $t8,$t8,2
li $v0,10
syscall
