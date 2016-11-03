require 'rails_helper'

describe 'User increases item quantity in cart'  do
  scenario 'they increase the item quantity for an item in cart' do
    category = Fabricate(:category)
    @item = Fabricate(:item, category: category)
    visit items_path
    click_button 'Add To Cart'

    visit cart_path

    within('#quantity') do
      expect(page).to have_content("1")
    end

    select '4', :from => "quantity"
    click_button 'Update'


    expect(current_path).to eq(cart_path)
    within('#quantity') do
      expect(page).to have_content("4")
    end
    expect(page).to have_content("#{@item.price * 4}")
  end
end
