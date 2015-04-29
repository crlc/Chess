require_relative 'player.rb'
require_relative 'board.rb'

class Game

  def initialize
    puts "What is your name, white player?"
    @white_player = create_player
    puts "What is your name, black player?"
    @black_player = create_player
    @board = Board.new
  end

  def create_player
    name = gets.chomp
    Player.new(name)
  end

  def play

  end


end
