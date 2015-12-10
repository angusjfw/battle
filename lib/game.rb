class Game
  attr_reader :player1, :player2, :loser, :damage

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
    @loser = nil
  end

  def attack! player
    player.damage! rand_damage
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

  def rand_damage
    damage = Kernel.rand(10) + 5
    damage += 20 if Kernel.rand(10) == 0
    @damage = damage
  end
end
