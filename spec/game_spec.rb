require 'game'

describe Game do
  let(:player1) { double :player1, poison: 0 }
  let(:player2) { double :player2, damage!: nil, hp: 666, poison: 0 }
  subject(:game) { described_class.new(player1, player2, false, false) }

  describe '#initialize' do
    it 'takes two players' do
      expect([game.player1, game.player2]).to eq [player1, player2]  
    end
  end

  describe '#take_turn' do
    it 'active player can attack other player' do
      allow(Kernel).to receive(:rand).and_return 0
      game = Game.new(player1, player2, false, false)
      expect(player2).to receive(:damage!)
      game.take_turn('attack')
    end
  end

  describe '#active_player' do
    it 'active player switches after each turn' do
      allow(Kernel).to receive(:rand).and_return 0
      game = Game.new(player1, player2, false, false)
      expect(game.active_player).to eq player1
    end
  end

  describe '#inactive_player' do
    it ' returns the player who is not having their turn' do
      allow(Kernel).to receive(:rand).and_return 0
      game = Game.new(player1, player2, false, false)
      expect(game.inactive_player).to eq player2
    end
  end
 
  describe '#switch_turns' do
    it 'switches active and inactive player' do
      allow(Kernel).to receive(:rand).and_return 0
      game = Game.new(player1, player2, false, false)
      game.switch_turns
      expect(game.active_player).to eq player2
    end
  end
end
