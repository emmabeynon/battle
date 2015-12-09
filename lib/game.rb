class Game
  attr_reader :current_turn, :players

  def initialize(player_1,player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def attack(player)
    player.receive_damage
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  private

  def opponent_of(the_player)
    if the_player == players[0]
      @current_turn = players[1]
    else
      @current_turn = players[0]
    end
  end

end
