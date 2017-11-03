class Nihonshu < ApplicationRecord

  validates :name, :taste, :region, :price, :temp, :classification, presence: true
  validates :taste, numericality: { only_integer: true }
  validates :price, numericality: { only_float: true }
  validates :temp, inclusion: { in: ["hot", "warm", "cold"] }

  has_many :reviews, dependent: :destroy
  has_many :savings

  def self.search_attr(query_taste, query_price1, query_price2, query_rating)
    # join 2 tables(Nihonshu,Review)
    nihonshus = Nihonshu.all
    if query_rating
      join_table = nihonshus.left_joins(:reviews)

      # define a scope by rating
      nihonshus = join_table.select("nihonshus.*, AVG(reviews.rating)").group('nihonshus.id').having('AVG(reviews.rating) >= ?', query_rating)
    end
    # search by rating, by taste, by price
    nihonshus = nihonshus.where("taste >= ?", query_taste) if query_taste
    nihonshus = nihonshus.where("price BETWEEN ? AND ?", query_price1, query_price2) if query_price1 && query_price2
    nihonshus
  end

  def self.search(query)
    # search by navbar
    where("name ILIKE ?", "%#{query}%")
  end
  
  def saved_by?(user)
    # savings.where(user: user).present?
    savings.find_by(user: user).present?
  end
end
