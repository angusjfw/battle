describe Player do
  player1 = 'Pikachu'
  subject(:player) { described_class.new('Pikachu') }

  it 'has a name' do
    expect(player.name).to eq player1
  end
end
