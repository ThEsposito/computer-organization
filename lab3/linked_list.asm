.data
    arr: .word 39, 70, 53, 17, 92, 53, 80, 30, 79, 64
#    headPar: .word 0
#    headImpar: .word 0

.text
main:
    li $t0, 10  # Tamanho do array
    li $t1, 0   # Contador: i = 0
    li $t2, 0   # Deslocamento

    li $s0, 0 # Inicializa o ponteiro para headPar
    li $s1, 0 # Inicializa o ponteiro para headImpar

    # Ponteiros que irao percorrer a lista e apontar para os tails
    # Inicializados como 0, tambem
    move $s7, $s0
    move $s8, $s1 

loop_categoriza_numeros:
    bge $t1, $t0, impressao_listas  # if(i >= size) break;
    lw $s3, arr($t2) # Recebe arr[i] PODE DAR BO ENTRE CHAMADAS DE FUNÇÃO
    addi $t2, $t2, 4 # deslocamento += 4 (tamanho de um word)
    
    move $a0, $s3 # passa arrI como argumento para verifica_paridade
    jal verifica_paridade

    move $a1, $s3 # Prepara o argumento para inserir_no_final_pelo_tail 
                  # (valor a inserir)
    
    beqz $v0, aloca_par
    j aloca_impar

fim_if_categoriza_numeros:
    addi $t1, $t1, 1 # i += 1
    j loop_categoriza_numeros

aloca_par:
    move $a0, $s0 # passa headPar como argumento
    jal inserir_no_final_pelo_tail
    j fim_if_categoriza_numeros

aloca_impar:
    move $a0, $s1 # passa headImpar como argumento
    jal inserir_no_final_pelo_tail
    j fim_if_categoriza_numeros

# $a0: numero
# $v0: retorno (0 para par e 1 para impar)
verifica_paridade:
    andi $v0, $a0, 1
    jr $ra

# $a0: endereço do tail
# $a1: valor a ser inserido
# $v0: retorno do endereco do novo node
inserir_no_final_pelo_tail:
    beqz $a0, inicializar_lista

fim_inserir_no_final_pelo_tail:


# $a1: valor do 1o elemento (head)
# $v0: endereço do 1o elemento
inicializar_lista_par:
    li $v0, 9 # sbrk
    li $a0, 8 # 8bytes: 4 para o dado e 4 para o endereco do proximo node
    syscall # $v0 ja contem o endereco o endereco da memoria alocada

    move $s0, $v0 # $s0 agora aponta para o novo (e primeiro) node
    sw $a1, 0($s0) # guarda o valor do parametro no endereco de memoria
    sw $zero, 4($s0) # atribui o ponteiro para o proximo no como 0 (nulo, inexistente)
    
        
    j fim_inserir_no_final_pelo_tail

impressao_listas: 

# $a0: endereco do head
imprimir_lista: 