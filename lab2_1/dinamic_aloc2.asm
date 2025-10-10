.data:
    msg_n: .asciiz "Quantas pessoas?: "
    msg_idades: .asciiz "Digite as idades: \n"
    msg_menor: .asciiz "\nMenor idade: "
    msg_maior: .asciiz "\nMaior idade: "

.text:
main:
    li $v0, 4
    la $a0, msg_n # print(msg_n)
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 # int n = $v0
    
    li $v0, 4
    la $a0, msg_idades # print(msg_idades)
    syscall

    li $t2, 0  # int i = 0

    mul $t1, $t0, 4 # Quantidade de bytes a serem alocados

    # Espaco a ser alocado (n_bytes):
    li $v0, 9 # Codigo para sbrk
    move $a0, $t1 # Alocando n*4 bytes
    syscall

    move $t3, $v0
    move $t4, $t3
# Variaveis:
# n: $t0
# n_bytes: $t1
# i: $t2
# endereco_atual_array: $t3 (Vou iterar de 4 em 4 para alocar)
# endereco_atual_array: $t4 (Vou iterar de 4 em 4 para o 2o loop)
# maior: $t5
# menor: $t6
# idade: $t7

loop_aloc_dinamica:
    bge $t2, $t0, fim_aloc # if(i >= n) break;

    # Leitura da i-esima idade (fica em $v0)
    li $v0, 5
    syscall

    sw $v0, ($t3) # idades[i] recebe i-esima idade
    add $t2, $t2, 1 # i += 1
    add $t3, $t3, 4 # Incrementa o endereco atual do array em 4

    j loop_aloc_dinamica

fim_aloc:
    li $t2, 0 # i = 0
    lw $t5, 0($t4) # int maior = idades[0]
    lw $t6, 0($t4) # int menor = idades[0]

loop_menor_maior:
    bge $t2, $t0, exibe_resultado
    lw $t7, ($t4) # idade = idades[i]
    
    condicional_maior:    
    bgt $t7, $t5, novo_maior # if(idade>maior) maior = idade
    
    condicional_menor:
    blt $t7, $t6, novo_menor # if(idade<menor) menor = idade
    
    fim_condicionais: # incremento dos contadores 
    add $t2, $t2, 1 # i += 1
    add $t4, $t4, 4 # Incrementa o endereco atual do array em 4
    j loop_menor_maior 

novo_maior:
    move $t5, $t7 
    j condicional_menor
    
novo_menor:
    move $t6, $t7
    j fim_condicionais

exibe_resultado:
    li $v0, 4
    la $a0, msg_maior
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, msg_menor
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 10
    syscall
