# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = [ Category.create(title: 'Plastitarian'),
               Category.create(title: 'Gasket lovers'),
               Category.create(title: 'Metaltarian'),
               Category.create(title: 'Silicon'),
               Category.create(title: 'Rubber')
             ]

items = []
20.times do
  items << Item.create(
    title: Faker::Lorem.word,
    description: Faker::Hipster.words(6).join(" "),
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
  items_set = []
  rand(1..10).times do
    items_set << items.sample
  end
  order = user.orders.new
  order.items << items
  order.orders_items.each do |order_item|
    order_item.quantity = rand(1..7)
  end
  order.save
end

#admin obama
User.create(
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

#jon
User.create(
name: 'Jon',
email: 'j@jon.com',
password: '123',
street: Faker::Address.street_address,
city: Faker::Address.city,
state: Faker::Address.state,
zip: Faker::Address.zip_code,
phone: Faker::PhoneNumber.phone_number,
role: 0
)

#lee
User.create(
name: 'Lee',
email: 'l@lee.com',
password: '123',
street: Faker::Address.street_address,
city: Faker::Address.city,
state: Faker::Address.state,
zip: Faker::Address.zip_code,
phone: Faker::PhoneNumber.phone_number,
role: 0
)
