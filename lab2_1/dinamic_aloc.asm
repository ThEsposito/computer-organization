.data
idades: .word 12, 18, 25, 30, 22, 27, 40, 35, 55, 60, 45, 50, 32, 29, 23 
msg_soma: .asciiz "\nSoma das idades = "

.text
main:
    li $t0, 15  # Tamanho do array
    li $t1, 0   # Contador: i = 0
    li $t2, 0   # Variavel acumuladora: soma = 0
    li $t3, 0   # Deslocamento

loop:
    bge $t1, $t0, next  # if(i >= size) break;
    lw $t4, idades($t3) # Recebe idades[i]
    add $t2, $t2, $t4   # soma += idades[i]
    addi $t3, $t3, 4    # deslocamento += 4 (tamanho de um word)
    addi $t1, $t1, 1    # i += 1
    
    j loop

next:
    # Exibicao do resultado:
    li $v0, 4
    la $a0, msg_soma
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Exit
    li $v0, 10
    syscall