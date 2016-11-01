require 'rails_helper'

describe "User clicks add to cart" do
  before :each do
    @category = Fabricate(:category)
    @item = Fabricate(:item, category: @category)
  end

  scenario "displays cart count increase" do

    visit items_path

    expect(page).to have_content("Cart: 0")

    click_button "Add To Cart"

    expect(page).to have_content("Cart: 1")
    expect(page).to have_content("You now have 1 #{@item.title} in your cart")
  end

  scenario "User can visit cart" do

    click_button "Add To Cart"

    visit items_path
    click_button "Add To Cart"
    click_button "Cart"

    expect(current_path).to eq("/cart")
    expect(page).to have_content("#{@item.title}")
    expect(page).to have_content("#{@item.description}")
    expect(page).to have_content("#{@item.price}")
  end

end
