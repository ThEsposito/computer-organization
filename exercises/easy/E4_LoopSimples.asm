.data
msg_input: .asciiz "Enter a positive number: "
msg_invalid_input: .asciiz "The number must be greater than zero!\n"
msg_counter: .asciiz "\ni = "

.text
main:
	# Leitura do numero
    li $v0, 4
    la $a0, msg_input
    syscall

    li $v0, 5
    syscall
    move $s0, $v0 # Armazena o numero lido em $s0

    blt	$s0, 1, entrada_invalida # validacao da entrada (se for menor do que 1, solicita novamente)
        
inicio_loop:
    # Exibe o valor do contador
    li $v0, 4
    la $a0, msg_counter
    syscall
    
    li $v0, 1 
    move $a0, $s0 
    syscall
    
    subi $s0, $s0, 1 # decrementa o contador
    blt	$s0, 1, fim_programa # if(i<=1) break;
	    
	j inicio_loop
	
entrada_invalida:
    li $v0, 4
    la $a0, msg_invalid_input
    syscall

    j main

fim_programa: 
    li $v0, 10
    syscall
