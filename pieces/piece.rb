class Piece
  attr_reader :display

  def initialize(color, initial_position, board, display)
    @color = color
    @pos = initial_position
    @board = board
    @display = display
  end

  def moves
    raise RuntimeError.new("Define your moves")
  end


end
