require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end
  
  post '/names' do
    session[:player1] = params[:name1]
    session[:player2] = params[:name2]
    session[:player1hp] = 60
    session[:player2hp] = 60
    redirect '/play'
  end     

  get '/play' do
    @player1 = session[:player1]
    @player2 = session[:player2]
    @player1hp = session[:player1hp]
    @player2hp = session[:player2hp]
    erb :play
  end

  post '/attack' do
    #session[:player2hp] -= 2
    redirect '/attack'
  end

  get '/attack' do
    @player2 = session[:player2]
    erb :attack
  end

  run! if app_file == $0
end
