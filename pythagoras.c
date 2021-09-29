//****************************************************************************************************************************
//Program name: "Assignment 2".  This program greets a user by their inputted name  *
//and title.  Copyright (C) 2021  Gabriel Gamboa                                                                                 *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//****************************************************************************************************************************




// ;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
// ;Author information
// ;  Author name: Gabriel Gamboa
// ;  Author email: gabe04@csu.fullerton.edu
// ;
// ;Program information
// ; Program name: Assignment 2
// ;  Programming languages X86 with one module in C
// ;  Date program began 2021-Sep-24
// ;  Date program completed 2021-Sep-29
// ;
// ;Purpose
// ;  This program takes 2 floating numbers which represent 2 sides of a triangle as
// ;  inputs and returns the area of the triagle and the hypotenuse.
// ;Project information
// ;  Files: pythagoras.c, triangle.asm, r.sh
// ;  Status: The program has been tested extensively with no detectable errors.
// ;
//This file
//   File name: pythagoras.c
//   Language: C
//   Compile: gcc -c -Wall -m64 -std=c11 -no-pie -o pythagoras.o pythagoras.c
//   Link: gcc -m64 -no-pie -o rtriangle.out -std=c11 triangle.o pythagoras.o
//
//
// ;============================================================================================================================================================
//
//===== Begin code area ===========================================================================================================

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
extern double rtriangle();
//
int main(int argc, char* argv[])
{double answer = 0.0;
 printf("Welcome to the Right Triangles program maintained by Gabriel Gamboa.\n");
 printf("If errors are discovered please report them to Gabriel Gamboa at gabriel@columbia.com for a quick fix. At Columbia Software the customer comes first.\n");
 answer = rtriangle();
 printf("The main function recieved this number %8.5lf and plans to keep it.\n",answer);
 printf("An integer zero will be returned to the operating system.  Bye.\n");
 return 0;
}
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
