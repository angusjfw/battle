require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  get '/' do
    erb :index
  end
  
  post '/names' do
    name1 = params[:name1] == '' ? 'Pikachu':params[:name1]
    name2 = params[:name2] == '' ? 'Bulbasaur':params[:name2]
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    $game = Game.new(player1, player2)
    redirect '/play'
  end     

  get '/play' do
    @game = $game
    erb :play
  end

  post '/attack' do
    $game.attack! $game.inactive_player
    $game.switch_turns
    redirect '/play'
  end

  get '/restart' do
    player1 = $game.player1.revive!
    player2 = $game.player2.revive!
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  run! if app_file == $0
end
