# frozen_string_literal: false

require 'pry-byebug'
require './board'
require './player'

class Game
  def new_game
    prepare_game
    play_game
    end_game
  end

  # Prepares board and both players assigned to the latter.
  # Each player has its own weapon.
  def prepare_game
    @board = Board.new
    @board.display_board
    @players = [Player.new(@board), Player.new(@board)]
    @players.each_with_index do |player, index|
      puts "Enter a name for player #{index + 1}:"
      player.name = gets.chomp
      until player.weapon == 'x' || player.weapon == 'o'
        puts "Choose a weapon ('x' or 'o') for player #{index + 1}:"
        player.weapon = gets.chomp
      end
    end
  end

  def play_game
    winner = nil
    until winner || @board.full?
      @players.each do |player|
        puts "#{player.name}'s turn:"
        choice = gets.chomp.to_i
        player.make_a_move(choice)
        winner = @board.check_win(player)
        break if winner
      end
    end
    if winner
      puts "#{winner.name} wins!"
    else
      puts "It's a tie!" if @board.full?
    end
  end

  # Asks the user if he wants to play again. If so, then
  # calls 'new_game' function, otherwise prints the goodbye message.
  def end_game
    puts 'Would you like to play again?'
    answer = gets.chomp
    if answer == 'yes'
      new_game
    else
      puts 'See you later aligator'
    end
  end
end

game = Game.new
game.new_game
