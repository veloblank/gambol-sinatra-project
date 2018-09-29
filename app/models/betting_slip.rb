class BettingSlip < ActiveRecord::Base
  belongs_to :user

  has_many :betting_slip_props
  has_many :props, through: :betting_slip_props





end
