require_relative 'piece.rb'

class SlidingPiece < Piece
  HORVER = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def moves
    options = []
    file, rank = @pos

    self.directions.each do |(df, dr)|
      new_pos = [file + df, rank + dr]

      7.times do
        break if !@board[new_pos].nil?
        options << new_pos
        f, r = new_pos
        new_pos = [f + df, r + dr]
      end

      options << new_pos if @board[new_pos] && @board[new_pos].color != @color
    end

    options.select! do |pos|
      (0..7).include?(pos.first) && (0..7).include?(pos.last)
    end
  end

end
