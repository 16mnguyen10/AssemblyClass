#!bin/bash

#Program: Floating IO
#Author: Michael Nguyen

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble perimeter.asm"
nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm

echo "Compile rectangle.cpp using the gcc compiler standard 2017"
g++ -c -Wall -m64 -no-pie -o rectangle.o rectangle.cpp -std=c++17

echo "Link the object files using the gcc linker standard 2017"
g++ -m64 -no-pie -o Assignment1_Rectangle.out -std=c++17 perimeter.o rectangle.o

echo "Run the program Rectangle:"
./Assignment1_Rectangle.out

echo "The script file will terminate"