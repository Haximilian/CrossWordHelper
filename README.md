# Crossword Helper


![NY Times Crossword](https://wiki.ubc.ca/images/6/6f/NY_Times_Crossword.png)

___

## About

**What is the problem?**

- The program is a crossword solver.
- The input is a word with one or more missing letters in the form of a question-mark (`"?"`), for example: `"?ello"`.
- The output is a list of all the words matching that format, in this case: `"Cello", "Hello", and "Jello"`.
- The program interacts with a user on the command line.

**What is the something extra?**

- The program will take the asterisk (`"*"`) to represent one or more missing letters.
- The program takes care of parsing any whitespace that is accidentally used at the front or end of an input string.

**What did we learn from doing this?**

- We'll learn about various data structures such as a prefix-trees.
- We'll use these data structures to store and query words.
- Further more, we'll gain practice with the io monad. On startup, the program will read over a list of words in a language and create any necessary data structures.

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
