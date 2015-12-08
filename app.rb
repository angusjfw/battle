require 'sinatra/base'

class Battle < Sinatra::Application
  get '/' do
    erb :index
  end

  post '/names' do
    @player1 = params[:name1]
    @player2 = params[:name2]
    erb :play
  end     

  run! if app_file == $0
end
