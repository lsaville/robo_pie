require 'rails_helper'

describe Item do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without title' do
        item = Fabricate.build(:item, title: nil)

        expect(item).to be_invalid
      end

      it 'is invalid without description' do
        item = Fabricate.build(:item, description: nil)

        expect(item).to be_invalid
      end

      it 'is invalid without price' do
        item = Fabricate.build(:item, price: nil)

        expect(item).to be_invalid
      end

      it 'is invalid without image' do
        item = Fabricate.build(:item, image: nil)

        expect(item).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with all attributes' do
        item = Fabricate.build(:item)

        expect(item).to be_valid
      end
    end

    describe 'relationships' do
      it 'belongs to orders' do
        item = Fabricate.build(:item)

        expect(item).to respond_to(:orders)
      end
      it 'belongs to category' do
        item = Fabricate.build(:item)

        expect(item).to respond_to(:category)
      end
    end

    describe 'default status' do
      it 'has active as default' do
        item = Item.new

        expect(item.status).to eq('active')
      end
    end

    describe 'item methods' do
      scenario 'item_quantity gives item quantity' do
        order = Fabricate(:order)
        item1 = Fabricate(:item)
        item2 = Fabricate(:item)
        order.items << item1
        order.items << item2
        order.items.each do |item|
          item.orders_items[0].quantity = 4
          item.orders_items[0].save
        end

        result = order.items[0].item_quantity(order)

        expect(result).to eq(4)
      end

      scenario 'subtotal gives the subtotal' do
        order = Fabricate(:order)
        item1 = Fabricate(:item)
        item2 = Fabricate(:item)
        order.items << item1
        order.items << item2
        order.items.each do |item|
          item.orders_items[0].quantity = 4
          item.orders_items[0].save
        end

        subtotal = order.items[0].subtotal(order)

        expect(subtotal).to eq(item1.price * 4)
      end

      scenario 'active gives true if item is active else false' do
        item1 = Fabricate(:item)
        item2 = Fabricate(:item, status: 'retired')

        expect(item1.active?).to eq(true)
        expect(item2.active?).to eq(false)
      end
    end
  end
end
