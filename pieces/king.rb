require_relative 'stepping_piece.rb'

class King < SteppingPiece

  KING_DIFFS = [
    [ 1,  1],
    [ 1,  0],
    [ 1, -1],
    [ 0, -1],
    [-1, -1],
    [-1,  0],
    [-1,  1],
    [ 0,  1]
  ]

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2654".encode('utf-8')
    else
      @symbol = "\u265A".encode('utf-8')
    end
  end

  def moves
    options = []

    KING_DIFFS.each do |(file, rank)|
      options << [self.pos[0] + file, self.pos[1] + rank]
    end

    options.select! do |pos|
      (0..7).include?(pos.first) && (0..7).include?(pos.last)
    end

    options.reject! do |pos|
      @board[pos].nil? ? false : @board[pos].color == self.color
    end

    options
  end

end
