require_relative 'stepping_piece.rb'

class Knight < SteppingPiece

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2658".encode('utf-8')
    else
      @symbol = "\u265E".encode('utf-8')
    end
  end

  def moves

  end

end
