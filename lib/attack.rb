module Attack
  def eval_attack(active, inactive, type)
    case type
    when 'attack'
      inactive.damage! rand_damage
    when 'poison'
      inactive.poison!
    when 'heal'
      active.heal!
    end
  end

  def poison_damage players
    players.each{ |player| player.poison_effect if player.poison > 0 }
    players.each{ |player| @loser = player if player.hp == 0 }
  end

  private 
  
  def rand_damage
    @prev_damage = damage
    new_damage = Kernel.rand(10) + 5
    new_damage += 15 if Kernel.rand(7) == 0
    new_damage = 0 if Kernel.rand(10) == 0
    @damage = new_damage
  end
end
