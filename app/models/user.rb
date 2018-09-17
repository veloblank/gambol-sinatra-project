class User < ActiveRecord::Base
  has_secure_password
  has_many :betting_slips
  has_many :betting_slip_props
  has_many :props, through: :betting_slips
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password_digest, presence: true






end
