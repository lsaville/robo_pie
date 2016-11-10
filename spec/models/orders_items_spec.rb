require 'rails_helper'

describe OrdersItem do
  describe 'relationships' do
    it 'belongs to order' do
      order = Fabricate.build(:order)

      expect(order).to respond_to(:orders_items)
    end

    it 'belongs to item' do
      item = Fabricate.build(:item)

      expect(item).to respond_to(:orders_items)
    end
  end
end
