require 'rails_helper'

describe 'User can see past orders' do
  scenario 'they visit /orders and can see just their past orders' do
    category = Fabricate(:category)
    items1 = Fabricate.times(5, :item, category: category)
    items2 = Fabricate.times(2, :item, category: category)
    user = User.create(name: 'r', email: 'r@r.com', password: '123')
    order1 = Order.create(user: user)
    order2 = Order.create(user: user)
    order1.items << items1
    order2.items << items2


    visit login_path
    fill_in 'Email', with: 'r@r.com'
    fill_in 'Password', with: '123'
    click_button 'Orders'

    expect(current_path).to eq(orders_path)
  end
end
