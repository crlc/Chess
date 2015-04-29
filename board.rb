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

  def initialize
    @pieces = []
    @grid = Board.nil_grid
    self.setup
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
