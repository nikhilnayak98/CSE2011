.data
data1 : .byte 1
data2 : .byte 6
data3 : .byte 3
data4 : .byte 4
dat1 : .byte 0xfa
dat2 : .byte 0x0f
dat3 : .byte 0xf0

.text
main:

lb $t0,data1
lb $t1,data2

li $t9,10
div $t0, $t9

# Swapping

lbu $t2,dat1

lbu $s3,dat2
lbu $s4,dat3

and $s0,$t2,$s3
and $s1,$t2,$s4

sll $s0,$s0,4
srl $s1,$s1,4

or $s1,$s0,$s1

sb $s1, data3

# end

addi $t4,$t0,5

addi $t6,$t1,-5

li $t7,2
mul $t8,$t7,$s1 

and $t3, $t6, $t4
or $t0, $t3, $t8
neg $t0,$t0

sb $t0, data4

li $v0,10
syscall
