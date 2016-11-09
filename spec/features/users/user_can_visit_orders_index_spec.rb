require 'rails_helper'

describe 'User can see past orders' do
  scenario 'they visit /orders and can see just their past orders' do
    category = Fabricate(:category)
    items1 = Fabricate.times(5, :item, category: category)
    items2 = Fabricate.times(2, :item, category: category)
    user = Fabricate(:user)

    order1 = Order.create(user: user)
    order2 = Order.create(user: user)
    order1.items << items1
    order2.items << items2

    order1.items.each do |item|
      item.orders_items[0].quantity = 1
      item.orders_items[0].save
    end

    order2.items.each do |item|
      item.orders_items[0].quantity = 1
      item.orders_items[0].save
    end

    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    click_link 'Orders'

    expect(current_path).to eq(orders_path)
    expect(page).to have_content(order1.created_at.strftime('%B %d, %Y %r'))
    expect(page).to have_button("View Order")
    expect(page).to have_content(order2.created_at.strftime('%B %d, %Y %r'))
  end
end
