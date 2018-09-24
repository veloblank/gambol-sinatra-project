class UsersController < ApplicationController


  post '/sessions' do
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      session[:selected_props] = []
      redirect '/users/dashboard'
    else

      redirect '/registrations/login'
    end
  end

  get '/users/dashboard' do
    user = User.find_by(id: session[:user_id])
    if user && user == current_user(session)
      @users = User.all
      @betting_slips = BettingSlip.all.compact
       erb :"users/dashboard"
    else

      redirect '/'
    end
  end

end
