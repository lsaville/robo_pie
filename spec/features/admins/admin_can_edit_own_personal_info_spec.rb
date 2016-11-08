require 'rails_helper'

describe 'Admin visits dashboard' do
  scenario 'Admin can edit their own information' do
    admin = Fabricate(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_path(admin)
    expect(page).to have_content(admin.name)
    click_button 'Edit Info'

    fill_in 'Name', with: 'Jumbo'
    fill_in 'Email', with: 'Shrimp@crustateon.com'
    fill_in 'Street', with: '123 poplar ave'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: '80205'
    fill_in 'Phone', with: '424-425-4325'
    fill_in 'Password', with: '1234'
    fill_in 'Password Confirmation', with: '1234'

    click_button 'Update Info'

    expect(current_path).to eq(admin_path(admin))
    expect(page).to have_content('Jumbo')
    expect(page).to have_content('Shrimp@crustateon.com')
    expect(page).to have_content('Successfully updated!')
  end

  scenario 'Admin cant update a users info' do
    admin = Fabricate(:user, role: 1)
    user = Fabricate(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    # visit "/admin/user/#{user.id}/edit"
    visit edit_admin_user_path(user)
    
    expect(page).to have_content('404')
  end
end
