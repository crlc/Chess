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
    file, rank = @pos
    if @color == :white
      straight = [[file, rank + 1]]
      diags = [[file + 1, rank + 1], [file - 1, rank + 1]]
    else
      straight = [[file, rank - 1]]
      diags = [[file - 1, rank - 1], [file + 1, rank - 1]]
    end

    straight = [[]] unless @board[straight.first].nil?

    diags.reject! do |pos|
      @board[pos].nil? || @board[pos].color == @color
    end

    diags.empty? ? straight : straight + diags
  end
end
