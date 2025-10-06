.data
msg_read_idx: .asciiz "\nEnter index: "
msg_arr: .asciiz "\nArray[i] = "
array: .word 10, 20, 30, 40, 50
msg_illegal_idx: .asciiz "\nThe input must be between 0 and 4. Try again!"

.text
main:
    la $s0, array # $s0 contains array's base address

    # Read idx ($s1)
    li $v0, 4
    la $a0, msg_read_idx
    syscall

    li $v0, 5
    syscall
    move $s1, $v0 # Store idx at $s1
    
    # Branch if reads an illegal idx (and ask it again)
    blt $s1, 0, illegal_idx
    bgt $s1, 4, illegal_idx


    # Calculo do deslocamento ($s3): deslocamento = idx * 4
    mul $s3, $s1, 4 # 4 eh o tamanho em bytes de um word

    lw $s4, array($s3) # Carrega em $s4 o conteudo de endereco_base + deslocamento
    
    # Prints the value
    li $v0, 4
    la $a0, msg_arr
    syscall

    li $v0, 1
    move $a0, $s4
    syscall

    # Ends the program
    li $v0, 10
    syscall    
    
illegal_idx:
    li $v0, 4
    la $a0, msg_illegal_idx
    syscall

    j main
