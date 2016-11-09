require 'rails_helper'

describe Order do
  describe 'validations' do
    context 'valid attributes' do
      it 'is valid with status' do
        order = Fabricate.build(:order)

        expect(order).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'is invalid without status' do
        order = Fabricate.build(:order, status: nil)

        expect(order).to be_invalid
      end
    end
  end

  describe 'relationships' do
    it 'has many items' do
      order = Fabricate.build(:order)

      expect(order).to respond_to(:items)
    end
  end

  describe 'model methods' do
    it 'can find total of an order' do
      order = Fabricate(:order)
      item1 = Fabricate(:item, price: '10')
      item2 = Fabricate(:item, price: '5')
      order.items << item1
      order.items << item2
      order.items.each do |item|
        item.orders_items[0].quantity = 1
        item.orders_items[0].save
      end

      expect(order.totalize(order)).to eq(15)
    end

    it 'can find order status ordered' do
      order = Fabricate(:order, status: 'ordered')
      Fabricate(:order, status: 'cancelled')

      expect(Order.ordered.first).to eq(order)
    end

    it 'can find order status paid' do
      order = Fabricate(:order, status: 'paid')
      Fabricate(:order, status: 'cancelled')

      expect(Order.paid.first).to eq(order)
    end

    it 'can find order status cancelled' do
      order = Fabricate(:order, status: 'cancelled')
      Fabricate(:order, status: 'ordered')

      expect(Order.cancelled.first).to eq(order)
    end

    it 'can find order status completed' do
      order = Fabricate(:order, status: 'completed')
      Fabricate(:order, status: 'ordered')

      expect(Order.completed.first).to eq(order)
    end

    it 'can find item count from order' do
      order = Fabricate(:order)
      item1 = Fabricate(:item, price: '10')
      item2 = Fabricate(:item, price: '5')
      order.items << item1
      order.items << item2
      order.items.each do |item|
        item.orders_items[0].quantity = 4
        item.orders_items[0].save
      end

      expect(order.item_count).to eq(8)
    end
  end
end
