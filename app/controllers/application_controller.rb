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

  get "/sessions/login" do

  end


  helpers do


  end

end
