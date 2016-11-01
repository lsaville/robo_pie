require 'rails_helper'

describe "visitor views item index" do
  scenario "visitor can see all items" do
    items = Fabricate.times(3, :item)

    visit items_path

    expect(page).to have_content(items[0].title)
    expect(page).to have_content(items[1].title)
    expect(page).to have_content(items[2].title)
  end
end
