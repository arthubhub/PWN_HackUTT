#!/usr/bin/env bash
set -euo pipefail

# x86_64
echo "[*] Compilation x86_64"
gcc -g \
    -no-pie \
    -fno-stack-protector \
    -z execstack \
    exemple.c -o exemple-x86
gcc -g \
    -no-pie \
    -fno-stack-protector \
    -z execstack \
    exercice.c -o exercice-x86

# ARM64
echo "[*] Compilation ARM64"
aarch64-linux-gnu-gcc   -g \
    -no-pie \
    -fno-stack-protector \
    -z execstack \
    exemple.c -o exemple-arm
aarch64-linux-gnu-gcc   -g \
    -no-pie \
    -fno-stack-protector \
    -z execstack \
    exercice.c -o exercice-arm


echo "[+] Binaires générés"
