require 'pry'
class PropsController < ApplicationController

  get '/props/new' do
    erb :"/props/new"
  end

  get '/props' do
    @props = Prop.all
    erb :"/props/index"
  end

  post '/props' do
    @prop = Prop.new(params)
    if @prop.valid?
      @prop.save
    else
      redirect "/prop_errors"
    end
    erb :"/props/show"
  end

  get '/props/:id/add' do
    prop = Prop.find_by(id: params["id"])
    session["selected_props"] << prop
    redirect '/props'
  end

  get '/prop_errors' do
    erb :prop_errors

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
    if is_logged_in?(session)
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
    @prop.destroy
    redirect '/props'
  end








end
