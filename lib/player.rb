class Player
  attr_reader :name, :hp, :poison
  DEFAULT_HP = 60

  def initialize name
    @name = name
    @hp = DEFAULT_HP
    @poison = 0
  end

  def damage! damage
    @hp -= damage
    @hp = 0 if hp < 0
  end

  def poison!
    @poison = 3
  end

  def poison_effect
    @poison -= 1
    @hp -= 7
    @hp = 0 if hp < 0
  end

  def heal!
    @hp += 10
    @hp = 60 if hp > 60
    @poison = 0
  end

  def revive!
    @hp = DEFAULT_HP
    @poison = 0
    self
  end
end
