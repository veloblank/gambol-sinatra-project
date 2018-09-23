class BettingSlipsController < ApplicationController

  get '/betting-slips' do
    if is_logged_in?(session)
      @user = current_user(session)
      @slips = @user.betting_slips.all
      erb :"betting-slips/index"
    else
      redirect '/'
    end
  end

  get '/betting-slips/new' do
    if is_logged_in?(session)
      erb :"betting-slips/new"
    else
      redirect '/'
    end
  end

  post '/betting-slips' do
    betting_slip = BettingSlip.new(params)
    betting_slip.user_id = session[:user_id]
    if betting_slip.valid?
      betting_slip.save
      redirect "/users/#{session[:user_id]}/betting-slips/#{betting_slip.id}"
    else
      redirect '/prop_errors'
    end
  end

  post '/betting-slips/:id/add-picks' do
    @slip = BettingSlip.find_by(id: params[:id])
    @props = session["selected_props"]
    # TODO: FIX THIS ISSUE WITH ASSOCIATIONS ON MONDAY WITH 1:1 SUPPORT


    binding.pry
    # @props.each do |prop|
    #   @slip.props << prop
    #
    # end

    redirect '/'

  end


  get '/users/:id/betting-slips/:slip_num' do
    if is_logged_in?(session)
      @slip = BettingSlip.find_by(id: params[:slip_num])
      if @slip && current_user(session).id == params[:id].to_i
        erb :"betting-slips/show"
      else
        redirect "prop_errors"
      end
    end
  end

  delete '/betting-slips/:id/delete' do
    betting_slip = BettingSlip.find_by(id: params[:id])
    betting_slip.destroy
    redirect '/betting-slips'
  end

end
