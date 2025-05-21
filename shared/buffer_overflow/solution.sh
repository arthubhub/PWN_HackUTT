#!/bin/bash

# Envoyer des Bytes à un programme
echo -ne "aabbcc\xaa\xbb\xcc" | xxd
# Discuter en direct avec des bytes
while read -r line ; do echo -ne "$line" | xxd ; done 
# Debugger un programme
gdb ./prog


#echo -ne "whoami" | /bin/sh # -> le shell se ferme directement
#maintenir un shell ouvert : 
#(echo -ne “ls\n” ; cat) | /bin/sh
