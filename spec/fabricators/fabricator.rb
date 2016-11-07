Fabricator(:item) do
  title { Faker::Space.moon }
  description { Faker::Company.bs }
  price { Faker::Commerce.price }
  image { Faker::Avatar.image}
  category
  status 'active'
end

Fabricator(:category) do
  title { Faker::Team.name }
end

Fabricator(:user) do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { Faker::Internet.password }
  street { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  zip { Faker::Address.zip_code }
  phone { Faker::PhoneNumber.phone_number }
end

Fabricator(:order) do
  user
end
