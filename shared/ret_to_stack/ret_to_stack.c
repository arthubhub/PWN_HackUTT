#include <stdio.h> 
#include <stdlib.h>
#include <unistd.h>

int main() {
    char my_array[128];

    printf("Address of my_array: %p\n", my_array);
    printf("Give me your input: ");
    gets(my_array); 

    return 0;
}