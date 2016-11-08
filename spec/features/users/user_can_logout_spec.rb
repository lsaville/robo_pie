require 'rails_helper'

describe 'User logs out' do
  scenario 'A user clicks logout' do
    user = Fabricate(:user)
    category = Fabricate(:category)
    item = Fabricate(:item, category: category)

    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'

    visit items_path
    click_button 'Add To Cart'

    click_on 'Logout'

    expect(page).to_not have_content(1)
    expect(page).to_not have_content(user.name)
  end
end
