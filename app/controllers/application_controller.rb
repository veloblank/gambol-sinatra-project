require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my-application-secret-secret"
  end

  get "/" do
    erb :landing_page
  end

  get "/make-admin/:id" do
    @user = User.find_by(id: params["id"])
    if !is_logged_in? || current_user == @user
        redirect "/users/dashboard"
    elsif
      current_user.is_admin
      @user.is_admin = !@user.is_admin
      @user.save
      redirect "/users/dashboard"
    else
      redirect "/users/dashboard"
    end

    # TODO: refactor helpers and session
  end

  get '/logout' do
    current_user.props.clear
    current_user.save
    session.clear       #order matters
    redirect '/'
  end

  helpers do

    def clear_pending_picks
      binding.pry
      current_user.pending_picks.clear
      current_user.save
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
