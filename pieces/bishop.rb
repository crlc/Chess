require_relative 'sliding_piece.rb'

class Bishop < SlidingPiece

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2657".encode('utf-8')
    else
      @symbol = "\u265D".encode('utf-8')
    end
  end

  def move_dirs
    
  end

end
