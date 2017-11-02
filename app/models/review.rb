class Review < ApplicationRecord
  belongs_to :nihonshu
  belongs_to :user
  # validates :description, length: { minimum: 20 }
  # validates :title, :description, :rating, presence: true
  validates :description, :rating, presence: true
  validates :rating, numericality: { only_float: true }, :inclusion => { :in => 0..5 }
end
