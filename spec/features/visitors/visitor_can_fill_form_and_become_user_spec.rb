require 'rails_helper'

describe 'Visitor visits login page and enters information' do
  context 'valid parameters' do

    scenario 'Visitor is now a user' do

      visit login_path
      click_link 'Create Account'

      fill_in 'Name', with: 'Frank'
      fill_in 'Email', with: 'F@gmail.com'
      fill_in 'Street', with: '123 poplar ave'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'CO'
      fill_in 'Zip', with: '80205'
      fill_in 'Phone', with: '424-425-4325'
      fill_in 'Password', with: '123'
      fill_in 'Password Confirmation', with: '123'
      click_button 'Create Account'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Logged in as Frank')
      expect(page).to have_content('Frank')
      expect(page).to have_content('F@gmail.com')
      expect(page).to_not have_content('Login')
      expect(page).to have_content('Logout')

    end
  end

  context "invalid parameters" do
    scenario "visitor fails to enter name" do

      visit login_path
      click_link "Create Account"

      fill_in "Name", with: nil
      fill_in "Email", with: "F@gmail.com"
      fill_in "Password", with: "123"
      fill_in "Password Confirmation", with: "123"
      click_button "Create Account"

      expect(page).to have_content("prohibited this record from being saved")
    end

  end
end
