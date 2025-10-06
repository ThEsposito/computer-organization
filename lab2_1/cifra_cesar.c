#include <stdio.h>

char cifraChar(char c){
    if(c < 65 || c > 122) return c; // Mantem caracteres que não são letras
    
    if(c <= 90) { // Condição pra ser maiuscula, tem que retornar nesse bloco
        if(c >= 88) return c-23;
        
        return c+3;
    }
    
    if(c >= 120) return c-23;
        
    return c+3;
}

int main() {
    printf("%c",cifraChar('z'));

    return 0; 
}