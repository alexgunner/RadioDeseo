# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create! name: "First category", description: "First category"
Category.create! name: "Second category", description: "Second category"
Category.create! name: "Third category", description: "Third category"
Category.create! name: "Fourth category", description: "Fourth category"

Label.create! name: "First label", description: "First label"
Label.create! name: "Second label", description: "Second label"
Label.create! name: "Third label", description: "Third label"
Label.create! name: "Fourth label", description: "Fourth label"