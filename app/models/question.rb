class Question < ApplicationRecord
  belongs_to :user, :item
  has_many :answers
end
