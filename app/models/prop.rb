class Prop < ActiveRecord::Base
  has_many :betting_slip_props
  has_many :users, through: :betting_slip_props
  validates_presence_of :title, :odds, :risk
  validates_numericality_of :odds, :risk, only_float: true


end
