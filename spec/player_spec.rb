describe Player do
  name = 'Pikachu'
  default_hp = Player::DEFAULT_HP
  
  subject(:player) { described_class.new(name) }

  describe '#name' do
    it 'has a name' do
      expect(player.name).to eq name
    end
  end

  describe '#hp' do
    it 'returns hp' do
      expect(player.hp).to eq default_hp
    end
  end

  describe '#damage!' do
    it 'reduces hp by 10' do
      expect{ player.damage! 10 }.to change{ player.hp }.by -10
    end 
  end

  describe '#heal!' do
    it 'increases hp by 10, capped at 60' do
      player.damage! 5
      expect{ player.heal! }.to change{ player.hp }.by 5
    end
  end
end
