class Saving < ApplicationRecord
  belongs_to :nihonshu
  belongs_to :user
  validates_uniqueness_of :nihonshu_id, scope: :user_id
end
