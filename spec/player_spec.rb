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

  describe '#receive_damage' do
    before do
      allow(Kernel).to receive(:rand) { 5 }
    end

    it "reduces player 2's HP by 5" do
      expect{ player_2.receive_damage }.to change{ player_2.hp }.by -5
    end

    it "reduces player 1's HP by 5" do
      expect{ player_1.receive_damage }.to change{ player_1.hp }.by -5
    end
  end
end
