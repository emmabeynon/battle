require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2)}
  let(:player_1) { double :player_1, receive_damage: nil }
  let(:player_2) { double :player_2, receive_damage: nil }


  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'retrieves the first player' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#attack' do
    it 'damages player 2' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2, Player::DEFAULT_HP)
    end

    it 'damages player 1' do
      expect(player_1).to receive(:receive_damage)
      game.attack(player_1, Player::DEFAULT_HP)
    end
  end

  describe '#current_turn' do
    it 'starts as player_1' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'switches turn to player 2 after player 1 has attacked' do
      game.attack(player_2, Player::DEFAULT_HP)
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end

end
