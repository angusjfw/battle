class Game
  attr_reader :player1, :player2, :loser, :damage, :move, :turns

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    rand_start([player1, player2])
    @loser = nil
    @turns = 0
  end

  def attack! player
    @move = :attack
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
    @turns += 1
    players.reverse!
  end
  
  private
  attr_reader :players

  def rand_damage
    damage = Kernel.rand(10) + 5
    damage += 15 if Kernel.rand(7) == 0
    damage = 0 if Kernel.rand(10) == 0
    @damage = damage
  end

  def rand_start (playas)
    r = Kernel.rand(2)
    @players = [playas[r], playas[(r+1)%2]]
  end
end
