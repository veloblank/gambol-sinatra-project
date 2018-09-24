class Prop < ActiveRecord::Base
  has_many :user_props
  has_many :users, through: :user_props

  validates_presence_of :title, :description, :odds
  validates_numericality_of :odds, only_float: true


end
