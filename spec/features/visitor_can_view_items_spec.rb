require 'rails_helper'

describe "visitor views item index" do
  scenario "visitor can see all items" do
    Item.create(title: "Pizza 1", description: "so so good", price: 15, image: "www.image.com")
    Item.create(title: "Pizza 2", description: "so so good", price: 15, image: "www.image.com")
    Item.create(title: "Pizza 3", description: "so so good", price: 15, image: "www.image.com")

    visit items_path

    expect(page).to have_content("Pizza 1")
    expect(page).to have_content("Pizza 2")
    expect(page).to have_content("Pizza 3")
  end
end
