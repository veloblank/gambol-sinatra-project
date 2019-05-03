class BettingSlipsController < ApplicationController

  get '/betting-slips' do
    if is_logged_in?
      @user = current_user
      @slips = @user.betting_slips
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
    if is_logged_in?
      user = current_user
      slip = user.betting_slips.build(params) #refactored from messy BettingSlip.new and/or shovel
      if slip.valid?
        slip.save
        redirect "/betting-slips/#{slip.id}"
      else
        redirect '/prop_errors'
      end
    else
      redirect '/'
    end
  end

  post '/betting-slips/:id/add-picks' do
    if is_logged_in?
      slip = BettingSlip.find_by(id: params[:id])
      props = current_user.props

      props.each do |prop_id|
        prop = Prop.find_by(id: prop_id)
        slip.props << prop
      end
      clear_pending_picks
      redirect "/betting-slips/#{slip.id}"  #somewhat of a show page, shows the pick in the list
    else
      redirect '/'
    end
  end

  get '/betting-slips/:slip_num' do
    if is_logged_in?
      @slip = BettingSlip.find_by(id: params[:slip_num])
      if @slip && current_user.id == @slip.user_id
        @props = @slip.props
        erb :"betting-slips/show"
      else
        redirect "prop_errors"    #only betting slips creators who are current_user can view list
      end
    end
  end

  delete '/betting-slips/:id/delete' do
    if logged_in?
      betting_slip = BettingSlip.find_by(id: params[:id])
      if betting_slip.user.id == current_user.id
        betting_slip.destroy
        redirect '/betting-slips'
      else
        redirect "prop_errors"
      end
    else
      redirect '/'
    end
  end
end
