#include <stdio.h>

int main(){
    int idades[15]; // Okay
    
    int n;
    int idade;
    scanf("%d", &n); // Okay
    for(int i=0; i<n; i++){
        scanf("%d", &idade); // OKAY
        idades[i] = idade; // Okay
    }

    int menor = idades[0];
    int maior = idades[0];

    for(int i=0; i<n; i++){
        int idade = idades[i];
        if(idade > maior) maior = idade;
        if(idade < menor) menor = idade;
    }
    
    printf("Menor = %d\n", menor);
    printf("Maior = %d", maior);
    
    return 0;
}