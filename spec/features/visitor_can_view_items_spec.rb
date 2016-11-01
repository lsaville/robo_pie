require 'rails_helper'

describe "visitor views item index" do
  scenario "visitor can see all items" do
    visit items_path

    expect(page).to have_content("Pizza 1")
    expect(page).to have_content("Pizza 2")
    expect(page).to have_content("Pizza 3")
  end
end
