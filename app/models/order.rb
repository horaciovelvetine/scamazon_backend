class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :stores, through: :items
  has_many :items
end
