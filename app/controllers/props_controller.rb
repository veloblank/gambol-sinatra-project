require 'pry'
class PropsController < ApplicationController

  get '/props/new' do
    erb :"/props/new"
  end

  post '/props' do
    @prop = Prop.new(params)
    binding.pry
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
    "Edit Room!"

  end








end
