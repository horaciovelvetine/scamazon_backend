class Store < ApplicationRecord
  has_one :inventory
  has_many :items, through: :inventory
  has_many :orders, through: :items
  has_many :customers, through: :orders, source: :user
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
end
