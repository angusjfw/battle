describe Player do
  subject(:player) { described_class.new('Pikachu') }
  player1 = 'Pikachu'
  default_hp = Player::DEFAULT_HP

  describe '#name' do
    it 'has a name' do
      expect(player.name).to eq player1
    end
  end

  describe '#hp' do
    it 'returns hp' do
      expect(player.hp).to eq default_hp
    end
  end
end
