require 'rails_helper'

describe 'Admin login' do
  scenario 'A admin can login and sees dashboard page' do
    admin = Fabricate(:user, role: 1)
    visit login_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'

    expect(current_path).to eq('/admin/dashboard')
  end
end
