class BettingSlip < ActiveRecord::Base
  belongs_to :user
  has_many :props

  


end
