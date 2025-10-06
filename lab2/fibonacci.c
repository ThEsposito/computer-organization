// Online C compiler to run C program online
#include <stdio.h>

int fib(int n){
    if(n == 0 || n == 1) {
        return 1;
    } 
    return fib(n-1) + fib(n-2);
}

int main() {
    int n;
    scanf("%d", &n);
    
    for(int i=0; i<n; i++){ // n-1 e descomenta o do final
        printf("%d", fib(i));
        if(i != (n-1)){
            printf(", ");
        }
    }
    // printf("%d", fib(n));
    
    return 0;
}
