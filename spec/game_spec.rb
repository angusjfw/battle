require 'game'

describe Game do
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }
  subject(:game) { described_class.new(player1, player2) }

  describe '#' do
    it 'takes two players' do
      expect(game.players).to eq [player1, player2]  
    end
  end

  describe '#attack' do
    it 'one player attacks another player' do
      expect(player2).to receive(:ouch!)
      game.attack!(player1, player2)
    end
  end
end
