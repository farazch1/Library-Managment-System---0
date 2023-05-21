# Library Management System - Assembly Language

This repository contains an assembly language program for a Library Management System. The program is designed to manage members and books in a library, providing options to register members, add books, and view the registered members and books.

## Features

- Register a member
- View registered members
- View registered members from a file
- Add a book
- View books in the library
- View books from a file
- Exit the program

## Usage

1. Compile the assembly code using an assembler (e.g., MASM).
2. Run the compiled executable.
3. Follow the on-screen prompts to interact with the Library Management System.

## Program Structure

The program is divided into three main sections:

1. Data Section
2. Code Section
3. Functions Section

### Data Section

The Data section contains data structures, variables, and strings used in the program. It includes:

- Message strings to display messages to the user
- File paths for the member and book files
- Buffer variables to store data read from files
- Member and book arrays to store data
- Counters to track the number of members and books

### Code Section

The Code section contains the main procedure and subroutines:

- Register Member subroutine prompts the user for a member name, stores it in the array, increments the counter, and writes to the members file.
- View Members subroutine iterates through the member array and displays names.
- View Members from File subroutine reads the members file and displays names.
- Add Book subroutine prompts for a book name and author, stores in the array, increments the counter, and writes to the books file.
- View Books subroutine iterates through the books array and displays names and authors.
- View Books from Files subroutine reads the books file and displays book names and authors.
- Exit Program subroutine displays an exit message and terminates the program.

### Functions Section

The Functions section contains utility procedures:

- Message Display function takes a string pointer as argument and displays the string.
- String Input function takes a string pointer, reads a string from the user, and stores it.

## Contributors

- Muhammad Ahmad (2021-CE-43)
- Hussnain Ali (2021-CE-60)
- Mian Faraz (2021-CE-44)
- Ali Abdullah (2021-CE-40)

## License

This project is open-source and available for educational purposes.
