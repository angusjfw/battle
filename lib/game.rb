class Game
  attr_reader :player1, :player2, :loser, :damage, :move, :turns, :ai, 
    :prev_damage, :prev_move

  def initialize(player1, player2, ai)
    @player1 = player1
    @player2 = player2
    @loser = nil
    @turns = 0
    @ai = ai
    rand_start([player1, player2], ai)
  end

  def attack! player
    @prev_move = move
    @move = :attack
    player.damage! rand_damage
    @loser = player if player.hp <= 0 && loser.nil?
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
    @prev_damage = damage
    new_damage = Kernel.rand(10) + 5
    new_damage += 15 if Kernel.rand(7) == 0
    new_damage = 0 if Kernel.rand(10) == 0
    @damage = new_damage
  end

  def rand_start (playas, ai)
    r = Kernel.rand(2)
    @players = [playas[r], playas[(r+1)%2]]
    if ai && players[0] == player2
      attack! player1
      switch_turns
    end
  end
end
