class Inventory < ApplicationRecord
  belongs_to :store
  
  has_many :items
  has_many :orders, through: :items
end
