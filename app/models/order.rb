class Order < ActiveRecord::Base
  belongs_to :user

  has_many :orders_items
  has_many :items, through: :orders_items

  def totalize
    items.reduce(0) do |result, item|
      result += item.subtotal
      result
    end
  end

end
