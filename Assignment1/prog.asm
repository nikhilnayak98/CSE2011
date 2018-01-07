.data
data1: .byte 6
data2: .half 5
data3: .word 10

.text
main:
li $t0, 56
lb $t2, data1
lh $t3, data2
lw $t4, data3

li $v0, 10
syscall
