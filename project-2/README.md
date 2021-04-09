# Crossword Helper


![NY Times Crossword](https://wiki.ubc.ca/images/6/6f/NY_Times_Crossword.png)

___

## About

**What is the problem?**

- The program is a crossword solver.
- The input is an array, representing a word, with one or more missing letters in the form of a question-mark (?), for example: `[?, e, l, l, o]`, and a variable such as Result to store the output.
- The output is a list of all the words matching that format, in this case: `Result=Cello; Result=Hello; and Result=Jello`.
- The program interacts with a user on the command line.
- The program provides an example of a crossword game the user can play from the command line while using the crossword helper

**What is the something extra?**

- The program will take the asterisk (`*`) to represent one or more missing letters.
- The program will have a crossword game the user can interact with

**What did we learn from doing this?**

- We'll learn about implementing recursive algorithms in prolog
- We'll learn about ways for a user to interact with the command line using prolog

**Conclusions**

We have found prolog to be very efficient at implementing the crossword solver. The logic required for the solver algorithm was much easier to write in Prolog than in Haskell, and therefore our code was shorter and simpler. Howeever, we found that Haskell has nicer built in methods to interact with the user than prolog. User interaction through the console is less intuitive in prolog and makes use of the program less clean. Further, we found it more difficult to implement a recursive algorithm that operates on strings in Prolog, and ended up modelling the words as an array.
___

## How to Run

```
$ swipl
Welcome to SWI-Prolog (threaded, 64 bits, version 8.2.4)

-- Load the main program with `[crossword].`
?- [crossword].
| true

-- Call the crosswordSolver function with a test input once loaded with `crossword`
?- crosswordSolver([h,e,l,?,o], Result).
Result=hello

-- press ; to get other solutions until the program outputs false

-- use viewBoard to view sample crossword puzzle
?- viewboard.
    0 1 2 3 4 5 6 7
0  [-,-,-,-,-,t,-,-]
1  [-,*,e,*,*,o,-,-]
2  [-,-,*,-,-,*,-,-]
3  [-,-,*,-,-,*,i,m]
4  [m,-,h,*,l,*,-,-]
5  [*,-,-,*,-,-,-,-]
6  [*,a,*,e,-,-,-,-]
7  [*,-,-,-,-,-,-,-]
true.

-- use checkBoard to edit sample crossword puzzle
?- addWord([h,e,l,l,o], 1, 1, horizontal).
true 

-- use checkBoard to check your solution for certain words
-- checkBoard takes takes in a word, coord, and orientation (horzional or vertical), as checkBoard(word, x_coord, y_coord, orientation)
?- checkBoard(hello, 1, 1, horizontal).
true.
```

___

## Links

**CPSC 312 Wiki - CrosswordHelper:** 
https://wiki.ubc.ca/Documentation:CrossWordHelperProlog


**Github Repository:** 
https://github.com/Haximilian/CrossWordHelper/tree/master/project-2

___
