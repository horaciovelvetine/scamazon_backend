class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :rating, :inclusion => 0.0..5.0
  validates :user, presence: true
end
