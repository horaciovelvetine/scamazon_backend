class Inventory < ApplicationRecord
  belongs_to :store
  has_many :items, dependent: :destroy
  has_many :orders, through: :items
end
