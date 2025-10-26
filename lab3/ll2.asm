.data
arr: .word 39, 70, 53, 17, 92, 53, 80, 30, 79, 64
msg1: .asciiz "Percorrendo array: "
sep: .asciiz " "
b_line: .asciiz "\n" 

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    # Inicializacao de variaveis:
    # $s4: head para lPar
    # $s5: head para lImpar
    # $s6: tail para lPar
    # $s7: tail para lImpar

    # $s0: tamanho do array
    # $s1: indice do array estatico (i)
    # $s2: deslocamento para acesso ao array (somando de 4 em 4)

    li $s4, 0
    li $s5, 0
    li $s6, 0
    li $s7, 0

    li $s0, 10 # tamanho do array
    li $s1, 0 # indice do array estatico (i)
    li $s2, 0 # deslocamento para acesso ao array (somando de 4 em 4)

# $t0: arr[i]
loop_percorre_arr:
    beq $s1, $s0, fim_loop
    lw $t0, arr($s2) # $t0 = arr[i]

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, sep
    syscall

    addi $s1, $s1, 1 # i++
    addi $s2, $s2, 4 # desloc += 4

    # Preparando args
    move $a0, $t0
    andi $a2, $t0, 1 # (a2 == 0) ? ehPar : ehImpar

    jal insere_no_final

    j loop_percorre_arr

fim_loop:
    
end:
    li $v0, 10
    syscall

# ATENCAO!!! AINDA NAO PENSEI NUM JEITO DE INICIALIZAR A LISTA!!
# NAO DA PRA USAR O METODO ABAIXO SE NAO HOUVER NENHUM HEAD. SEM HEAD, NAO HA TAIL.
# O METODO NAO PODE SER TESTANDO AINDA POR CONTA DISSO

# --- Argumentos ---
# $a0: valor a ser inserido
# $a1: endereco do tail da lista (NAO PRECISA MAIS!! DEPOIS TIRO)
# $a2: 0 para inserir em lPares e 1 para inserir em lImpares

# obs: se usasse o param $a1 ao inves de $a2 o codigo seria muito mais generico, 
# desacoplado e reutilizavel! Depois penso numa forma de fazer assim.
# talvez fazendo essa checagem no loop principal

# --- Retorno ---
# $v0: endereco para o novo node

insere_no_final:
    # Salvando argumentos:
    move $t0, $a0 # $a0 vai ser usado na syscall

    li $v0, 9
    la $a0, 8 # 4 bytes para o dado e 4 para o endereco do proximo node
    syscall

    beqz $a2, insere_par
    j insere_impar

    insere_par:
    
    move $s6, $v0 
    sw	$, 0($s1)	# 
    
    insere_impar:
    move $s7, $v0



    jr $ra
# $s6: tail para lPar
# $s7: tail para lImpar
