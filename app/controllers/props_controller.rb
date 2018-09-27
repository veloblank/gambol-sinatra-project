require 'pry'
class PropsController < ApplicationController

  get '/props/new' do
    if is_logged_in?(session)
      erb :"/props/new"
    else
      redirect '/'
    end
  end

  get '/props' do
    @props = Prop.all
    erb :"/props/index"
  end

  post '/props' do
    @prop = Prop.new(params)
    #user = current_user(session)
    if @prop.valid?
      @prop.save
    else
      redirect "/prop_errors"
    end
    erb :"/props/show"
  end

  get '/props/:id/add' do
    if is_logged_in?(session)
      prop = Prop.find_by(id: params["id"])
      session["selected_props"] << prop.id
      redirect '/props'
    else
      redirect '/'
    end
  end

  get '/prop_errors' do
    erb :prop_errors
  end

  get '/props/clear_pending_picks' do
    if is_logged_in?(session)
      session["selected_props"] = []
      redirect '/props'
    else
      redirect '/'
    end
  end

  get '/props/:id' do
    @prop = Prop.find_by(id: params[:id])
    if @prop && is_logged_in?(session)
      erb :"/props/show"
    else
      redirect "/prop_errors"
    end
  end

  get '/props/:id/edit' do
    if is_logged_in?(session) && current_user(session).is_admin
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
    @prop = Prop.find_by(id: params[:id])
    @prop.title = params[:title]
    @prop.description = params[:description]
    @prop.odds = params[:odds]
    @prop.risk = params[:risk]
    if @prop.valid?
      @prop.save
    else
      redirect "/prop_errors"
    end
    erb :"/props/show"
  end

  delete '/props/:id/delete' do
    @prop = Prop.find_by(id: params[:id])
    if current_user(session).is_admin
      @prop.destroy
    else
      redirect "props/error"
    end
    redirect '/props'
  end








end
