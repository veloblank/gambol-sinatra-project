class Prop < ActiveRecord::Base
  has_many :betting_slip_props
  has_many :users, through: :betting_slip_props


end
