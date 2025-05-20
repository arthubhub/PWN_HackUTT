#!/bin/bash

#envoyer des Bytes à un programme
#echo -ne "aabbcc\xaa\xbb\xcc" | xxd

# Discuter en directe avec des bytes
#while read -r line ; do echo -ne "$line" | xxd ; done 


#echo -ne "whoami" | /bin/sh # -> le shell se ferme directement
#maintenir un shell ouvert : 
#(echo -ne “ls\n” ; cat) | /bin/sh
