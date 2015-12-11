require_relative 'attack.rb'

class Game
  include Attack
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

  def attack!(player, type)
    @prev_move = move
    @move = type
    eval_attack(player, type)
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
    poison_damage players if turns.even?
    players.reverse!
  end
  
  private
  attr_reader :players

  def rand_start (playas, ai)
    r = Kernel.rand(2)
    @players = [playas[r], playas[(r+1)%2]]
    if ai && players[0] == player2
      attack! player1
      switch_turns
    end
  end

  def poison_damage players
    players.each{ |player| player.poison_effect if player.poison > 0 }
  end
end
