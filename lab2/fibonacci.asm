# Fn= Fn-1 + Fn-2 - Sendo, F1=1 e F0=0
# (a chamada da funcao atraves da instrucao JAL e o retorno com JR)

.data

mensagem1: .asciiz "Digite quantos numeros haverao na sequencia: "
num: .half 1
num2: .half 1

.text

leituraEntrada:
# impressao da mensagem
li $v0, 4
la $a0, mensagem1
syscall

# leitura de inteiro - quantos numeros haverao na sequencia
li $v0, 5
syscall
move $t1, $v0   # guarda o valor lido em $t1
blez $t1, leituraEntrada # volta para mensagem se o nro digitado for menor ou igual a 0

# registra nos regs. salvos o valor 1 que serao sempre o começo da sequencia
li $s0, 1
li $s1, 1


