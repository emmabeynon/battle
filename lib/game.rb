class Game
  attr_reader :current_turn, :players, :attacked_player

  def initialize(player_1,player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def attack(player, max_damage)
    player.receive_damage(max_damage)
  end

  def poison(player)
    player.receive_poison
  end

  def send_to_sleep(player)
    player.receive_sleep_attack
  end

  def wake_up(player)
    player.awake
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_player)
    players.select { |player| player != the_player }.first
  end

  def loser
    losing_players.first
  end

  def poisoned_players
    players.select { |player| player.poisoned }
  end

  def end_game
    losing_players.any?
  end

  private
  attr_reader :players

  def losing_players
    players.select { |player| player.hp <= 0}
  end

end
