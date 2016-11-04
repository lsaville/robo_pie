require 'rails_helper'

describe 'user can login' do
  context 'user enters valid credentials' do
    scenario 'they go to login_path and enter their credentails' do
      user = Fabricate(:user)

      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'

      expect(page).to have_content('Successfully logged in!')
      expect(page).to have_content("Welcome #{user.name}")
      expect(page).to have_content('Logout')
      expect(page).to_not have_content('Login')
    end
  end

  context 'user enters invalid credentials' do
    scenario 'they miss a field' do
      user = Fabricate(:user)

      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: ''
      click_button 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("error")
    end
  end
end
