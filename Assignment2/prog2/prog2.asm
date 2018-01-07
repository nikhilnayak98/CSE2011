.data
as: .word 1
bs: .word 2
cs: .word 3
ds: .word 4

.text
main:
lw $t5, bs
lw $t6, cs
lw $t7, as
lw $t8, ds
div $t3,$t5,$t6
mul $t1,$t8,$t8
add $t2,$t7,$t3
sub $t4,$t2,$t1
li $v0,10
syscall 
