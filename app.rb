require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/names' do
    $game = Game.new
    $player1 = Player.new(params[:name1])
    $player2 = Player.new(params[:name2])
    redirect '/play'
  end     

  get '/play' do
    @player1 = $player1.name
    @player2 = $player2.name
    @player1hp = $player1.hp
    @player2hp = $player2.hp
    erb :play
  end

  post '/attack' do
    $game.attack! $player1, $player2
    redirect '/attack'
  end

  get '/attack' do
    @player2 = $player2.name
    erb :attack
  end

  run! if app_file == $0
end
