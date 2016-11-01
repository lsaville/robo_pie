# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
plastic = Category.create(title: "plastitarian")
Item.create(title: "some", description: "its great", price: 15, image: "www.frog.com", category: plastic)
Item.create(title: "great", description: "its super great", price: 13, image: "www.ribbit.com", category: plastic)
Item.create(title: "pie", description: "its lame", price: 15, image: "www.bear.com", category: plastic)
Item.create(title: "flavor", description: "hrrrrumph", price: 14, image: "www.tilde.com", category: plastic)
