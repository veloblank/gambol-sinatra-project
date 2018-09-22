class BettingSlipsController < ApplicationController

  get '/betting-slips/new' do
    erb :"betting-slips/new"
  end

  post '/betting_slips' do
    betting-slip = BettingSlip.new(params)
    betting-slip.valid?
    
  end

end
