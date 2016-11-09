class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  belongs_to :category

  has_many :orders_items
  has_many :orders, through: :orders_items

  def item_quantity(order)
    orders_items.find_by(order: order).quantity
  end

  def subtotal(order)
    item_quantity(order) * price
  end

  def active?
    status == 'active'
  end
end
