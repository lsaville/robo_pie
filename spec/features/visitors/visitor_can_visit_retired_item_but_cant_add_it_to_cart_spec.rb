require 'rails_helper'

describe 'vistor can see retired item' do
  scenario 'they can visit the page but cant add it to cart' do
    retired_item = Fabricate(:item, status: 'retired')

    visit item_path(retired_item)

    expect(page).to_not have_button('Add To Cart')
    expect(page).to have_content('Item Retired')
  end
end
