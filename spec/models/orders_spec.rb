require 'rails_helper'

describe Order do
  describe 'validations' do
    context 'invalid attributes' do
      it "is invalid without status" do
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
end
