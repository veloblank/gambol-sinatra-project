class User < ActiveRecord::Base
  has_many :betting_slips

  has_many :user_props
  has_many :props, through: :user_props

  has_secure_password
  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email, :password_digest

# TODO: Need a method to make other users an admin and to keep track of the admins.


end
