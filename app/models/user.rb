class User < ActiveRecord::Base
  has_many :betting_slips
  has_many :betting_slip_props
  has_many :props, through: :betting_slips






end
