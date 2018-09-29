class User < ActiveRecord::Base
  has_secure_password
  has_many :betting_slips

  has_many :pending_picks
  has_many :props, through: :pending_picks

  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email, :password_digest
  #serialize :pending_picks


end
