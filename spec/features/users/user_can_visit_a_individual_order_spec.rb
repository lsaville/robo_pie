require 'rails_helper'

describe 'User visits orders page' do
  context 'a user can click on an individual order' do
    scenario 'user sees information for that order' do
      category = Fabricate(:category)
      items = Fabricate.times(5, :item, category: category)
      user = Fabricate(:user)

      order = Order.create(user: user)
      order.items << items

      order.items.each do |item|
        item.orders_items[0].quantity = 1
        item.orders_items[0].save
      end

      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      click_link 'Orders'

      click_button 'View Order'

      expect(current_path).to eq(order_path(order))
      expect(page).to have_content(order.created_at.strftime('%B %d, %Y'))
      expect(page).to have_content(items.first.title)
      expect(page).to have_content(1)
      expect(page).to have_content(items.first.price)
    end
  end
end
