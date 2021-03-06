require 'rails_helper'

describe 'Admin can edit exiting item' do
  before :each do
    @category = Fabricate(:category)
    @item = Fabricate(:item, category: @category)
    @admin = Fabricate(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  context 'valid params' do
    scenario 'they visit the admin/items show page and click edit' do
      visit admin_items_path
      click_button 'Edit'
      expect(current_path).to eq(edit_admin_item_path(@item))

      fill_in 'Title', with: 'new title'
      fill_in 'Description', with: 'great new description'
      fill_in 'Image', with: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNddY16cz9LvFgHr_HQ4iavRXRcpKYCmOvoOXhoYdNMk6E3IK1aA'
      select 'active', from: 'item[status]'
      click_button 'Update Item'

      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("Successfully updated item!")
    end
  end

  context 'invalid params' do
    scenario 'admin visits item/edit but fails to fill form' do
      visit edit_admin_item_path(@item)

      fill_in 'Title', with: ''
      click_button 'Update Item'

      expect(page).to have_content('prohibited this record from being saved')
    end
  end
end
