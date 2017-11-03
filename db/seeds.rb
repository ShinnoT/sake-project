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

# ---Nihonshu data.json decoding---
json_nihonshu = ActiveSupport::JSON.decode(File.read('./app/data/data.json'))

# ---Reviews review.json decoding---
json_review = ActiveSupport::JSON.decode(File.read('./app/data/review.json'))


# get each element from json file
json_nihonshu.each do |elm|
  nihonshu = Nihonshu.create!(
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

  # get each element from json file
  Review.create!(json_review.sample(rand(3..4)).map do |review|
    { user: allUsers.sample,
      nihonshu: nihonshu,
      rating: rating.sample,
      description: review['review'] }
  end)

  # p reviews
  # json_review.each do |elm|
  #     Review.create!(
  #     # title:"a",
  #     description:elm['review'],
  #     rating: rating.sample,
  #     # nihonshu: Nihonshu.where( 'id > = ?', rand(Nihonshu.first.id..Nihonshu.last.id) ).first,
  #     nihonshu: Nihonshu.where( 'id > = ?', Nihonshu.order("RANDOM()").limit(1).id),
  #     user: allUsers.sample)
  # end
end

puts 'Creating nihonshus&reviews!'


