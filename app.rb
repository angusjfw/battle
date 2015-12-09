require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end
  
  post '/names' do
    $player1 = Player.new(params[:name1])
    $player2 = Player.new(params[:name2])
    session[:player1hp] = 60
    session[:player2hp] = 60
    redirect '/play'
  end     

  get '/play' do
    @player1 = $player1.name
    @player2 = $player2.name
    @player1hp = session[:player1hp]
    @player2hp = session[:player2hp]
    erb :play
  end

  post '/attack' do
    #session[:player2hp] -= 2
    redirect '/attack'
  end

  get '/attack' do
    @player2 = $player2.name
    erb :attack
  end

  run! if app_file == $0
end
