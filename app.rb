require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  post '/attack' do
    session[:attack_confirmation] = params[:attack_confirmation]
    Game.new.attack($player_2)
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2
    @attack_confirmation = session[:attack_confirmation]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
