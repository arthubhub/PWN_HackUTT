#!/usr/bin/env bash
set -euo pipefail

# x86_64
echo "[*] Compilation x86_64"
gcc -g \
    -no-pie \
    -fno-stack-protector \
    -z execstack \
    ret_to_win.c -o ret_to_win-x86

# ARM64
echo "[*] Compilation ARM64"
aarch64-linux-gnu-gcc   -g \
    -no-pie \
    -fno-stack-protector \
    -z execstack \
    ret_to_win.c -o ret_to_win-arm



echo "[+] Binaires générés"
