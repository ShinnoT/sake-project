class Nihonshu < ApplicationRecord

  validates :name, :acidity, :taste, :body, :region, :price, :temp, :sku, :classification, :aroma, presence: true
  validates :acidity, :taste, :body, numericality: { only_integer: true }
  validates :price, numericality: { only_float: true }
  validates :temp, inclusion: { in: ["hot", "warm", "cold"] }

  has_many :reviews, dependent: :destroy

  def self.search(query_taste, query_price1, query_price2)
    # where("name LIKE ?", "%#{query_name}%")
    where("taste = ?", "#{query_taste}")
    .where("price BETWEEN ? AND ?", "#{query_price1}", "#{query_price2}")
  end
end
