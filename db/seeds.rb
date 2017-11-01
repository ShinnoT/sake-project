# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Saving.destroy_all
Nihonshu.destroy_all
Review.destroy_all
User.destroy_all
puts 'Cleaning DB!'

temp = ["hot", "warm","cold"]
price = [500, 1000, 1500, 2000, 2500, 3000, 3500, 4000]
scale = [1, 2, 3]
rating = [1, 2, 3, 4, 5]

# ---Nihonshu data.json decoding---
json = ActiveSupport::JSON.decode(File.read('./app/data/data.json'))

# get each element from json file
json.each do |elm|
  Nihonshu.create!(
              name:elm['brewery'],
              acidity:elm['acidity'],
              taste: scale.sample,
              body: elm['alcohol'],
              region:elm['prefecture'],
              price: price.sample,
              temp: temp.sample,
              sku:elm['sku'],
              classification:elm['classification'],
              aroma:elm['rice_type'],
              image_url:elm['img'])
end

puts 'Creating nihonshus!'

# ---User---
new_user = User.create(email: "test@gmail.com", password: "123456")
other_user = User.create(email: "tes@gmail.com", password: "123456")
user1 = User.create(email: "test1@gmail.com", password: "123456")
user2 = User.create(email: "test2@gmail.com", password: "123456")
user3 = User.create(email: "test3@gmail.com", password: "123456")
user4 = User.create(email: "test4@gmail.com", password: "123456")

puts 'Creating users!'

# ---Review(new_user)---
review1 = Review.create(title:"good sake",
                        description: "Dry and rice forward Junmai cup sake from Osaka. Cup design is basically irresistible.",
                        rating: rating.sample,
                        nihonshu: Nihonshu.find_by_name('16th Kurouemon Junmai Ginjo Yamadanishiki'),
                        user: new_user
                        )
review2 = Review.create(title:"i like this sake",
                        description: "Earthy and full of bold rice flavors, this sake shines when warmed.",
                        rating: rating.sample,
                        nihonshu: Nihonshu.find_by_name('Akabu Junmai Ginjo'),
                        user: new_user
                        )
review3 = Review.create(title:"best",
                        description: "Dry and light.",
                        rating: rating.sample,
                        nihonshu: Nihonshu.find_by_name('Gangi Mizunowa Junmai Ginjo'),
                        user: new_user
                        )

# ---Review(user1)---
review1 = Review.create(title:"not bad",
                        description: "Cup design is basically irresistible.",
                        rating: rating.sample,
                        nihonshu: Nihonshu.find_by_name('16th Kurouemon Junmai Ginjo Yamadanishiki'),
                        user: user1
                        )
review2 = Review.create(title:"good sake",
                        description: "this sake shines when warmed.",
                        rating: rating.sample,
                        nihonshu: Nihonshu.find_by_name('Akabu Junmai Ginjo'),
                        user: user1
                        )
review3 = Review.create(title:"i like it",
                        description: "Super Dry!",
                        rating: rating.sample,
                        nihonshu: Nihonshu.find_by_name('Gangi Mizunowa Junmai Ginjo'),
                        user: user1
                        )

puts 'Creating Revies!'
