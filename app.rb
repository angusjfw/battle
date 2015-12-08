require 'sinatra/base'

class Battle < Sinatra::Application
  set :sessions, true
  get '/' do
    'Welcome to Battle!'
  end

  run! if app_file == $0
end
