class Store < ApplicationRecord
  belongs_to :user
  has_one :inventory
  has_many :items, through: :inventory
  has_many :orders, through: :items
  has_many :users, through: :orders, class_name: "Customers"
end
