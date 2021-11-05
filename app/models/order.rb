class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status
  has_many :items
  has_many :stores, through: :items
end
