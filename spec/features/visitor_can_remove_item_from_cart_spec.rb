require 'rails_helper'

describe 'user has a cart with items and can remove one' do
  before :each do
    category = Fabricate(:category)
    @item = Fabricate(:item, category: category)
    visit items_path
    click_button "Add To Cart"
    visit cart_path
    click_button "Remove"
  end

  scenario 'user clicks remove next to item and sees message confirmation' do
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Successfully removed #{@item.title} from your cart")
    expect(page).to_not have_content(@item.price)
  end

  scenario 'user can click on the item title in the flash massage to go to that items page' do
    click_link "#{@item.title}"

    expect(current_path).to eq(item_path(@item))
    expect(page).to have_content("#{@item.price}")
  end
end
