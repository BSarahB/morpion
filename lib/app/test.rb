#---------------------------------PLAYER---------------------------------------------------

class Player
  attr_reader :name, :symbol 

  def initialize(name, symbol)
  
   @name = name
   @symbol = symbol

   puts "Bonjour #{@name} tu joues avec le symbole #{@symbol} !"

  end
end
#------------------------------------GAME------------------------------------------------
class Game
  attr_accessor :board, :players


 def initialize

   puts "---------------------------------------------------"
   puts"|                   Bienvenue  !                   |"
   puts"|       On te presente le jeu du morpion !         |"
   puts"---------------------------------------------------"


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

	   if is_game_ended? == true
	     puts "BRAVO #{@players[n%2].name}, tu as gagne!"
	      break
	   end

	   if n == 8
	 	 puts "Match nul!!!"
       end
    end
  end

#ici on demande au joueur ce qu il veut renseigner

  def play_game(n) #grace au modulo dont le resultat sera 0 ou 1, on va pouvoir faire alterner nos joueurs
    i = n%2
    puts "#{@players[i].name}, sur quelle case tu veux jouer ton symbole #{@players[i].symbol}? "
    choice = gets.chomp.to_i #on recupere la saisie de l utilisateur et convertit en integer

      while @board.check_get_choice(choice) == true || @board.check_case_choice(choice) == true
	    puts "#{players[i].name} sur quelle case tu veux jouer?"
	    choice = gets.chomp.to_i
	    break
      end

    @board.change_value(choice, @players[i].symbol)
    @board.print_board

  end


  def is_game_ended?
  	if @board.combination_ending_the_game == true
  		puts "Le jeu est termine!"
  		true
    end
  end


end


#----------------------------------------BOARD-------------------------------------------------
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
  
  def change_value(choice, symbol)
    @case_array[choice-1].value = symbol
  end

  def check_get_choice(choice)
    choice = choice.to_s
      if choice.start_with?("1","2","3","4","5","6","7","8","9")
      false
      else
	    puts "Tu dois choisir entre 1 et 9!"
	  true
     end
  end


  def check_case_choice(choice)
    if @case_array[choice-1].value == "X" || @case_array[choice-1].value == "O"
      puts "Cette case est deja prise!"
      true
    else
	  false
    end
  end


  def combination_ending_the_game

    if @case_array[0].value == @case_array[1].value && @case_array[1].value == @case_array[2].value
	  true

    elsif @case_array[3].value == @case_array[4].value && @case_array[4].value == @case_array[5].value
	  true

    elsif @case_array[6].value == @case_array[7].value && @case_array[7].value == @case_array[8].value
	  true
    elsif @case_array[1].value == @case_array[5].value && @case_array[5].value == @case_array[9].value
	  true
    elsif @case_array[3].value == @case_array[5].value && @case_array[5].value == @case_array[7].value
	  true
    else
	  false
    end
  end

end
#-----------------------------------BOARDCASE---------------------------------------

class BoardCase
  attr_accessor  :value


  def initialize(value)
   @value = value
  end
end

#--------------------------------------------------------------------------------------
my_game = Game.new