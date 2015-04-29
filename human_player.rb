require_relative 'player.rb'

class HumanPlayer < Player

  ALPHA = {
    'a' => 0,
    'b' => 1,
    'c' => 2,
    'd' => 3,
    'e' => 4,
    'f' => 5,
    'g' => 6,
    'h' => 7
  }

  def initialize(name)
    super(name)
  end

  def get_move
    puts "What is your move #{@name}? (e.g. e2 e3)"
    move =  gets.chomp.split(" ")
    old_pos, new_pos = move.first.split(""), move.last.split("")
    old_pos = [ALPHA[old_pos.first], old_pos.last.to_i-1]
    new_pos = [ALPHA[new_pos.first], new_pos.last.to_i-1]

    [old_pos, new_pos]
  end

end
