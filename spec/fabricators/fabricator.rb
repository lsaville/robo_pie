Fabricator(:item) do
  title { Faker::Space.moon }
  description { Faker::Company.bs }
  price { Faker::Commerce.price }
  image { Faker::Avatar.image}
  category
end

Fabricator(:category) do
  title { Faker::Team.name }
end

Fabricator(:user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { Faker::Internet.password }
end
