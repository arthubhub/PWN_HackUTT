#include <stdio.h>

void foo(int angle, long int distance) {
    int val1 = 30;
    char buffer[]="01234567";
    int val2 = 60;
}

int main(void) {
    int angle    = 0x123;
    long int distance = 0xdeadbeefbeefdead;
    foo(angle, distance);
    return 0;
}
