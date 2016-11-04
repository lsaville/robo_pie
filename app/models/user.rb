class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  validates_confirmation_of :password

  has_many :orders
end
