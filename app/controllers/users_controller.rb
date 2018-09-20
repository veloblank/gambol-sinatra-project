class UsersController < ApplicationController

  get '/users/dashboard' do
    user = User.find_by(id: session[:user_id])
    if user && user == current_user(session)
       erb :"users/dashboard"
    else
      redirect '/'
    end
  end





end
