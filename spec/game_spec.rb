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

  describe '#poison' do
    it 'poisons player 2' do
      expect(player_2).to receive(:receive_poison)
      game.poison(player_2)
    end
  end

  describe 'poisoned_players' do
    it 'identifies a poisoned player' do
      allow(player_1).to receive(:poisoned).and_return(false)
      allow(player_2).to receive(:poisoned).and_return(true)
      expect(game.poisoned_players).to eq [player_2]
    end
  end

  describe '#send_to_sleep' do
    it 'attempts to send player 2 to sleep' do
      expect(player_2).to receive(:receive_sleep_attack)
      game.send_to_sleep(player_2)
    end
  end

  describe '#wake_up' do
    it 'wakes up player 2' do
      expect(player_2).to receive(:awake)
      game.wake_up(player_2)
    end
  end

  describe '#heal' do
    it 'heals player 1' do
      expect(player_1).to receive(:receive_healing)
      game.heal(player_1)
    end
  end
end
