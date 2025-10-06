.data
msg_input1: .asciiz "Enter the first number: "
msg_input2: .asciiz "Enter the second number: "
msg_result: .asciiz "Or bitwise: "

.text
main:
    # Impressão da mensagem e leitura do primeiro numero
    li $v0, 4
    la $a0, msg_input1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0 # guarda o 1o numero em $t1

    # Impressão da mensagem e leitura do segundo numero
    li $v0, 4
    la $a0, msg_input2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0 # Guarda o 2o numero em $t2

    or $t3, $t1, $t2 # $t3 = $t1 | $t2
    

    li $v0, 4
    la $a0, msg_result

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
