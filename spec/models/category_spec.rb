require 'rails_helper'

describe Category do
  describe 'validations' do
    context 'validate attributes' do
      it 'is valid with title' do
        category = Fabricate.build(:category)

        expect(category).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'is invalid without title' do
        category = Fabricate.build(:category, title: nil)

        expect(category).to be_invalid
      end

      it 'is invalid if not unique' do
        category = Fabricate(:category, title: 'Gasket Lovers')
        category1 = Fabricate.build(:category, title: 'Gasket Lovers')

        expect(category1).to be_invalid
      end
    end
  end

  describe 'relationships' do
    it 'has many items' do
      category = Fabricate.build(:category)

      expect(category).to respond_to(:items)
    end
  end
end
