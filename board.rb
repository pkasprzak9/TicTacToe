# frozen_string_literal: false

class Board
  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical columns
    [0, 4, 8], [2, 4, 6]             # diagonal lines
  ]

  # Creates a new Board filled with empty spaces.
  def initialize
    @board = []
    @board.push([' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' '])
  end

  # Iterates over the board's rows creating a new
  # array of 3 'row strings' which are then joined with the given
  # separator.
  def display_board
    separator = "\n-----------\n"
    rows = @board.map { |row| " #{row[0]} | #{row[1]} | #{row[2]} " }
    puts rows.join(separator)
  end

  # Takes as input a value (X or O) and a position for the
  # letter. Then changing value at chosen position in the board.
  def set_value(value, position)
    row, column = (position - 1).divmod(3)
    @board[row][column] = value
    display_board
  end

  # Checks if there's a winner.
  def check_win(player)
    player_positions = []
    @board.flatten.each_with_index do |value, index|
      player_positions << index if value == player.weapon
    end
    player if WINNING_COMBINATIONS.any? { |combo| (combo - player_positions).empty? }
  end

  # Returns true if the board is full.
  def full?
    @board.flatten.none? { |value| value == ' ' }
  end
end
