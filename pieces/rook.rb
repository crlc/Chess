require_relative 'sliding_piece.rb'

class Rook < SlidingPiece

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2656".encode('utf-8')
    else
      @symbol = "\u265C".encode('utf-8')
    end
  end

  def directions
    HORVER
  end

end
