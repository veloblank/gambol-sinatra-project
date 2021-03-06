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

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  get "/users/:id/make-admin" do
    @user = User.find_by(id: params["id"])

    if !is_logged_in? || current_user == @user #a current user cannot change their own admin status
        redirect "/users/dashboard"
    elsif is_admin?
      @user.is_admin = !@user.is_admin
      @user.save
      # TODO: See if this can moved from the controller to the model
      redirect "/users/dashboard"
    else
      redirect "/users/dashboard"
    end

  end

  get '/users/dashboard' do
    if is_logged_in?
      @users = User.all
      @betting_slips = BettingSlip.all #no reason to call compact on this array, since no bad data should ever be saved
      erb :"users/dashboard"
    else
      redirect '/'
    end
  end

end
