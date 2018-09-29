class UsersController < ApplicationController


  post '/sessions' do
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect '/users/dashboard'
    else
      redirect '/registrations/login'
    end
  end

  get '/users/dashboard' do
    user = User.find_by(id: session[:user_id])
    if user == current_user
      # TODO: possible future feature is remove ability to see all Users' betting_slips, since these should be private/have limited access from other users
      @users = User.all
      @betting_slips = BettingSlip.all #no reason to call compact on this array, since no bad data should ever be saved
        erb :"users/dashboard"
    else
      redirect '/'
    end
  end

end
