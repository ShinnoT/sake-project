class Nihonshu < ApplicationRecord

  validates :name, :taste, :region, :price, :temp, :classification, presence: true
  validates :taste, numericality: { only_integer: true }
  validates :price, numericality: { only_float: true }
  validates :temp, inclusion: { in: ["hot", "warm", "cold"] }

  has_many :reviews, dependent: :destroy
  has_many :savings

  def self.search_attr(query_taste, query_price1, query_price2, query_rating)
    # join 2 tables(Nihonshu,Review)
    join_table = Nihonshu.joins("LEFT OUTER JOIN reviews on reviews.nihonshu_id = nihonshus.id")

    # define a scope by rating
    select_rating = join_table.select("nihonshus.*, AVG(reviews.rating) as rating_average").group('nihonshus.id').having('AVG(reviews.rating) >= ?', query_rating)

    # search by rating, by taste, by price
    select_rating.where("taste >= ?", query_taste)
    select_rating.where("price BETWEEN ? AND ?", query_price1, query_price2)
  end

  def self.search(query)
    # search by navbar
    where("name ILIKE ?", "%#{query}%")
  end
end
