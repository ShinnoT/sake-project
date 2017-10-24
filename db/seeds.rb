# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Nihonshu.destroy_all

region = ["meguro","tokyo","shinjuku","komagome","ebisu","ueno","hokkaido","osaka","roppongi"]
temp = ["hot", "warm","cold"]
photos = ["http://blog.oxforddictionaries.com/wp-content/uploads/potato.jpg", "http://www.motherjones.com/wp-content/uploads/2017/08/pumpkin-4.jpg?w=630"]
price = [12.00, 5.32, 34.55, 6.45]
scale = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
aroma = ["flowery", "pungent", "sharp"]


20.times do
  sake = Nihonshu.create(
    name: Faker::Coffee.blend_name,
    acidity: scale.sample,
    taste: scale.sample,
    body: scale.sample,
    region: region.sample,
    price: price.sample,
    temp: temp.sample,
    sku: "0551211515",
    classification: "rice",
    aroma: aroma.sample)
end

puts 'Creating nihonshus!'



# 12.times do
#   User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name:Faker::Name.last_name , password: 'password', address: cities.sample)
# end


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
