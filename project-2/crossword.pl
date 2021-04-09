:- dynamic state/1.

% List of words.
:-consult('words.pl').
% word(hello, [h,e,l,l,o]).
% word(car, [c,a,r]).
% word(cat, [c,a,t]).


% Initial State of the Crossword Board
:- asserta(state([
  [ -, -, -, -, -, t, -, -],
  [ -, *, e, *, *, o, -, -],
  [ -, -, *, -, -, *, -, -],
  [ -, -, *, -, -, *, i, m],
  [ m, -, h, *, l, *, -, -],
  [ *, -, -, *, -, -, -, -],
  [ *, a, *, e, -, -, -, -],
  [ *, -, -, -, -, -, -, -]
])).

% Completed Solution.
%       0  1  2  3  4  5  6  7
% 0   [ -, -, -, -, -, t, -, -],
% 1   [ -, h, e, l, l, o, -, -],
% 2   [ -, -, a, -, -, t, -, -],
% 3   [ -, -, c, -, -, a, i, m],
% 4   [ m, -, h, e, l, l, -, -],
% 5   [ i, -, -, v, -, -, -, -],
% 6   [ m, a, t, e, -, -, -, -],
% 7   [ e, -, -, -, -, -, -, -]

% Solutions.
checkBoard(hello, 1, 1, horizontal).
checkBoard(each, 1, 3, vertical).
checkBoard(total, 0, 6, vertical).
checkBoard(eve, 4, 5, vertical).
checkBoard(mate, 6, 0, horizontal).
checkBoard(hell, 4, 3, horizontal).
checkBoard(mime, 4, 0, vertical).
checkBoard(aim, 3, 5, horizontal).


% 
% addWord
%   Adds a correct word to the Crossword.
%   Updates internal state.
% 
addWord([], _, _, _).
addWord([H|T], X, Y, horizontal) :-
  updateBoard(H, X, Y),
  NextX is X + 1,
  addWord(T, NextX, Y, horizontal).

addWord([H|T], X, Y, vertical) :-
  updateBoard(H, X, Y),
  NextY is Y + 1,
  addWord(T, X, NextY, vertical).


% 
% updateBoard
%   Call only once a word is correct.
 %  Takes in some addWord([w,o,r,d], X, Y, direction).
%     X = row{0,6}
%     Y = column{0,6}
%     direction = vertical | horizontal
% 
updateBoard(Letter, X, Y) :-
  state(E),
  nth1(Y, E, S),
  arrayUpdate(S, New, X, Letter),
  arrayUpdate(E, NewState, Y, New),
  retractall(state(X)),
  asserta(state(NewState)).

arrayUpdate([H|OT], [H|NT], Index, Element) :-
  Index > 1,
  Next is Index - 1,
  arrayUpdate(OT, NT, Next, Element).

arrayUpdate([_|T], [Element|T], 1, Element).


% 
% viewBoard
%   Prints out the board from internal state.
% 
viewBoard() :-
	state(List),
  [R1,R2,R3,R4,R5,R6,R7,R8] = List,
  write("    0 1 2 3 4 5 6 7\n"),
  write("0  "), print(R1), write("\n"),
  write("1  "), print(R2), write("\n"),
  write("2  "), print(R3), write("\n"),
  write("3  "), print(R4), write("\n"),
  write("4  "), print(R5), write("\n"),
  write("5  "), print(R6), write("\n"),
  write("6  "), print(R7), write("\n"),
  write("7  "), print(R8), write("\n").


% 
% = Main Function #1
% 
% crosswordSolver
%   Given some input word in this [f,o,r,m,a,t].
%   Returns multiple solutions for every word 
%     matching the pattern.
%   Supports ? for one unknown charcter.
%   Supports * for one or more unknown charcters.
% 
%   Example:
%   Try $ crosswordSolver([h,e,l,?,o], S).
%   Try $ crosswordSolver([c,a,*], S).
% 
crosswordSolver(Input, Result) :- 
  word(Result, T), 
  patternMatch(Input, T).

% 
% patternMatch
%   Internal predicate that searches for matching patterns. 
%   Match Solver. Support for ?.
% 
patternMatch([?], [L]).
patternMatch([L], [L]).
patternMatch([?|LT], [_|Tail]) :- patternMatch(LT, Tail).
patternMatch([LH|LT], [LH|Tail]) :- patternMatch(LT, Tail).
% Asterisk - Extra Feature - Support for *.
patternMatch([*], _).
patternMatch([*| T], W) :- append(_, R, W), patternMatch(T, R).
