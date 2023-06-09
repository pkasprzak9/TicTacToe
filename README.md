# Tic-Tac-Toe

## Introduction

This is a Ruby implementation of the popular game 'Tic Tac Toe'. The game can be played between two players on a terminal.

<p align="center" margin-top: 20px>
  <img src="https://github.com/pkasprzak9/TicTacToe/assets/81309180/8727de0a-82e1-4726-b409-8e70f55cb022" alt="screenshot of the game"/>
</p>

## Requirements

Ruby (2.0 or higher)


## How to use

- Clone the repository: git clone https://github.com/pkasprzak9/Tic-Tac-Toe.git

- cd TicTacToe

- Run the game: ruby game.rb

- Follow the prompts to enter player names and choose weapons (x or o) for each player.

- Choose a position on the board when prompted to make a move during your turn.

- When the game ends, you will be asked if you want to play again.


## Class Details

The code has three classes: **Game**, **Board**, and **Player**.

**The Game class is** responsible for preparing the game and starting the game loop. It instantiates a new Board and two Player objects, assigning each player to the board. The play_game method is responsible for iterating through each player's turn and checking if the game has been won or tied.

**The Board class** contains an array of arrays representing the board. Each inner array contains three elements, representing the spaces in each row of the board. Empty spaces are represented with a space character. The display_board method outputs the current state of the board to the terminal, with separator lines separating each row.

**The Player class** contains a make_a_move method which prompts the player to choose a position on the board and then calls the set_value method of the Board class to update the board.

The game uses an array of winning combinations to check if a player has won. The check_win method of the Board class receives a player object, flattens the board into a one-dimensional array, and checks if any of the winning combinations are a subset of the positions held by the player.

## Contributors

https://github.com/pkasprzak9
