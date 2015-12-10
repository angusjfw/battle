require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  get '/' do
    erb :index
  end
  
  post '/names' do
    player1 = Player.new(params[:name1])
    player2 = Player.new(params[:name2]) 
    $game = Game.new(player1, player2)
    redirect '/play'
  end     

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack' do
    $game.attack! $game.inactive_player
    redirect '/attacked'
  end

  get '/attacked' do
    @game = $game
    erb :attacked
  end

  post '/switch_turns' do
    $game.switch_turns
    redirect '/play'
  end

  run! if app_file == $0
end
