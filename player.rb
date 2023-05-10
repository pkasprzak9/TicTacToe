# frozen_string_literal: false

require './board'

# Class to create a player that can be used to play a game
class Player
  attr_accessor :name, :weapon, :board

  @name = ''
  @weapon = ''

  def initialize(board)
    @board = board
  end

  # Allows players to make a move on the board
  def make_a_move(position)
    @board.set_value(@weapon, position)
  end
end
