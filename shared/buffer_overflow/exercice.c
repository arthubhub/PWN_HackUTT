#include <stdio.h>
#include <stdlib.h>
#define BUFF_SIZE 12

void main(){
    int secret = 0x0;
    char buffer[12];
    scanf("%16s",buffer);
    
    if (secret == 0xaabbccdd){
        printf("Bravo, tu as réussi\n");
    }
    

    printf("secret : %x\n",secret);
}