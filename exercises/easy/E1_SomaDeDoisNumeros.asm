.data
msg_input1: .asciiz "Enter the first number: "
msg_input2: .asciiz "Enter the second number: "
msg_result: .asciiz "Result: "

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

    add	$t3, $t1, $t2 # $t3 = $t1 + $t2
    
    # Impressao do resultado
    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10 # Exit code
    syscall
