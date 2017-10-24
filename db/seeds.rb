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
photos = []
price = [12.00, 5.32, 34.55, 6.45]
scale = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
aroma = ["flowery", "pungent", "sharp"]

barcode = []

20.times do

  13.times do
    barcode << rand(0..9).to_s
  end

  code = barcode.join("")

  sake = Nihonshu.create(
    name: Faker::Coffee.blend_name,
    acidity: scale.sample,
    taste: scale.sample,
    body: scale.sample,
    region: region.sample,
    price: price.sample,
    temp: temp.sample,
    sku: code,
    classification: "rice",
    aroma: aroma.sample)

  barcode = []
end

puts 'Creating nihonshus!'



# 12.times do
#   User.create(
      # email: Faker::Internet.email,
      # first_name: Faker::Name.first_name,
      # last_name:Faker::Name.last_name ,
      # password: 'password',
      # address: cities.sample)
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
