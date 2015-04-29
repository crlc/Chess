require_relative 'errors.rb'

class Piece
  attr_accessor :pos
  attr_reader :symbol, :color

  def initialize(color, initial_position, board)
    @color = color
    @pos = initial_position
    @board = board
  end

  def inspect
    "#{@color} #{@symbol} #{@pos}"
  end

  def move_to(new_pos)
    if self.valid_moves.include?(new_pos)
      unless @board[new_pos].nil?
        @board[new_pos].pos = nil
      end
        @board[new_pos] = self
        @board[@pos] = nil
        @pos = new_pos
    else
      raise InvalidMoveError.new "Invalid move, try again."
    end
  end

  def moves
    raise RuntimeError.new("Define your moves")
  end

  def valid_moves
    self.moves

    # Eventually will have check checks, etc.
  end

end
