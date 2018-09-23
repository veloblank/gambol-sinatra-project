class RegistrationsController < ApplicationController

  get "/registrations/signup" do
    erb :"/registrations/signup"
  end

  get "/registrations/login" do
    if is_logged_in?(session)
      redirect "/users/dashboard"
    else
      erb :"sessions/login"
    end
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
end
