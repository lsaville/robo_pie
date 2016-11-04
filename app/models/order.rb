class Order < ActiveRecord::Base
  belongs_to :user

  has_many :orders_items
  has_many :items, through: :orders_items
end
