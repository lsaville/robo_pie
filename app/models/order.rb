class Order < ActiveRecord::Base
  validates :status, presence: true
  belongs_to :user

  has_many :orders_items
  has_many :items, through: :orders_items

  def totalize(order)
    items.reduce(0) do |result, item|
      result += item.subtotal(order)
      result
    end
  end

  def self.ordered
    where(status: 'ordered')
  end

  def self.paid
    where(status: 'paid')
  end

  def self.cancelled
    where(status: 'cancelled')
  end

  def self.completed
    where(status: 'completed')
  end
end
