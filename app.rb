require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    @game = nil
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name],params[:computer].empty?)
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack' do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_turn), Player::DEFAULT_HP/2)
    @game.attack((@game.current_turn),2) if @game.poisoned_players.include?(@game.current_turn)
    if @game.end_game
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game = $game
    erb :attack
  end

  post '/paralyse' do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_turn), Player::DEFAULT_HP/4)
    @game.attack((@game.current_turn),2) if @game.poisoned_players.include?(@game.current_turn)
    redirect '/game-over-paralysis'
  end

  get '/paralyse' do
    @game = $game
    erb :paralyse
  end

  get '/paralysis' do
    @game = $game
    erb :paralysis
  end

  get '/poison' do
    @game = $game
    erb :poison
  end

  post '/poison' do
    @game = $game
    @game.attack((@game.current_turn),2) if @game.poisoned_players.include?(@game.current_turn)
    @game.poison(@game.opponent_of(@game.current_turn))
    redirect '/poison'
  end

  get '/sleep' do
    @game = $game
    erb :sleep
  end

  post '/sleep' do
    @game = $game
    @game.send_to_sleep(@game.opponent_of(@game.current_turn))
    redirect '/sleep-result'
  end

  get '/sleep-result' do
    @game = $game
    erb :sleep_result
  end

  post '/wake-up' do
    @game = $game
    @game.wake_up(@game.opponent_of(@game.current_turn))
    redirect '/play'
  end

  post '/heal' do
    @game = $game
    @game.heal(@game.current_turn)
    @game.switch_turns
    redirect '/play'
  end

  get '/heal' do
    @game = $game
    erb :heal
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect '/play'
  end

  post '/computer' do
    @game = $game
    @game.attack(@game.player_1, Player::DEFAULT_HP/2)
    redirect '/computer'
  end

  get '/computer' do
    @game = $game
    erb :computer
  end

  get '/game-over-paralysis' do
    @game = $game
    if @game.end_game
      redirect '/game-over'
    else
      redirect '/paralyse'
    end
  end

  get '/game-over' do
    @game = $game
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
