#!/bin/bash
gcc -fno-stack-protector -z execstack -no-pie -o ret_to_stack ret_to_stack.c
