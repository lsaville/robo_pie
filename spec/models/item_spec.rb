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

  end
end
