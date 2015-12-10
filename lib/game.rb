class Game
  attr_reader :player1, :player2, :loser

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
    @loser = nil
  end

  def attack! player
    player.ouch!
    @loser = player if player.hp <= 0
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
