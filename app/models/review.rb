class Review < ApplicationRecord
  belongs_to :nihonshu
  belongs_to :user
  validates :description, length: { minimum: 20 }
  validates :rating, :inclusion => { :in => 0..5 }
end
