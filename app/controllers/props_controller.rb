require 'pry'
class PropsController < ApplicationController

  get '/props/new' do
    if is_logged_in?
      erb :"/props/new"
    else
      redirect '/'
    end
  end

  post '/props' do
    if is_logged_in?
      @prop = Prop.new(params)
      if @prop.valid?
        @prop.save
      else
        redirect "/prop_errors"
      end
    else
      redirect '/'
    end
    erb :"/props/show"
  end

  get '/props' do
    @props = Prop.all
    erb :"/props/index"
  end


  get '/props/:id/add' do
    if is_logged_in?
      prop = Prop.find_by(id: params["id"])
      user = current_user
      user.props << prop
      redirect '/props'
    else
      redirect '/'
    end
  end

  get '/prop_errors' do
    erb :prop_errors
  end

  post '/props/clear_pending_picks' do
    if is_logged_in?
      clear_pending_picks
        redirect '/props'
    else
      redirect '/'
    end
  end

  get '/props/:id' do
    @prop = Prop.find_by(id: params[:id])
    if @prop && is_logged_in?
      erb :"/props/show"
    else
      redirect "/prop_errors"
    end
  end

  get '/props/:id/edit' do
    if is_logged_in? && is_admin?
      @prop = Prop.find_by(id: params[:id])
      if !@prop
        erb :"/props/prop_errors"
      else
        erb :"props/edit"
      end
    else
      redirect '/'
    end

  end

  patch '/props/:id/edit' do
    if is_logged_in?
      @prop = Prop.find_by(id: params[:id])
      @prop.title = params[:title]
      @prop.description = params[:description]
      @prop.odds = params[:odds]
      @prop.risk = params[:risk]
      if @prop.valid?
        @prop.save
        erb :"/props/show"
      else
        redirect "/prop_errors"
      end
    else
      redirect '/'
    end
  end

  delete '/props/:id/delete' do
    if is_logged_in?
      @prop = Prop.find_by(id: params[:id])
      if is_admin?
        @prop.destroy
      else
        redirect "props/error"
      end
    else
      redirect '/'
    end
    redirect '/props'
  end
end
