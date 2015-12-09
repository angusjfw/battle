require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }

  describe '#attack' do
    it 'one player attacks another player' do
      expect(player2).to receive(:ouch!)
      game.attack!(player1, player2)
    end
  end
end
