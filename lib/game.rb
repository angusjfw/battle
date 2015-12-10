class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
  end

  def attack! player
    player.ouch!
  end

  def active_player 
    players[0]
  end

  def inactive_player 
    players[1]
  end

  def switch_turns
    players.reverse! 
  end
  
  private
  attr_reader :players
end
