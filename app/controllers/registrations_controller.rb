require 'pry'
class RegistrationsController < ApplicationController

  get "/registrations/signup" do
    erb :"/registrations/signup"
  end

  get "/registrations/login" do
    if is_logged_in?
      redirect "/users/dashboard"
    else
      erb :"sessions/login"
    end
  end

  post '/registrations/users' do
    if is_logged_in?
      @user = User.new(params)
      @user.is_admin = true if User.all.size == 0       #creates a default admin to the first User if there are no Users in the DB
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect "users/dashboard"
      else
        erb :"error"
      end
    else
      redirect '/'
    end
  end
end
