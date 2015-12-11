module Attack
  def eval_attack(player, type)
    case type
    when 'attack'
      player.damage! rand_damage
    when 'poison'
      player.poison!
    end
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
