#include <stdio.h>
#include <stdlib.h>
#define BUFF_SIZE 12

void main(){

    int age = 50;
    char comment[BUFF_SIZE];
    

    for (int i = 0; i< BUFF_SIZE; i++){
        comment[i]='-';
    }
    comment[BUFF_SIZE]='\0';
    printf("Age  : %d\ncomment  : %s\n",age,comment);
}