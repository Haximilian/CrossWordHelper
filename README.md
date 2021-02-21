# Crossword Helper

[wiki.ubc.ca/CrossWordHelper](https://wiki.ubc.ca/CrossWordHelper)

![NY Times Crossword](https://wiki.ubc.ca/images/6/6f/NY_Times_Crossword.png)

**What is the problem?**

- Our program is a crossword helper / solver.
- The input is a word with one or more missing letters in the form of a question-mark (`"?"`), for example: `"?ello"`.
- The output is a list of all the words matching that format, in this case: `"Cello", "Hello", and "Jello"`.
- The program interacts with a user on the command line.

**What is the something extra?**

- Our program will take the asterisk (`"*"`) to represent one or more missing letters.

**What did we learn from doing this?**

- We'll learn about various data structures such as a prefix-trees.
- We'll use these data structures to store and query words.
- Further more, we'll gain practice with the io monad. On startup, our program will read over a list of words in a language and create any necessary data structures.

**Github Repository**

[github.com/Haximilian/CrossWordHelper](https://github.com/Haximilian/CrossWordHelper)

___

## How to Run

```
$ ghci
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help

Prelude> :l queryEngine.hs 

*Main> 


```

___