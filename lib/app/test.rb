

class Player
   
    attr_reader :name, :symbol 

     def initialize(name, symbol)
  
   @name = name
   @symbol = symbol

      puts "Bonjour #{@name} tu joues avec le symbole #{@symbol} !"

 end
end

class Game
    attr_accessor :board, :players


 def initialize

   puts "---------------------------------------------------"
   puts"|          Bienvenue sur MorPiOOn !               |"
   puts"|Le but du jeu est d'aligner trois de tes pions' !|"
   puts"--------------------------------------------------"


   puts "Quel est ton pseudo, joueur 1 ?"
   name1 = gets.chomp
   player1 = Player.new(name1, "X")

   puts "Quel est ton pseudo, joueur 2 ?"
   name2 = gets.chomp
   player2 = Player.new(name2, "O")
   
   #on range les joueurs dans un array
   @players  = [player1, player2]

  # initialisons la board
    @board = Board.new

    #on va lancer une partie maintenant avec launch_game, on va demander d afficher le tableau de jeu
    launch_game

end

def launch_game

  9.times do |n|
    play_game(n)

end

end

def play_game(n) #grace au modulo dont le resultat sera 0 ou 1, on va pouvoir faire alterner nos joueurs
  i = n%2
puts "#{@players[i].name}, sur quelle case tu veux jouer ton symbole #{@players[i].symbol}? "
choice = gets.chomp.to_i #on recupere la saisie de l utilisateur et convertit en integer
#change_value(choice, @players[i].symbol)
end



end
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
my_game = Game.new