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
scale = [1, 2, 3, 4]
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
user1 = User.create(email: "charles@gmail.com", password: "123456")
user2 = User.create(email: "neema@gmail.com", password: "123456")
user3 = User.create(email: "shinno@gmail.com", password: "123456")
user4 = User.create(email: "saikhan@gmail.com", password: "123456")
user5 = User.create(email: "carla@gmail.com", password: "123456")
user6 = User.create(email: "debbie@gmail.com", password: "123456")
user7 = User.create(email: "enzo@gmail.com", password: "123456")
user8 = User.create(email: "ian@gmail.com", password: "123456")
user9 = User.create(email: "james@gmail.com", password: "123456")
user10 = User.create(email: "lee@gmail.com", password: "123456")
allUsers = [user1, user2, user3, user4, user5,
            user6, user7, user8, user9, user10]

puts 'Creating users!'


# ---Reviews review.json decoding---
json = ActiveSupport::JSON.decode(File.read('./app/data/review.json'))

# get each element from json file
json.each do |elm|
  Review.create!(
              title:"a",
              description:elm['review'],
              rating: rating.sample,
              nihonshu: Nihonshu.where( 'id >= ?', rand(Nihonshu.first.id..Nihonshu.last.id) ).first,
              user: allUsers.sample)
end

puts 'Creating reviews!'

# ---Old Review---
# review = Review.create(title:"good sake",
#                         description: "Dry and rice forward Junmai cup sake from Osaka. Cup design is basically irresistible.",
#                         rating: rating.sample,
#                         nihonshu: Nihonshu.find_by_name('16th Kurouemon Junmai Ginjo Yamadanishiki'),
#                         user: new_user
#                         )


