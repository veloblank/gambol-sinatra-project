require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    #use Rack::Flash
    set :session_secret, "my-application-secret-secret"
  end

  get "/" do
    erb :landing_page
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  helpers do
    def current_user(session_hash)
      user = User.find_by(id: session_hash[:user_id])
      return user if user
    end

    def is_logged_in?(session_hash)
      !!current_user(session_hash)
    end
  end
end
