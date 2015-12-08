require 'sinatra/base'

class Battle < Sinatra::Application

  get '/' do
    erb :index
  end

  post '/names' do
    @name = params[:name]
    erb :play
  end     

  run! if app_file == $0
end
