class Pawn < Piece

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2659".encode('utf-8')
    else
      @symbol = "\u265F".encode('utf-8')
    end
  end

  def moves

  end

end
