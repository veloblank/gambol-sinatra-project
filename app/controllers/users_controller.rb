class UsersController < ApplicationController


  post '/users/login' do
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      "Welcome!"
    else
      "Incorrect Password"
    end
  end

  get '/users/dashboard' do
    user = User.find_by(id: session[:user_id])
    if user && user == current_user(session)
       erb :"users/dashboard"
    else
      redirect '/'
    end
  end





end
