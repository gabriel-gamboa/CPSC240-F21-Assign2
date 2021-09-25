#!/bin/bash

#Author: F. Holliday
#Author email: holliday@fullerton.edu

#Program name: Learn GDB
#Programming Language: C++ and X86
#Date of last modification: 2021-Sep-08
#Files in the program: main-drive.cpp, learn.asm, r.sh

#The purpose of this program is to provide a live platform for learning GDB.
#GDB means Gnu De Bugger.

echo "Remove un-needed files if any."
rm *.o
rm *.out

echo "Assemble the file triangle.asm."
nasm -f elf64 -l triangle.lis -o triangle.o triangle.asm -g -gdwarf

echo "Compile the C main function"
gcc -c -Wall -m64 -no-pie -o pythagoras.o pythagoras.c -std=c11 -g

echo "Link 2 object files"
gcc -m64 -no-pie -o assign2.out triangle.o pythagoras.o -std=c11 -g  #filename.out must immediately follow -o

echo "Run the program \"Learn GDB\""
gdb ./assign2.out

echo "the bash file has terminated."
