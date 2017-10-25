class Nihonshu < ApplicationRecord

  validates :name, :acidity, :taste, :body, :region, :price, :temp, :sku, :classification, :aroma, presence: true
  validates :acidity, :taste, :body, numericality: { only_integer: true }
  validates :price, numericality: { only_float: true }
  validates :temp, inclusion: { in: ["hot", "warm", "cold"] }

  has_many :reviews, dependent: :destroy

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end


end
