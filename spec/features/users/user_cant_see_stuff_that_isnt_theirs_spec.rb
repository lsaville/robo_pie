require 'rails_helper'

describe 'user restrictions' do
  before :each do
    @user1 = Fabricate(:user)
    @user2 = Fabricate(:user)

    category = Fabricate(:category)
    items1 = Fabricate.times(5, :item, category: category)
    items2 = Fabricate.times(2, :item, category: category)

    @order1 = Order.create(user: @user1)
    @order2 = Order.create(user: @user2)
    @order1.items << items1
    @order2.items << items2

    @order1.items.each do |item|
      item.orders_items[0].quantity = 1
      item.orders_items[0].save
    end

    @order2.items.each do |item|
      item.orders_items[0].quantity = 1
      item.orders_items[0].save
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

  scenario 'user attempts to visit orders/id-that-isnt-theirs' do
    visit '/orders/2'
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
