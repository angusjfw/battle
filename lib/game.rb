require_relative 'attack.rb'

class Game
  include Attack
  attr_reader :player1, :player2, :loser, :damage, :move, :turns, :ai, 
    :prev_damage, :prev_move

  def initialize(player1, player2, ai)
    @player1 = player1
    @player2 = player2
    @ai = ai
    @loser = nil
    @move = ''
    @turns = 0
    @damage = 0
    @prev_damage = 0
    rand_start([player1, player2], ai)
  end

  def take_turn(active, inactive, type)
    @prev_move = move
    @move = type
    eval_attack(active, inactive, type)
    @loser = inactive if inactive.hp <= 0 && loser.nil?
  end

  def active_player 
    players[0]
  end

  def inactive_player 
    players[1]
  end

  def switch_turns
    @turns += 1
    poison_damage players if turns.even?
    players.reverse!
  end
  
  private
  attr_reader :players

  def rand_start(playas, ai)
    r = Kernel.rand(2)
    @players = [playas[r], playas[(r+1)%2]]
    if ai && players[0] == player2
      attack!(player2, player1, 'attack')
      switch_turns
    end
  end
end
