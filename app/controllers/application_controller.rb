require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my-application-secret-secret"
  end

  get "/" do
    erb :landing_page #unused at the moment. Can have landing_page-esque greeting/images
  end

  helpers do

    def clear_pending_picks
      current_user.pending_picks.clear
    end

    def current_user
      user = User.find_by(id: session[:user_id])
      return user if user
    end

    def is_logged_in?
      !!current_user
    end
  end
end
