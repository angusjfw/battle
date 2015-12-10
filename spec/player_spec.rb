describe Player do
  name1 = 'Pikachu'
  name2 = 'Bulbasaur'

  subject(:player) { described_class.new(name1) }
  let(:player2) { described_class.new(name2) }
  default_hp = Player::DEFAULT_HP

  describe '#name' do
    it 'has a name' do
      expect(player.name).to eq name1
    end
  end

  describe '#hp' do
    it 'returns hp' do
      expect(player.hp).to eq default_hp
    end
  end

  describe '#damage!' do
    it 'reduces hp by 10' do
      expect{ player2.damage! 10 }.to change{ player2.hp }.by -10
    end
  end
end
