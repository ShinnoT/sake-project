# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Nihonshu.destroy_all
User.destroy_all

sake = Nihonshu.new(name: "dai", acidity: 1, taste: 2, body: 4, region: "tokyo")
sake.save

puts 'Creating nihonshus!'


    # t.string   "name"
    # t.integer  "acidity"
    # t.integer  "taste"
    # t.integer  "body"
    # t.string   "region"
    # t.float    "price"
    # t.string   "temp"
    # t.string   "sku"
    # t.string   "classification"
    # t.string   "aroma"
