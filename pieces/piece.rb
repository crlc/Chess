require_relative 'errors.rb'

class Piece
  attr_accessor :pos
  attr_reader :symbol, :color

  def initialize(color, initial_position, board)
    @color = color
    @pos = initial_position
    @board = board
  end

  def dup(board)
    Piece.new(@color, @pos, board)
  end

  def inspect
    "#{@color} #{@symbol} #{@pos}"
  end

  def move_into_check?(pos)
    board_dup = @board.dup
    board_dup.move_to![pos]
    return true if board_dup.in_check?(@color)
    false
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

  def move_to!(new_pos)
    @board[new_pos] = self
    @board[@pos] = nil
    @pos = new_pos
  end

  def moves
    raise RuntimeError.new("Define your moves")
  end

  def valid_moves
    valids = []

    self.moves.each do |pos|
      valids << pos unless move_into_check?(pos)
    end

    valids
  end

end
