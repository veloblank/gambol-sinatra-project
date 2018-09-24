require './config/environment'

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
    session["selected_props"] = []    #throws an error when Logged out bc session["selected_props"] is iterated on after the redirect
    redirect '/'
    # TODO: Fix the nil class error without reassigning the session hash just before the redirect
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
