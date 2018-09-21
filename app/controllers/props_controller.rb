require 'pry'
class PropsController < ApplicationController

  get '/props/new' do
    erb :"/props/new"
  end

  post '/props' do
    @prop = Prop.new(params)
    if @prop.valid?
      @prop.save
    else
      raise.params.inspect
    end
    erb :"/props/show"
  end

  get '/props/:id' do
    @prop = Prop.find_by(id: params[:id])
    erb :"/props/show"
  end

  get '/props/:id/edit' do
    if is_logged_in?(session)
      @prop = Prop.find_by(id: params[:id])
      if !@prop
        redirect "/props/prop_errors"
      else
        erb :"props/edit"
      end
    else
      redirect '/'
    end

  end








end
