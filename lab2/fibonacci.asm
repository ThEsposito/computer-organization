# -------------------------------------------------------------------------
# Escreva um programa usando a linguagem de montagem do MIPS para gerar a 
# sequência de Fibonacci através de uma função (a chamada da função é 
# através da instrução JAL e o retorno com JR) e imprimir a sequência com
# o separador vírgula entre os números, conforme exemplo acima. O usuário 
# deve informar, via teclado, a quantidade de termos da sequência. Inclua
# uma função aleatória no código.
#---------------------------------------------------------------------------


.data:
msg1: .asciiz "Digite o número: "
virgula: .asciiz ", "

.text:
main: 
    # Exibir mensagem: 
    li $v0, 4
    la $a0, $msg1
    syscall

    # Lendo inteiro
    li $v0, 5
    syscall

    move $t0, $a0 # guardando inteiro em $t0

fib: 
    