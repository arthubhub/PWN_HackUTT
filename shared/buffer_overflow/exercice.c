#include <stdio.h>
#include <stdlib.h>
#define BUFF_SIZE 12

void cant_go_here(void){
    printf("Bravo, tu as réussi\n");
}

void main(){
    int secret = 0x0;
    char buffer[12];
    scanf("%16s",buffer);

    if (secret == 0xaabbccdd){
        cant_go_here();
    }

    printf("secret : %x\n",secret);
}