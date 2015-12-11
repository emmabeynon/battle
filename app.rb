require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
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
    if @game.end_game
      redirect '/game-over'
    else
      redirect '/paralyse'
    end
  end

  get '/paralyse' do
    @game = $game
    erb :paralyse
  end

  get '/paralysis' do
    @game = $game
    erb :paralysis
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

  get '/game-over' do
    @game = $game
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
