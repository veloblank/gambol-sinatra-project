class Prop < ActiveRecord::Base
  has_many :betting_slip_props
  has_many :betting_slips, through: :betting_slip_props

  has_many :pending_picks
  has_many :users, through: :pending_picks

  validates_presence_of :title, :description, :odds
  validates_numericality_of :odds, only_float: true





end
