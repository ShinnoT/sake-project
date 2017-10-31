# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Nihonshu.destroy_all
Review.destroy_all
User.destroy_all
puts 'Cleaning DB!'

temp = ["hot", "warm","cold"]
price = [500, 1000, 1500, 2000, 2500, 3000, 3500, 4000]
scale = [1, 2, 3]

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

# new_user = User.create(first_name: "sai", last_name: "tuv", email: "test@gmail.com", password: "123456")
# other_user = User.create(first_name: "whatever", last_name: "whatever", email: "blahblah@email.com", password: "123456")
# user1 = User.create(first_name: "whatever", last_name: "whatever", email: "blahblahsfdf@email.com", password: "123456")
# user2 = User.create(first_name: "whatever", last_name: "whatever", email: "blahblahfrg@email.com", password: "123456")
# user3 = User.create(first_name: "whatever", last_name: "whatever", email: "blahblahsrgrrg@email.com", password: "123456")
# user4 = User.create(first_name: "whatever", last_name: "whatever", email: "blahblahrgswefg@email.com", password: "123456")


puts 'Creating users!'
