require_relative 'stepping_piece.rb'

class Knight < SteppingPiece

  KNIGHT_DIFFS = [
    [-2, 1],
    [-2,-1],
    [ 2, 1],
    [ 2,-1],
    [-1, 2],
    [-1,-2],
    [ 1, 2],
    [ 1,-2]
  ]

  def initialize(color, initial_position, board)
    super
    if @color == :white
      @symbol = "\u2658".encode('utf-8')
    else
      @symbol = "\u265E".encode('utf-8')
    end
  end

  def moves
    options = []

    KNIGHT_DIFFS.each do |(file, rank)|
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
