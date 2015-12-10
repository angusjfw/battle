class Player
  attr_reader :name, :hp
  DEFAULT_HP = 60

  def initialize name
    @name = name
    @hp = DEFAULT_HP
  end

  def damage! damage
    @hp -= damage
    @hp = 0 if hp < 0
  end
end
