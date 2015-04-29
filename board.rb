require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/pawn'

class Board

  LETTERS = ('a'..'h').to_a

  def self.nil_grid
    grid = Hash.new{ |h,k| h[k] = Hash.new{|h,k| h[k] = nil}}

    ('a'..'h').each do |letter|
      ('1'..'8').each do |num|
        grid[letter][num]
      end
    end

    grid
  end

  def initialize
    @pieces = []
    # @grid = Hash.new{ |h,k| h[k] = Hash.new{|h,k| h[k] = nil}}
    @grid = Board.nil_grid
    self.setup
  end

  def [](pos)
    letter, number = pos.split('')
    @grid[letter][number]
  end

  def backline(color, number)
    [
      Rook.new(color, 'a' + number, self, 'R'),
      Knight.new(color, 'b' + number, self, 'N'),
      Bishop.new(color, 'c' + number, self, 'B'),
      Queen.new(color, 'd' + number, self, 'Q'),
      King.new(color, 'e' + number, self, 'K'),
      Bishop.new(color, 'f' + number, self, 'B'),
      Knight.new(color, 'g' + number, self, 'N'),
      Rook.new(color, 'h' + number, self, 'R')
    ]
  end

  def display
    puts "  _   _   _   _   _   _   _   _  "
    ('1'..'8').to_a.reverse.each do |number|
      ('a'..'h').each do |letter|
        if @grid[letter][number].nil?
          print "| _ "
        else
          print "| #{@grid[letter][number].display} "
        end
      end
      puts "|"
    end
  end

  def setup
    [[:white, '1'], [:black, '8']].each do |(color, number)|
      backline(color, number).each_with_index do |piece, i|
        @grid[LETTERS[i]][number] = piece
        ['2', '7'].each do |num|
          @grid[LETTERS[i]][num] =
                    Pawn.new(color, LETTERS[i] + num, self, 'P')
        end
      end
    end
  end

end