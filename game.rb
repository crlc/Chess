require_relative 'human_player.rb'
require_relative 'board.rb'

class Game

  def initialize
    puts "What is your name, white player?"
    @white_player = create_player
    puts "What is your name, black player?"
    @black_player = create_player
    @board = Board.new
    @toggle = true
  end

  def create_player
    name = gets.chomp
    HumanPlayer.new(name)
  end

  def over?
    false
  end

  def play
    until over?
      @current_player = (@toggle ? @white_player : @black_player)
      @board.display
      begin
        @board.receive_move(@current_player.get_move)
      rescue InvalidMoveError => e
        @board.display
        puts e.message
        retry
      end
      @toggle = !@toggle
    end
  end

end



if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
