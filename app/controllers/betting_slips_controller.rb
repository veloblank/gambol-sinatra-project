require 'pry'
class BettingSlipsController < ApplicationController

  get '/betting-slips' do
    if is_logged_in?
      @user = current_user
      @slips = @user.betting_slips.all
      erb :"betting-slips/index"
    else
      redirect '/'
    end
  end

  get '/betting-slips/new' do
    if is_logged_in?
      erb :"betting-slips/new"
    else
      redirect '/'
    end
  end

  post '/betting-slips' do
    user = current_user
    betting_slip = user.betting_slips.build(params) #refactored from messy BettingSlip.new and/or shovel
    if betting_slip.valid?
      betting_slip.save
      redirect "/users/#{session[:user_id]}/betting-slips/#{betting_slip.id}"
    else
      redirect '/prop_errors'
    end
  end

  post '/betting-slips/:id/add-picks' do
    slip = BettingSlip.find_by(id: params[:id])
    props = current_user.props
    props.each do |prop_id|
      prop = Prop.find_by(id: prop_id)
      slip.props << prop
    end
    if slip.save
      clear_pending_picks
      redirect "/props"
    else
      redirect '/prop_errors'
    end

  end


  get '/users/:id/betting-slips/:slip_num' do
    if is_logged_in?
      @slip = BettingSlip.find_by(id: params[:slip_num])
      if @slip && current_user.id == params[:id].to_i
        @props = @slip.props
        erb :"betting-slips/show"
      else
        redirect "prop_errors"
      end
    end
  end

  delete '/betting-slips/:id/delete' do
    betting_slip = BettingSlip.find_by(id: params[:id])
    user = current_user
    if betting_slip.user.id == user.id
      betting_slip.destroy
      redirect '/betting-slips'
    else
      redirect "prop_errors"
    end
  end

end
