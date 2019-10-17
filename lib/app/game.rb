require_relative 'board'
require_relative 'player'

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

