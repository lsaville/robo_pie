require 'rails_helper'

describe "Visitor can browse by category" do
  context "Categories exist" do
    scenario "they visit /:category_name" do
      category1 = Category.create(title: "Gasket lovers")
      category2 = Category.create(title: "Plastitarian")

      item1 = Item.create(title: "gaskets", description: "lots of gaskets", price: 15, image: "some image", category: category1)
      item2 = Item.create(title: "flummox", description: "great stuff", price: 15, image: "image", category: category1)

      item3 = Item.create(title: "rabbits", description: "oil soaked", price: 15, image: "sea of oil", category: category2)
      item4 = Item.create(title: "lego castle", description: "legos", price: 15, image: "junk yard", category: category2)

      visit "/gasket_lovers"

      expect(page).to have_content(item1.title)
      expect(page).to have_content(item2.title)
      expect(page).to_not have_content(item3.title)
      expect(page).to_not have_content(item4.title)
    end
  end
end
