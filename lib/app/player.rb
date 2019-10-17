#---------------------------------PLAYER---------------------------------------------------

class Player
  attr_reader :name, :symbol 

  def initialize(name, symbol)
  
   @name = name
   @symbol = symbol

   puts "Bonjour #{@name} tu joues avec le symbole #{@symbol} !"

  end
end