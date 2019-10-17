require_relative 'game'

class Application
  attr_accessor :game 


  def initialize
    @game = Game.new
    
  end
end