#include <stdio.h>
#include <stdlib.h>


// ponteiros: headPar, headImpar
// Inicializados como zero, direto na .data pelo jeito

// Verificação de paridade: usando andi (primeiro_bit AND 1),
// Acho que, como é .word (4 bytes), fazer andi com 2^(4bytes * 8(1byte))-1

// Função inserir_no_final: sbrk de 8 bytes (4 do *next e 4 do data)

// Funções imprimir_pares e imprimir_impares: 


/*
Vou precisar de:
 - Um registrador pra guardar o endereco do node atual (maldito pAnda)
 - Dois registradores pra guardar os heads ()
*/
int main() {
    int arr[] = {1,2,3,4,5,6,7,8,9,10};
    
    
    int t0 = 10; // n
    int t1 = 0; // i
    int t2 = 0; // desloc

    short s0 = 0; // headPar
    short s1 = 0; // headImpar

    short s7 = s0; // headPar iteravel
    short s8 = s1; // headPar iteravel

    for(t1=0; t1<t0; t1++){
        short s3 = arr[t2];
        t2+=1;// deslocamento, em C n precisa

        short a0 = s3;
        short v0 = verificaParidade(&a0);
    }
}

int verificaParidade(short* a0){
    return *a0 & 1;
}

short alocaPar(short* a0, short* s0){
    *a0 = *s0; // passa headPar como arg
    
}
short alocaImpar(short* a0, short* s1){
    *a0 = *s1; // passa headPar como arg
}

short inserir_no_final_pelo_tail(){

}