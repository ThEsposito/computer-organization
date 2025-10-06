# Fn= Fn-1 + Fn-2 - Sendo, F1=1 e F0=0
# (a chamada da funcao atraves da instrucao JAL e o retorno com JR)

.data

mensagem1: .asciiz "Digite a quantidade de termos da serie: "
msg_entrada_invalida: .asciiz "A quantidade de termos deve ser maior do que zero!\n"
num: .half 1
num2: .half 1

.text

leitura_entrada:
	# Impressao da mensagem
	li $v0, 4
	la $a0, mensagem1
	syscall

	# Leitura de inteiro - quantos numeros haverao na sequencia
	li $v0, 5
	syscall
	move $t1, $v0   # guarda o valor lido em $t1
	blez $t1, leituraEntrada # volta para mensagem se o nro digitado for menor ou igual a 0

	li $s0, 1 # Inicia o contador como 1. Ou seja, comeca calculando o 1o termo da sequecia
		
laco:
	# Aqui tem que vir um "for". Ele vai chamando essa funcao (p calcular o termo do contador) 
	# enquanto o contador for menor do que o número fornecido
	jal fatorial
	
	
	# $s9 guarda o resultado final da funcao de calculo do fatorial
fim_laco:


fatorial:
	# s0 contem o parameto (enesimo termo da sequencia)

	# registra nos regs. salvos o valor 1 que serao sempre o comeco da sequencia
	li $t0, 1 # termo A da sequencia para calculo do proximo termo
	li $t1, 1 # termo B da sequencia para calculo do proximo termo
	
	li $t3, 0 # contador interno dessa funcao
	
	#li $t2 #proximo termo da sequencia
	
	for_fatorial:
	
	fim_for_fatorial:
	

	jr $ra

entrada_invalida:
	li $v0, 4
	la $a0, msg_entrada_invalida
	syscall

	j leitura_entrada
