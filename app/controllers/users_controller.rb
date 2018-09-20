class UsersController < ApplicationController

  get '/users/dashboard' do
    user = User.find_by(id: session[:user_id])
    if user && user == current_user(session)
      "Hola #{user.username}"
    else
      redirect '/'
    end
  end





end
