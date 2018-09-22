class BettingSlipsController < ApplicationController


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

end
