#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int win() {
    printf("Debugging env\n");
    execve("/bin/sh", NULL, NULL);
    perror("execve failed");
    return 1;
}

void save_user_entry(char *argv) {
    int a = 8;
    char buffer[12];
    //strncpy(buffer,argv,12);
    strcpy(buffer, argv);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input>\n", argv[0]);
        return 1;
    }

    printf("Address of win function: %p\n", (void *)win);
    save_user_entry(argv[1]);
    return 0;
}
