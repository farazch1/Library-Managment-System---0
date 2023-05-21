# Library Management System - Assembly Language

This repository contains an assembly language program for a Library Management System. The program is designed to manage members and books in a library, providing options to register members, add books, and view the registered members and books.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Program Structure](#program-structure)
  - [Data Section](#data-section)
  - [Code Section](#code-section)
  - [Functions Section](#functions-section)
- [System Requirements](#system-requirements)
- [Compilation and Execution](#compilation-and-execution)
- [Contributors](#contributors)
- [License](#license)

## Features

The Library Management System provides the following features:

1. **Register a member**: Add a new member to the library.
2. **View registered members**: Display a list of all registered members.
3. **View registered members from a file**: Read and display registered members from a file.
4. **Add a book**: Add a new book to the library.
5. **View books in the library**: Display a list of all books in the library.
6. **View books from a file**: Read and display books from a file.
7. **Exit the program**: Terminate the program.

## Usage

To use the Library Management System:

1. Compile the assembly code using an assembler (e.g., MASM).
2. Run the compiled executable.
3. Follow the on-screen prompts to interact with the Library Management System.

## Program Structure

The program is divided into three main sections:

1. **Data Section**: Contains data structures, variables, and strings used in the program.
2. **Code Section**: Contains the main procedure and subroutines for each feature.
3. **Functions Section**: Contains utility procedures for displaying messages and reading input.

### Data Section

The Data section contains data structures, variables, and strings used in the program. It includes:

- Message strings to display messages to the user
- File paths for the member and book files
- Buffer variables to store data read from files
- Member and book arrays to store data
- Counters to track the number of members and books

### Code Section

The Code section contains the main procedure and subroutines for each feature:

- **Register Member subroutine**: Prompts the user for a member name, stores it in the array, increments the counter, and writes to the members file.
- **View Members subroutine**: Iterates through the member array and displays names.
- **View Members from File subroutine**: Reads the members file and displays names.
- **Add Book subroutine**: Prompts for a book name and author, stores in the array, increments the counter, and writes to the books file.
- **View Books subroutine**: Iterates through the books array and displays names and authors.
- **View Books from Files subroutine**: Reads the books file and displays book names and authors.
- **Exit Program subroutine**: Displays an exit message and terminates the program.

### Functions Section

The Functions section contains utility procedures:

- **Message Display function**: Takes a string pointer as an argument and displays the string.
- **String Input function**: Takes a string pointer, reads a string from the user, and stores it.

## System Requirements

- Assembler (e.g., MASM)
- Windows operating system

## Compilation and Execution

1. Compile the assembly code using an assembler like MASM.
2. Run the compiled executable in a Windows environment.

## Contributors

- Muhammad Ahmad (2021-CE-43)
- Hussnain Ali (2021-CE-60)
- Mian Faraz (2021-CE-44)
- Ali Abdullah (2021-CE-40)

## License

This project is open-source and available for educational purposes.
