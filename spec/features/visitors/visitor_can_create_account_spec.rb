require 'rails_helper'

describe 'Vistor can visit root and click on create account' do
    scenario 'visitor sees login form' do
      visit root_path
      click_button "Login"

      expect(current_path).to eq(login_path)
      
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_selector(:link_or_button, "Create Account")
    end
end
