require "rails_helper"

describe Category do
  describe "validations" do
    context "validate attributes" do
      it "is valid with title" do
        category = Fabricate.build(:category)

        expect(category).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without title" do
        category = Fabricate.build(:category, title: nil)

        expect(category).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many items" do
      category = Fabricate.build(:category)

      expect(category).to respond_to(:items)
    end
  end
end
