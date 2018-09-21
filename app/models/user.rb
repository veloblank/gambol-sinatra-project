class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email, :password_digest
  has_many :betting_slips
  has_many :betting_slip_props
  has_many :props, through: :betting_slips

# TODO: Need a method to make other users and admin and to keep track of the admins.


end
