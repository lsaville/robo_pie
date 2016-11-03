require 'rails_helper'

describe 'Vistor can visit root and click on create account' do
    scenario 'visitor sees login form' do
      visit root_path

      click_button "Login"
      save_and_open_page

      expect(current_path).to eq(login_path)

      expect(page).to have_content("Email")
      expect(page).to have_content("Name")
      expect(page).to have_content("Password")
      expect(page).to have_content("Password Confirmation")
      expect(page).to have_content("Create Account")
    end
end
