require './config/environment'

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

  post '/users' do

  end

  get "/sessions/login" do

  end


  helpers do


  end

end
