module AI
  def ai_attack_and_switch
    moves = ['attack', 'poison', 'heal']
    ai_move = moves[Kernel.rand(3)]
    $game.take_turn(ai_move)
    $game.switch_turns
  end
end
