class Order < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :stores, through: :items
end
