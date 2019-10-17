
class Board

 attr_accessor :case_array

  def initialize
     @case_array = [
     BoardCase.new("1"),
     BoardCase.new("2"),
     BoardCase.new("3"), 
     BoardCase.new("4"), 
     BoardCase.new("5"),
     BoardCase.new("6"),
     BoardCase.new("7"),
     BoardCase.new("8"),
     BoardCase.new("9"),
     ]
print_board
end
def print_board

puts 
puts "Voici ou en est le jeu!"
puts
puts "-------------"
puts "| " + @case_array[0].value + " | " +  @case_array[1].value + " | " + @case_array[2].value + " |"
puts "-------------"
puts "| " + @case_array[3].value + " | " +  @case_array[4].value + " | " + @case_array[5].value + " |"
puts "-------------"
puts "| " + @case_array[6].value + " | " +  @case_array[7].value + " | " + @case_array[8].value + " |"
puts "-------------"


end
  
  #def change_value(choice, symbol)
 #   @case_array[choice-1].value = symbol
 # end
end



class BoardCase
     attr_accessor  :value


  def initialize(value)
   @value = value

  end
end

my_board = Board.new

