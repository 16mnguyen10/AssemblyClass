// ************************************************************************************************************************************
// Program name: "Rectangle Perimeter". This program calculates and display a rectangle's perimeter and area length.                  *
// Copyright (C) 2021 Michael Nguyen.                                                                                                 *
//                                                                                                                                    *
// This file is part of the software program "Rectangle Perimeter".                                                                   *
// Rectangle Perimeter is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
// version 3 as published by the Free Software Foundation.                                                                            *
// Floating IO is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied                  *
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.             *
// A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                                    *
// ************************************************************************************************************************************




// =======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**

//  Author Information
//    Author name: Michael Nguyen
//    Author email: 16mnguyen10@gmail.com

//  Program Information
//    Program name: Rectangle Perimeter
//    Programming Languyages: One modules in C++ and one module in X86
//    Date program began:       2021-January-25
//    Date program last update: 2021-February-12
//    Date of reorganization of comments: 2021-February-12
//    Files in this program: rectangle.cpp, perimeter.asm
//    Status: Finished.   The program was tested with no error

// This file
//    File name: rectangle.cpp
//    Language: c++
//    Compile: g++ -c -Wall -m64 -no-pie -o rectangle.o rectangle.cpp -std=c++17
//    Link: g++ -m64 -no-pie -o Assignment1_Rectangle.out -std=c++17 perimeter.o rectangle.o


// ===== Begin code area ================================================================================================
#include <stdio.h>
#include <stdint.h>
#include <iostream>
#include <iomanip>

extern "C" double perimeter();

int main(int argc, char* argv[])
{
    std::cout << "Welcome to a friendly assembly program written by Michael Nguyen.\n";
    perimeter();

    // std::cout << "The main function received this number "
    //         << std::fixed
    //         << std::setprecision(5) << answer
    //         << " and has decided to keep it.\n";
    std::cout << "A 0 will be returned to the operating system\nHave a nice day.\n";
    return 0;
}