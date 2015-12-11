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
    hard = !!params['hard']
    ai = true if hard == true
    name1 = params[:name1] == '' ? 'Pikachu':params[:name1]
    name2 = params[:name2] == '' ? 'Bulbasaur':params[:name2]
    $game = Game.new(Player.new(name1), Player.new(name2), ai, hard)
    redirect '/play'
  end     

  get '/play' do
    redirect '/' if !$game 
    @game = $game
    erb :play
  end

  post '/attack' do
    type = params.keys[0]
    $game.take_turn(type)
    $game.switch_turns
    ai_attack if $game.ai && $game.loser.nil?
    redirect '/play'
  end

  get '/restart' do
    player1 = $game.player1.revive!
    player2 = $game.player2.revive!
    ai, hard = $game.ai, $game.hard
    $game = Game.new(player1, player2, ai, hard)
    redirect '/play'
  end

  run! if app_file == $0
end
