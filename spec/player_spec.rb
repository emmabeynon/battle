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

  it 'is a computerised player' do
    computer_player = described_class.new("Computer", true)
    expect(computer_player.computer).to be true
  end

  describe '#receive_damage' do
    before do
      allow(Kernel).to receive(:rand) { 5 }
    end

    it "reduces player 2's HP by 5" do
      expect{ player_2.receive_damage(Player::DEFAULT_HP) }.to change{ player_2.hp }.by -5
    end

    it "reduces player 1's HP by 5" do
      expect{ player_1.receive_damage(Player::DEFAULT_HP) }.to change{ player_1.hp }.by -5
    end
  end

  describe '#poisoned' do
    it 'poisons the player' do
      player_2.receive_poison
      expect(player_2.poisoned).to be true
    end
  end

  describe '#asleep' do
    before do
      allow(Kernel).to receive(:rand) { 2 }
    end
    it 'sends player 1 to sleep' do
      player_2.receive_sleep_attack
      expect(player_2.asleep).to be true
    end
  end

end
