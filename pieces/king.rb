require_relative 'stepping_piece.rb'

class King < SteppingPiece

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2654".encode('utf-8')
    else
      @symbol = "\u265A".encode('utf-8')
    end
  end

  def moves

  end

end
