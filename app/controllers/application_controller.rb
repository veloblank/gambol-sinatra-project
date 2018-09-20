require './config/environment'
require 'pry'

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

  get "/registrations/signup" do
    erb :"/registrations/new"
  end

  post '/registrations/users' do
    @user = User.new(params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect "users/dashboard"
    else
      erb :"error"
    end
  end

  get "/registrations/login" do


  end

  get '/registrations/logout' do
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
