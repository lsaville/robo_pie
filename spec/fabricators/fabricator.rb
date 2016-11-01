Fabricator(:item) do
  title { Faker::Commerce.color }
  description { Faker::Company.bs }
  price { Faker::Commerce.price }
  image { Faker::Avatar.image}
  category
end

Fabricator(:category) do
  title { Faker::Team.name }
end
