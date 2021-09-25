#!/bin/bash


#Author: Floyd Holliday
#Program name: Basic Float Operations

rm *.o
rm *.out

echo "This is program Assignment 2"

echo "Assemble the module triangle.asm"
nasm -f elf64 -l triangle.lis -o triangle.o triangle.asm

echo "Compile the C module pythagoras.c"
gcc -c -Wall -m64 -no-pie -o pythagoras.o pythagoras.c -std=c11 #look up c version

echo "Link the two object files already created"
gcc -m64 -no-pie -o rtriangle.out pythagoras.o triangle.o -std=c11  #look up version

echo "Run the program Assignment 2"
./rtriangle.out

echo "The bash script file is now closing."
