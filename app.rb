require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/names' do
    $game = Game.new(Player.new(params[:name1]), Player.new(params[:name2]))
    redirect '/play'
  end     

  get '/play' do
    @player1 = $game.player1.name
    @player2 = $game.player2.name
    @player1hp = $game.player1.hp
    @player2hp = $game.player2.hp
    erb :play
  end

  post '/attack' do
    $game.attack! $game.player1, $game.player2
    redirect '/attack'
  end

  get '/attack' do
    @player2 = $game.player2.name
    erb :attack
  end

  run! if app_file == $0
end
