#include <stdio.h>
#include <stdlib.h>

int main() {
    int arr[] = {1,2,3,4,5,6,7,8,9,10};
    printf("Size long: %ld\n", sizeof(long));
    printf("Size int: %ld\n", sizeof(int));
    printf("Size int pointer: %ld\n", sizeof(int*));

    int* headPar;
    int* headImpar;


    for(int i=0; i<10; i++){
        if(arr[i]%2 == 0){
            insereNoFim();
        }
    }
}

int* insereNoFim(int* tail, int valor){
    int* newNode = (int*) malloc(8);
    printf("Endereço do malloc: %d\n", &newNode);


    return newNode;
}