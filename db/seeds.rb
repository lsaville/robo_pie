# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = [ Category.create(title: 'plastitarian'),
               Category.create(title: 'gasket lovers'),
               Category.create(title: 'metaltarian'),
               Category.create(title: 'silicon'),
               Category.create(title: 'rubber')
             ]

items = []
20.times do
  items << Item.create(
    title: Faker::Lorem.word,
    description: Faker::Hipster.paragraph,
    price: Faker::Commerce.price,
    image: Faker::Avatar.image,
    category: categories.sample,
    status: 'active'
  )
end

users = []
10.times do
  users << User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code,
    phone: Faker::PhoneNumber.phone_number
  )
end

30.times do
  user = users.sample
  item = items.sample
  order = user.orders.create
  order.items << item
end
# 30.times do
#   user = users.sample
#   items_set = []
#   rand(1..10).times do
#     items_set << items.sample
#   end
#   order = user.orders.create
#   order.items << items
#   order.orders_items[rand(1..4)].quantity = rand(1.. 7)
# end

admin = User.create(
  name: 'obama',
  email: 'o@bama.com',
  password: 'michelle',
  street: Faker::Address.street_address,
  city: Faker::Address.city,
  state: Faker::Address.state,
  zip: Faker::Address.zip_code,
  phone: Faker::PhoneNumber.phone_number,
  role: 1
)
