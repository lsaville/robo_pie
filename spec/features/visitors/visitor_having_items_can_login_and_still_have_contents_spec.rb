require 'rails_helper'

describe 'visitor having items in cart logs in' do
  scenario 'they still have the contents of pre-login cart' do
    category = Fabricate(:category)
    item = Fabricate(:item, category: category)

    visit items_path
    click_button 'Add To Cart'
    visit cart_path

    expect(page).to_not have_content('Checkout')

    click_button 'Login or Create Account to Checkout'
    click_link 'Create Account'
    fill_in 'Name', with: 'Barack'
    fill_in 'Email', with: 'prez@white_house.com'
    fill_in 'Street', with: '123 poplar ave'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: '80205'
    fill_in 'Phone', with: '424-425-4325'
    fill_in 'Password', with: 'michelle'
    fill_in 'Password Confirmation', with: 'michelle'
    click_button 'Create Account'
    
    visit cart_path

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)

    click_link 'Logout'

    expect(page).to have_content('Login')
    expect(page).to_not have_content('Logout')
  end
end
