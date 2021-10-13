class Order < ApplicationRecord
  belongs_to :store
  belongs_to :user
  has_many :items
end
