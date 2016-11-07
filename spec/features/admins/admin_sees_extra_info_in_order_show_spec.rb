require 'rails_helper'

describe 'admin visits and order show page' do
  scenario 'they see purchasers full info' do
    category = Fabricate(:category)
    items = Fabricate.times(5, :item, category: category)
    user = Fabricate(:user)

    order = Order.create(user: user)
    order.items << items

    order.items.each do |item|
      item.orders_items[0].quantity = 1
      item.orders_items[0].save
    end

    admin = Fabricate(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit order_path(order)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.street)
    expect(page).to have_content(user.city)
    expect(page).to have_content(user.state)
    expect(page).to have_content(user.zip)
    expect(page).to have_content(user.phone)
  end
end
