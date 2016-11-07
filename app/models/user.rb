class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates_confirmation_of :password

  has_many :orders

  enum role: [:default, :admin]
end
