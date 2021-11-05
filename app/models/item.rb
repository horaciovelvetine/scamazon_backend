class Item < ApplicationRecord
  belongs_to :inventory
  belongs_to :category
  belongs_to :order
  belongs_to :shopping_cart
end
