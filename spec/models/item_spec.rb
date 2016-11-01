require 'rails_helper'

describe Item do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        item = Item.new(title: nil, description: "Yum", price: 15, image: "www.image.com")

        expect(item).to be_invalid
      end

      it "is invalid without description" do
        item = Item.new(title: "Gear Lovers", description: nil, price: 15, image: "www.image.com")

        expect(item).to be_invalid
      end

      it "is invalid without price" do
        item = Item.new(title: "Gear Lovers", description: "something great", price: nil, image: "www.image.com")

        expect(item).to be_invalid
      end

      it "is invalid without image" do
        item = Item.new(title: "Gear Lovers", description: "something great", price: 15, image: nil)

        expect(item).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        item = Item.new(title: "Gear Lovers", description: "something great", price: 15, image: "www.image.com")

        expect(item).to be_valid
      end
    end
  end
end
