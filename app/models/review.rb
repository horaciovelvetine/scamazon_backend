class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :rating, :inclusion => 1..5
  validates :user, presence: true
end
