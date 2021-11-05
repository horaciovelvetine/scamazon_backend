class Question < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :answers, dependent: :destroy
end
