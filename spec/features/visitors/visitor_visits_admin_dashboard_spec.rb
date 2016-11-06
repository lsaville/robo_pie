require 'rails_helper'

describe 'Visitor visits admin dashboard' do
  scenario 'Visitor sees a 404 error page' do
    visit admin_dashboard_url

    expect(page).to have_content("404")
  end
end
