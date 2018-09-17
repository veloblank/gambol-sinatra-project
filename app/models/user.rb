class User < ActiveRecord::Base
  has_secure_password
  has_many :betting_slips
  has_many :betting_slip_props
  has_many :props, through: :betting_slips
  validates_uniqueness of :username, :email
  validates_presence_of :username, :email, :password_digest






end
