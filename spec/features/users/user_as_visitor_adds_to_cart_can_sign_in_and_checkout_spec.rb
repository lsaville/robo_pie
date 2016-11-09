require 'rails_helper'

describe 'user as visitor adds to cart, signs in, checks out' do
  context 'existing user' do
    scenario 'they can place an order' do
      user = Fabricate(:user)
      category = Fabricate(:category)
      items = Fabricate.times(3, :item, category: category)

      visit items_path

      within(".#{items[0].title}") do
        click_button 'Add To Cart'
      end
      within(".#{items[1].title}") do
        click_button 'Add To Cart'
      end
      within(".#{items[2].title}") do
        click_button 'Add To Cart'
      end

      click_link 'Cart'
      click_button 'Login or Create Account to Checkout'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      click_link 'Cart'
      click_button 'Checkout'

      expect(current_path).to eq(orders_path)
      expect(page).to have_content('Order was successfully placed!')
      expect(page).to have_content(Order.last.created_at.strftime('%B %d, %Y %r'))
    end
  end
end
