class UsersController < ApplicationController


  post '/sessions' do
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect '/users/dashboard'
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
