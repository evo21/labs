In this assignment, we'll revisit and refactor
[our previous tic-tac-toe](https://github.com/TIY-ATL-ROR-2015-Jan/labs/tree/master/01-08/questions.md)
implementation with an eye towards testability, maintainability,
object oriented design, and code quality.

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Understand basic OO principles
* Appreciate the difficulty of changing code, and think about ways to make it easier
* Be comfortable writing tests and structuring code to be testable

### Performance Objectives

After completing this assignment, you be able to effectively use

* `class`es and `module`s to encapsulate logic
* `minitest` to write and run tests

## Details

### Deliverables

A repository containing
* a `tic-tac-toe.rb` script
* any other files required by that script

### Requirements

* Running `./tic-tac-toe.rb` should play a game of tic-tac-toe in the terminal.
* All tests passing.
* No `rubocop` warnings or errors.

## Normal Mode

All requirements of the previous assignment, plus:

* A swappable `Player` class, which can be `Human` (gets input from
  the command line) or `Random`. It should be possible to run a game
  with anywhere from 0 to 2 human players.
* An option to play again after the game is over.
* At least 1 test for every method.

## Hard Mode

Choose any of:

* Add a Win-Loss-Draw scoreboard that displays after each game.
* Add an AI player class with hardcoded optimal moves
* At least 2 tests for every method.

## Nightmare Mode

* Add a [minimax](http://en.wikipedia.org/wiki/Minimax)-based AI

## Notes

Think about your previous solution. Is it reusable, or is it better to
start from scratch? Were there things you could have done then to make
it easier to adapt now? Are there things you can do now which might
make it easier to adapt this code in the future?
