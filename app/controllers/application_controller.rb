require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :landing_page
  end

  get "/signup" do

  end

  get "/login" do
    
  end

end
