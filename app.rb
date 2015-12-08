require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end
  
  post '/names' do
    session[:player1] = params[:name1]
    session[:player2] = params[:name2]
    redirect '/play'
  end     

  get '/play' do
    @player1 = session[:player1]
    @player2 = session[:player2]
    @player1hp = 60
    @player2hp = 60
    erb :play
  end

  run! if app_file == $0
end
