# frozen_string_literal: false

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
      puts "Enter a name for player #{index + 1}: "
      player.name = gets.chomp
      until player.weapon == 'x' || player.weapon == 'o'
        puts "Choose a weapon ('x' or 'o') for player #{index + 1}: "
        player.weapon = gets.chomp
      end
    end
  end

  # Runs the game loop where players take turns making a move until a winner or
  # a full board is reached, checks for a winner after each move, declares a
  # tie game if there is no winner and the board is full, and prints the name
  # of the winner, if there is one.
  def play_game
    winner = nil
    until winner
      @players.each do |player|
        puts "#{player.name}'s turn!"
        player.make_a_move
        winner = @board.check_win(player)
        break if winner

        if @board.full?
          puts "It's a tie!"
          return
        end
      end
    end
    puts "#{winner.name} wins!"
  end

  # Asks the user if he wants to play again. If so, then
  # calls 'new_game' function, otherwise prints the goodbye message.
  def end_game
    puts 'Would you like to play again? '
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
