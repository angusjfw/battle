require_relative 'attack.rb'

class Game
  include Attack
  attr_reader :player1, :player2, :ai, :turns, :damage, :prev_damage, :move, 
    :prev_move, :loser

  def initialize(player1, player2, ai)
    @player1, @player2, @ai = player1, player2, ai
    @turns, @damage, @prev_damage = 0, 0, 0
    @move, @prev_move, @loser = nil, nil, nil
    rand_start([player1, player2], ai)
  end

  def take_turn(type)
    @prev_move = move
    @move = type
    eval_attack(active_player, inactive_player, type)
    @loser = inactive_player if inactive_player.hp <= 0 && loser.nil?
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
    if ai && active_player == player2
      take_turn('attack')
      switch_turns
    end
  end
end
