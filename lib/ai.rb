module AI
  def ai_attack
    if $game.hard == true
      ai_clever_attack_and_switch
    else
      ai_random_attack_and_switch
    end
  end

  def ai_random_attack_and_switch
    moves = ['attack', 'poison', 'heal']
    ai_move = moves[Kernel.rand(3)]
    $game.take_turn(ai_move)
    $game.switch_turns
  end

  def ai_clever_attack_and_switch
    if $game.move == 'heal' || Kernel.rand(5) == 0
      $game.take_turn('attack')
    elsif $game.player2.hp < 4
      $game.take_turn('heal')
    elsif $game.player2.poison > 0
      if Kernel.rand(3) == 0
        $game.take_turn('attack')
      else
      $game.take_turn('heal')
      end
    elsif $game.player1.poison == 0 && $game.player1.hp > 11
      $game.take_turn('poison')
    else
      $game.take_turn('attack')
    end
    $game.switch_turns
  end
end
