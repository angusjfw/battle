require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/ai'

class Battle < Sinatra::Base
  include AI

  get '/' do
    erb :index
  end
  
  post '/sign-in' do
    ai = !!params['ai']
    name1 = params[:name1] == '' ? 'Pikachu':params[:name1]
    name2 = params[:name2] == '' ? 'Bulbasaur':params[:name2]
    $game = Game.new(Player.new(name1), Player.new(name2), ai)
    redirect '/play'
  end     

  get '/play' do
    redirect '/' if !$game 
    @game = $game
    erb :play
  end

  post '/attack' do
    type = params.keys[0]
    $game.take_turn($game.active_player, $game.inactive_player, type)
    $game.switch_turns
    ai_attack_and_switch if $game.ai && $game.loser.nil?
    redirect '/play'
  end

  get '/restart' do
    player1 = $game.player1.revive!
    player2 = $game.player2.revive!
    ai = $game.ai
    $game = Game.new(player1, player2, ai)
    redirect '/play'
  end

  run! if app_file == $0
end
