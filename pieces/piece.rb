class Piece
  attr_reader :symbol

  def initialize(color, initial_position, board)
    @color = color
    @pos = initial_position
    @board = board
  end

  def moves
    raise RuntimeError.new("Define your moves")
  end

end
