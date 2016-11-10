require 'rails_helper'

RSpec.describe CartHandler do
  it 'can make and order' do
    item = Fabricate(:item)
    user = Fabricate(:user)
    cart = {item.id => 3}

    CartHandler.make_order(user, cart)

    order = Order.all[0]

    expect(order.items[0]).to eq(item)
  end
end
