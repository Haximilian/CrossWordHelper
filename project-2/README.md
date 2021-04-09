# Crossword Helper


![NY Times Crossword](https://wiki.ubc.ca/images/6/6f/NY_Times_Crossword.png)

___

## About

**What is the problem?**

- The program is a crossword solver.
- The input is an array, representing a word, with one or more missing letters in the form of a question-mark (?), for example: [?, e, l, l, o], and a variable such as Result to store the output.
- The output is a list of all the words matching that format, in this case: `Result="Cello"; Result="Hello"; and Result="Jello"`.
- The program interacts with a user on the command line.
- The program provides an example of a crossword game the user can play from the command line while using the crossword helper

**What is the something extra?**

- The program will take the asterisk (`*`) to represent one or more missing letters.
- The program will have a crossword game the user can interact with

**What did we learn from doing this?**

- We'll learn about implementing recursive algorithms in prolog
- We'll learn about ways for a user to interact with the command line using prolog

___

## How to Run

```
$ ghci
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help

-- Load the main program with `:l main`
Prelude> :l main 

-- Call the main (starter) function once loaded with `main`
*Main> main

Welcome to UBC CrossWordHelper! 
To find answers to ythe crossword, please enter in a keyword. 
Use the '?' question-mark for any character. 
Type '/quit' to quit the program.
_

```

___

## Links

**CPSC 312 Wiki - CrosswordHelper:** 
https://wiki.ubc.ca/CrossWordHelper


**Github Repository:** 
https://github.com/Haximilian/CrossWordHelper

___
