require_relative 'sliding_piece.rb'

class Queen < SlidingPiece

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2655".encode('utf-8')
    else
      @symbol = "\u265B".encode('utf-8')
    end
  end

  def directions
    DIAGS + HORVER
  end

end
