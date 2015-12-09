require 'player'

describe Player do
  subject(:player_1) { described_class.new(name) }
  subject(:player_2) { described_class.new(name) }
  let(:name) { double :name }

  describe '#name' do
    it 'returns a player name' do
      expect(player_1.name).to eq name
    end
  end

  describe '#attack' do
    it 'damages the player' do
      # expect(player_2).to receive(:receive_damage)
      player_1.attack(player_2)
    end
  end

  describe '#receive_damage' do
    it 'reduces HP by 10' do
      expect{ player_2.receive_damage }.to change{ player_2.hp }.by -10
    end
  end
end
