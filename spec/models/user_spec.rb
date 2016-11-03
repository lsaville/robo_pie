require 'rails_helper'

describe User do
  describe 'validations' do
    context 'valid attributes' do
      it 'is valid with all attributes' do
        user = Fabricate.build(:user)
        expect(user).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'is invalid without name' do
        user = Fabricate.build(:user, name:nil)
        expect(user).to be_invalid
      end

      it 'is invalid without email' do
        user = Fabricate.build(:user, email: nil)
        expect(user).to be_invalid
      end

      it 'is invalid without unique email' do
        user = Fabricate(:user, email: "obama")
        user2 = Fabricate.build(:user, email: "obama")
        expect(user2).to be_invalid
      end

      it 'is invalid without password' do
        user = Fabricate.build(:user, password: nil)
        expect(user).to be_invalid
      end
    end
  end
end
