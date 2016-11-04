require 'rails_helper'

describe 'User can see past orders' do
  scenario 'they visit /orders and can see just their past orders' do
    category = Fabricate(:category)
    items = Fabricate.times(5, :item, category: category)
    user = User.create(name: 'r', email: 'r@r.com', password: '123')
    order1 = Order.create(user: user)
    order1.items << items

    visit login_path
    fill_in 'Email', with: 'r@r.com'
    fill_in 'Password', with: '123'


  end
end
