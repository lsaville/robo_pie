require 'rails_helper'

describe 'User visits admin dashboard' do
  scenario 'User sees a 404 error page' do
    user = Fabricate(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_url
    
    expect(page).to have_content("404")
  end
end
