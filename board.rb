require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/pawn'

class Board

  def self.nil_grid
    grid = Hash.new{ |h,k| h[k] = Hash.new{|h,k| h[k] = nil}}

    (0..7).each do |file|
      (0..7).each do |rank|
        grid[file][rank]
      end
    end

    grid
  end

  def initialize(initial_board = nil)
    @grid = Board.nil_grid
    self.setup unless initial_board
  end

  def [](pos)
    file, rank = pos
    @grid[file][rank]
  end

  def []=(pos, obj)
    file, rank = pos
    @grid[file][rank] = obj
  end

  def backline(color, rank)
    [
      Rook.new(color, [0, rank], self),
      Knight.new(color, [1, rank], self),
      Bishop.new(color, [2, rank], self),
      Queen.new(color, [3, rank], self),
      King.new(color, [4, rank], self),
      Bishop.new(color, [5, rank], self),
      Knight.new(color, [6, rank], self),
      Rook.new(color, [7, rank], self)
    ]
  end

  def display
    system 'clear'
    puts "  _   _   _   _   _   _   _   _  "
    (0..7).to_a.reverse.each do |rank|
      (0..7).each do |file|
        pos = [file, rank]
        if self[pos].nil?
          print "| _ "
        else
          print "| #{self[pos].symbol} "
        end
      end
      puts "|"
    end
  end

  def dup
    new_board = Board.new(true)

    @grid.each do |file, v|
      v.each do |rank, piece|
        if piece
          piece = piece.dup(new_board)
          new_board[file][rank] = piece
        end
      end
    end
    new_board
  end

  def in_check?(color)
    other_color = (color == :white ? :black : :white)
    king_pos = nil

    @grid.each do |file, v|
      v.each do |rank, piece|
        king_pos = piece.pos if piece.is_a?(King) && piece.color == @color
        break unless king_pos.nil?
      end
      break unless king_pos.nil?
    end

    @grid.each do |file, v|
      v.each do |rank, piece|
        next if piece.nil?
        return true if piece.moves.include?(king_pos)
      end
    end

    false
  end

  def receive_move(pos_array)
    old_pos, new_pos = pos_array
    self[old_pos].move_to(new_pos)
  end

  def setup
    [[:white, 0], [:black, 7]].each do |(color, number)|
      backline(color, number).each_with_index do |piece, i|
        @grid[i][number] = piece

        rank = (color == :white ? 1 : 6)
        @grid[i][rank] = Pawn.new(color, [i, rank], self)
      end
    end
  end
end
