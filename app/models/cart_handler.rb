class CartHandler

  def self.make_order(user, cart)
    current_order = user.orders.new
    cart.each do |item, quantity|
      current_order.items << Item.find(item)
      current_order.orders_items[-1].quantity = quantity
    end
    current_order.save
  end

end
