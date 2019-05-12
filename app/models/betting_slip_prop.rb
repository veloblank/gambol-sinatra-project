class BettingSlipProp < ActiveRecord::Base
  belongs_to :betting_slip
  belongs_to :prop
end
