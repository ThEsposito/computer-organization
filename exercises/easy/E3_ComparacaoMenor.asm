.data
msg_input1: .asciiz "Enter the first number: "
msg_input2: .asciiz "Enter the second number: "
msg_result: .asciiz "Smallest number: "

.text
main:
    li $v0, 4
    la $a0, msg_input1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 # $t0 = $a0

    li $v0, 4
    la $a0, msg_input2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0 # $t1 = $v0

    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    blt $t1, $t0, n2_eh_menor # if $t1 < $t0 then goto n2_eh_menor
    
n1_eh_menor:
    move $a0, $t0
    syscall

    j fim_programa

n2_eh_menor:
    move $a0, $t1
    syscall

fim_programa:
    li $v0, 10
    syscall
