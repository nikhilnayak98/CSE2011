# binary to gcd
.data
num : .byte 10

.text
main:

lb $t0,num
srl $t1,$t0,1
sra $t2,$t0,1

xor $t3, $t1, $t0
xor $t4, $t2, $t0


li $v0,10
syscall
